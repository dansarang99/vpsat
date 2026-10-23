@echo off
chcp 65001 > nul
echo ========================================================
echo [외교관후보자·외무고시 데일리 실전 모의고사 매일 06:00 자동 생성기]
echo ========================================================
echo.

cd /d "%~dp0\.."

echo [1/3] 오늘자 국내외 외교·안보 핫이슈 반영 120문항 생성 시작...
python prompt\daily_diplomatic_exam_generator.py

echo.
echo [2/3] Part 5 Vercel 글로벌 프로덕션 자동 배포...
cd /d "%~dp0\..\result\[060]_vercel_deploy_part5_diplomatic"
call npx vercel --prod --yes --scope leehankyus-projects

echo.
echo [3/3] 배포 완료! 사이트: https://psat-part5-daily-diplomatic.vercel.app
echo ========================================================
echo 데일리 모의고사 생성이 성공적으로 완료되었습니다.
