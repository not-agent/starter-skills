# MVP 라이브러리 묶음

이 문서는 `write-prd`가 이미 결정된 앱 형태와 데이터 필요에 맞춰 최소 기술 전제를 정리할 때 읽는다.

## 원칙

- 라이브러리는 사용자가 볼 수 있는 완성도나 반복 구현 안정성을 높일 때만 넣는다.
- 모든 프로젝트에 DB, 상태관리(state management), 데이터 패칭(data fetching) 라이브러리를 넣지 않는다.
- 이미 프로젝트가 쓰는 스택이 있으면 기존 선택을 우선한다.
- 환경 전제는 Node.js, Python, Git이다. 별도 시스템 도구나 외부 서비스를 기본값으로 요구하지 않는다.
- 실습과 교육의 기본 관심사는 SaaS 연동이 아니라 UI와 앱 기능을 덜 허술하게 만드는 라이브러리 선택이다.
- 사내망 앱의 공유 주소는 `localhost`가 아니라 `http://<사내망 IPv4>:3000`이다.

## 기본 UI 묶음

화면이 있는 Next.js 프로젝트의 기본값:

- Next.js App Router
- TypeScript
- Tailwind CSS
- shadcn/ui
- lucide-react

이 묶음은 괜찮은 MVP처럼 보이는 기본 버튼, 입력, 카드, 탭, 다이얼로그, 테이블, 아이콘을 빠르게 만들기 위한 것이다.

## 조건부 추가

- 입력 검증이 있으면 Zod를 쓴다.
- 필드가 많거나 오류 표시가 복잡한 폼이면 React Hook Form을 추가한다.
- 차트가 있으면 Recharts를 추가한다.
- 단순 표는 shadcn/ui Table로 시작한다.
- 정렬, 필터, 페이지네이션, 컬럼 표시/숨김이 필요하면 TanStack Table을 추가한다.
- SQLite 파일 저장이 필요하면 먼저 단순 SQLite 접근과 작은 DB helper로 시작한다.
- Drizzle ORM은 테이블 관계, 마이그레이션, 타입 안전한 쿼리가 실제 이득일 때만 추가한다.
- 명령 팔레트, toast, drag-and-drop, resizable panel, calendar 같은 사용자가 바로 체감하는 UI 기능은 직접 만들기 전에 적절한 라이브러리를 검토한다.

## 기본값에서 제외

명확한 요구가 없으면 추가하지 않는다.

- Prisma
- TanStack Query
- Zustand, Redux 같은 전역 상태관리
- PostgreSQL, MySQL 같은 외부 DB
- 백그라운드 작업 큐
- 인증, 결제, 메일 발송, hosted DB 같은 서비스 연동

## UI 완성도 기준

사내 업무 도구는 마케팅 랜딩 페이지처럼 만들지 않는다. 조용하고 읽기 쉬운 화면을 우선한다.

- 첫 화면에서 현재 상태와 다음 행동이 보여야 한다.
- 빈 상태(empty state), 로딩 상태(loading state), 오류 상태(error state)를 둔다.
- 버튼과 입력은 같은 크기와 간격을 유지한다.
- 숫자, 날짜, 상태값은 표나 카드에서 스캔하기 쉽게 정렬한다.
- 모바일보다 데스크톱 사내 PC 사용을 우선하되, 작은 화면에서 깨지지 않게 한다.
