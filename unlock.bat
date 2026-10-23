@echo off
chcp 65001 > nul
echo ========================================================
echo [v_psat 보안 번들 잠금 해제 프로그램]
echo 비밀번호(dansarang)를 입력해야만 핵심 자산이 복호화됩니다.
echo ========================================================
echo.
python unlock_bundle.py
echo.
pause
