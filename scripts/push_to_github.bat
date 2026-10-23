@echo off
chcp 65001 > nul
echo ========================================================
echo [vpsat GitHub 원클릭 안전 동기화 스크립트]
echo 저장소: https://github.com/dansarang99/vpsat
echo 보안규격: AES-256 / PBKDF2 마스터 암호 (dansarang)
echo ========================================================
echo.

cd /d "%~dp0\.."

echo 1. 원격 저장소 URL 동기화 (vpsat)...
git remote set-url origin https://github.com/dansarang99/vpsat.git

echo.
echo 2. 보안 번들 최신화 확인...
python prompt/pack_secure_bundle.py

echo.
echo 3. Git 스테이징 및 커밋...
git add README.md unlock_bundle.py unlock.bat vpast_es100_secure_bundle.bin scripts/push_to_github.bat .gitignore
git commit -m "feat(security): update vpsat secure bundle with master password (dansarang)"

echo.
echo 4. GitHub 원격 저장소(main & vpast_es100)로 Push 진행...
git push origin vpast_es100:main
git push -u origin vpast_es100

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo [성공] GitHub(https://github.com/dansarang99/vpsat)에
    echo 보안 번들과 해제 도구가 성공적으로 안전하게 푸시되었습니다!
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo [안내] GitHub 푸시 중 문제가 발생했습니다.
    echo 인터넷 연결 또는 GitHub 권한을 확인해주세요.
    echo ========================================================
)
pause
