# 🏛️ PSAT & 외교관후보자 시스템 보안 저장소 [vpsat]

> **보안 공지**: 본 저장소(https://github.com/dansarang99/vpsat)는 대한민국 5급 공채 및 외교관후보자 선발시험 통합 교육·모의고사 플랫폼의 고유 지식재산권을 보호하기 위해 **강력한 AES-256 / PBKDF2 군사급 암호화**가 적용되어 있습니다.  
> **창작자의 고유 마스터 암호(`dansarang`) 없이는 어떠한 핵심 소스코드, 데일리 모의고사 생성 엔진, A4 시험지 컴파일러 및 셀프스터디 매뉴얼도 열람하거나 다운로드할 수 없습니다.**

---

## 🔒 보안 번들 잠금 해제 안내 (Unlock Guide)

본 저장소의 핵심 셀프스터디 매뉴얼(`SELF_STUDY_MASTER_MANUAL.md`), 데일리 120문항 모의고사 생성기(`daily_diplomatic_exam_generator.py`), 인사혁신처 A4 시험지 PDF 컴파일러(`build_daily_exam_pdf.py`), 3개국어 오디오북 웹 합성기(`generate_all_master_htmls_v3.py`)는 모두 **`vpast_es100_secure_bundle.bin`** 파일 내에 암호화되어 안전하게 잠겨 있습니다.

### 🔑 잠금 해제 방법 (Windows / Mac / Linux)

#### 방법 1. 윈도우 원클릭 해제 (권장)
- **`unlock.bat`** 파일을 더블 클릭한 후 마스터 암호(`dansarang`)를 입력하세요.

#### 방법 2. CLI 터미널 해제
```bash
python unlock_bundle.py
```
프롬프트가 나타나면 창작자 마스터 암호를 입력하세요:
```text
Enter Password (마스터 암호를 입력하세요): dansarang
```
암호 인증이 완료되면 즉시 `unlocked_vpast_es100/` 폴더가 생성되며, 모든 소스코드와 마스터 매뉴얼이 무손실로 복호화됩니다.

---

## 🌐 실시간 운영 글로벌 웹 포털 (Vercel)
- 🏆 **통합 그랜드 마스터 포털 (기출 44개 전개년도 + 데일리 모의고사 전체)**: [psat-master-trilingual-audiobook.vercel.app](https://psat-master-trilingual-audiobook.vercel.app)
- 📘 **PART 1 언어논리 (14개년)**: [psat-part1-verbal-logic.vercel.app](https://psat-part1-verbal-logic.vercel.app)
- 📊 **PART 2 자료해석 (15개년)**: [psat-part2-data-interpretation.vercel.app](https://psat-part2-data-interpretation.vercel.app)
- ⚖️ **PART 3 상황판단 (15개년)**: [psat-part3-situation-judgment.vercel.app](https://psat-part3-situation-judgment.vercel.app)
- 🌍 **PART 5 외교관후보자 데일리 모의고사 (매일 06:00 3과목 120문항)**: [psat-part5-daily-diplomatic.vercel.app](https://psat-part5-daily-diplomatic.vercel.app)

---
© 2026 dansarang99. All Rights Reserved. Authorized Access Only with Password (dansarang).
