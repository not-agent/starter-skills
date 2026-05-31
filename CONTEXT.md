# Starter Skills

AI 코딩 에이전트와 작은 프로젝트를 시작하고 유지하기 위한 스킬팩(skill pack)이다. 스킬은 설정, 아이디어 확인, 제품 문서, 구현 순서, 디자인 기준, 진단, 리팩터링의 역할을 분리한다.

## 용어 (Language)

**프로젝트 설정(Project Setup)**:
스킬들이 프로젝트마다 읽는 기본 설정. 문서 위치, 실행 명령, OS별 Shell, 네트워크 URL, 환경 전제를 포함한다. `setup-project`가 기본값으로 바로 작성한다.
_피할 표현(Avoid)_: 초기 기획, PRD, 기술 스택 결정

**사용자 URL(User URL)**:
사용자에게 안내하거나 다른 기기에서 접속할 주소. 기본값은 `http://<network IPv4>:3000` 형식의 네트워크 주소다.
_피할 표현(Avoid)_: localhost, local URL, dev server URL

**PRD**:
무엇을 왜 누구를 위해 만들기로 했는지 기록하는 제품 결정 문서. 구현 계획이나 파일 변경 목록이 아니다.
_피할 표현(Avoid)_: TODO, 구현 계획, 코드 작업 목록

**TODO**:
`PRD.md`에서 나온 구현 순서. 기술 계층(layer)이 아니라 사용자가 볼 수 있는 결과(user-visible outcome)로 쓴다.
_피할 표현(Avoid)_: 이슈, 티켓, 백로그, DB/API/프론트엔드 작업 목록

**프로젝트 맥락(Project Context)**:
프로젝트 안에서 안정적으로 쓰는 도메인 용어와 피해야 할 동의어. 필요할 때만 `CONTEXT.md`에 둔다.
_피할 표현(Avoid)_: 요구사항 문서, 결정 기록, 기억 저장소

**디자인 기준(Design Reference)**:
색, 글꼴, 간격, 컴포넌트 분위기 같은 시각 기준. `DESIGN.md`에 둔다.
_피할 표현(Avoid)_: PRD, 기능 명세

**사내망 앱(Intranet App)**:
같은 회사 내부망이나 같은 네트워크에서 여러 명이 접속하는 앱. **사용자 URL(User URL)**은 `localhost`가 아니라 `http://<사내망 IPv4>:3000` 형식이다.

**앱 형태(App Shape)**:
프로젝트가 어떤 종류의 앱인지 나타내는 큰 분류. 예: 저장 없는 UI, 대시보드, CRUD 업무 앱, 백엔드/API, 데이터 리포트.

**기술 전제(Technical Baseline)**:
이미 결정된 실행 방식, 저장 방식, 주요 라이브러리 전제. `setup-project`가 고르지 않고, 아이디어가 충분히 정리된 뒤 `write-prd`가 필요한 경우에만 기록한다.
_피할 표현(Avoid)_: 기본 스택, 항상 쓰는 preset

**라이브러리 지도(Library Map)**:
요구에 맞는 라이브러리 후보를 좁히는 참고 문서. `skills/write-prd/references/LIBRARY_MAP.md`에 둔다. 최신 API 문서, 설치 가이드, SaaS 후보표가 아니다.
_피할 표현(Avoid)_: 추천 순위표, 기본 설치 목록, 최신 문서, 서비스 카탈로그

## 관계 (Relationships)

- `setup-project`는 **프로젝트 설정(Project Setup)**만 작성한다.
- **프로젝트 설정(Project Setup)**은 **사용자 URL(User URL)**을 네트워크 주소 형식으로 기록한다.
- `clarify-idea`는 요청이 흐릿할 때만 **앱 형태(App Shape)**, 데이터 필요, 성공 기준 같은 결정을 한 질문씩 좁힌다. 파일은 쓰지 않는다.
- `write-prd`는 결정된 내용을 **PRD**에 기록하고, 필요할 때만 **기술 전제(Technical Baseline)**를 포함한다.
- **기술 전제(Technical Baseline)**를 정리할 때는 필요한 경우 **라이브러리 지도(Library Map)**의 관련 카테고리만 참고한다.
- `write-todo`는 **PRD**를 **TODO**로 나눈다.
- `apply-design`은 **디자인 기준(Design Reference)**을 `DESIGN.md`에 기록하거나 적용한다.

## 애매한 표현 (Flagged Ambiguities)

- "setup"이 프로젝트 설정과 제품/기술 결정을 모두 뜻하는 것처럼 쓰였다. 결정: `setup-project`는 **프로젝트 설정(Project Setup)**만 다룬다.
- `clarify-idea`는 PRD나 TODO를 쓰지 않는다. 새 프로젝트, 새 기능, 방향 전환에 모두 쓸 수 있지만 필수 시작 단계는 아니다.
- `TODO`는 GitHub Issue나 기술 계층별 체크리스트가 아니다. 사용자가 확인할 수 있는 결과로 쓴다.
- **사용자 URL(User URL)**이나 **사내망 앱(Intranet App)**의 공유 주소를 `localhost`로 안내하지 않는다.
- **라이브러리 지도(Library Map)**는 선택 후보를 좁히는 용도다. 라이브러리를 자동으로 추가하라는 뜻이 아니다.
