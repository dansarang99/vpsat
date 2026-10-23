@echo off
chcp 65001 > nul
echo ========================================================
echo [v_psat GitHub 원클릭 안전 동기화 스크립트]
echo 저장소: https://github.com/dansarang99/v_psat
echo 보안규격: AES-256 / PBKDF2 마스터 암호 (dansarang)
echo ========================================================
echo.

cd /d "%~dp0\.."

echo 1. 원격 저장소 URL 동기화 (v_psat)...
git remote set-url origin https://github.com/dansarang99/v_psat.git

echo.
echo 2. 보안 번들 최신화 확인...
python prompt/pack_secure_bundle.py

echo.
echo 3. Git 스테이징 및 커밋...
git add README.md unlock_bundle.py unlock.bat vpast_es100_secure_bundle.bin scripts/push_to_github.bat .gitignore
git commit -m "feat(security): AES-256 secure bundle for v_psat with master password (dansarang)"

echo.
echo 4. GitHub 원격 저장소로 Push 시도 중...
echo (GitHub 로그인 창 또는 Personal Access Token 안내가 나타날 수 있습니다.)
git push -u origin vpast_es100

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo [성공] GitHub(https://github.com/dansarang99/v_psat)에
    echo 보안 번들과 해제 도구가 성공적으로 안전하게 푸시되었습니다!
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo [안내] GitHub에서 권한 확인이 필요합니다.
    echo 1. https://github.com/new 에서 'v_psat' 저장소가 생성되어 있는지 확인하세요.
    echo 2. Private(비공개) 저장소로 생성하시면 더욱 안전합니다.
    echo 3. 계정 인증(GitHub Personal Access Token)을 입력하시면 즉시 완료됩니다.
    echo ========================================================
)
pause
