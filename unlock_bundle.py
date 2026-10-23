# -*- coding: utf-8 -*-
"""
========================================================================================
PSAT & 외교관후보자 보안 번들 복호화 및 압축 해제기 (Security Decryptor & Extractor)
비밀번호(Password)를 입력해야만 셀프스터디 매뉴얼 및 핵심 엔진이 정상 복호화됩니다.
========================================================================================
"""
import os
import sys
import getpass
import zipfile
import hashlib
import hmac

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

BUNDLE_FILE = "vpast_es100_secure_bundle.bin"
MAGIC = b"VPSAT_SECURE_V1\n"

def derive_key(password: str, salt: bytes) -> bytes:
    return hashlib.pbkdf2_hmac('sha256', password.encode('utf-8'), salt, 100000, 32)

def xor_crypt(data: bytes, key: bytes) -> bytes:
    keystream = bytearray()
    block_idx = 0
    while len(keystream) < len(data):
        h = hashlib.sha256(key + block_idx.to_bytes(4, 'big')).digest()
        keystream.extend(h)
        block_idx += 1
    return bytes(a ^ b for a, b in zip(data, keystream[:len(data)]))

def unlock():
    if not os.path.exists(BUNDLE_FILE):
        print(f"[ERROR] 암호화 번들 파일({BUNDLE_FILE})을 찾을 수 없습니다.")
        sys.exit(1)

    print("========================================================")
    print("[PSAT Foreign Service System Secure Archive vpast_es100]")
    print("본 자료는 독점적 교육공학 지식재산권으로 암호화 보호 중입니다.")
    print("========================================================")
    
    # Prompt password
    try:
        if sys.stdin.isatty():
            user_pw = getpass.getpass("Enter Password (보안 암호를 입력하세요): ").strip()
        else:
            user_pw = sys.stdin.readline().strip()
    except Exception:
        user_pw = input("Enter Password (보안 암호를 입력하세요): ").strip()

    with open(BUNDLE_FILE, 'rb') as f:
        header = f.readline()
        if header != MAGIC:
            print("[ERROR] 올바른 보안 번들 형식이 아닙니다.")
            sys.exit(1)
        salt = f.read(16)
        expected_mac = f.read(32)
        ciphertext = f.read()

    key = derive_key(user_pw, salt)
    actual_mac = hmac.new(key, ciphertext, hashlib.sha256).digest()

    if not hmac.compare_digest(expected_mac, actual_mac):
        print("\n[ACCESS DENIED] 비밀번호가 일치하지 않습니다!")
        print("누구든 창작자의 허락(암호) 없이는 자료를 열람하거나 다운로드할 수 없습니다.")
        sys.exit(1)

    print("\n[ACCESS GRANTED] 암호 인증 성공! 자료를 복호화합니다...")
    plaintext = xor_crypt(ciphertext, key)

    temp_zip = "temp_unlocked.zip"
    with open(temp_zip, 'wb') as f:
        f.write(plaintext)

    with zipfile.ZipFile(temp_zip, 'r') as zf:
        zf.extractall("unlocked_vpast_es100")
        print(f"  -> 복호화 완료 디렉토리: unlocked_vpast_es100/")
        for name in zf.namelist():
            print(f"     * {name}")

    os.remove(temp_zip)
    print("\n[SUCCESS] 모든 셀프스터디 매뉴얼과 핵심 엔진이 안전하게 복원되었습니다.")

if __name__ == '__main__':
    unlock()
