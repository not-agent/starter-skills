# Library Map

이 문서는 프로젝트 요구에 맞는 라이브러리 후보를 빠르게 좁히기 위한 지도다. 자동 선택표가 아니다.

실제 설치 전에는 공식 문서와 현재 버전을 확인한다. 이 문서는 최신 API 문서가 아니라 "무엇을 검토할지"를 줄이는 참고 자료다.

## 사용 원칙

- 기본값은 작게 둔다. 필요가 생긴 뒤 추가한다.
- 이미 프로젝트가 쓰는 도구가 있으면 기존 선택을 우선한다.
- 라이브러리는 사용자가 볼 수 있는 완성도, 반복 구현 안정성, 유지보수성을 높일 때만 추가한다.
- 외부 서비스, 인증, ORM, 상태관리, 데이터 패칭 라이브러리는 기본값이 아니다.
- 데모/MVP는 "있으면 좋아 보이는 기능"보다 실행 가능성과 검증 가능성을 우선한다.
- 한 번에 이 문서 전체를 읽지 않는다. 필요한 카테고리만 참고한다.

## 기본 묶음

화면이 있는 Next.js 앱의 기본 후보:

- Next.js App Router
- TypeScript
- Tailwind CSS
- shadcn/ui
- lucide-react

조건부 기본 후보:

- 입력 검증이 있으면 Zod
- 필드가 많거나 오류 표시가 복잡하면 React Hook Form
- 차트가 있으면 Recharts
- 정렬, 필터, 페이지네이션, 컬럼 표시/숨김이 필요하면 TanStack Table
- 파일 DB가 필요하면 SQLite 파일과 작은 DB helper
- 테이블 관계, 마이그레이션, 타입 안전한 SQL 이득이 커지면 Drizzle ORM

명확한 요구 없이 기본으로 넣지 않는 것:

- Auth.js, Clerk, Supabase Auth 같은 인증
- Prisma, Drizzle ORM 같은 ORM
- TanStack Query, SWR 같은 서버 상태 라이브러리
- Zustand, Jotai, Redux Toolkit 같은 클라이언트 상태관리
- PostgreSQL, MySQL 같은 외부 DB
- Redis, BullMQ 같은 외부 인프라

## UI

### shadcn/ui
- 쓸 때: Next.js + Tailwind 기반 MVP에서 버튼, 입력, 카드, 다이얼로그, 테이블 같은 기본 UI 품질이 필요할 때
- 쓰지 않을 때: 기존 디자인 시스템이 있거나 단일 HTML 도구처럼 UI가 매우 작을 때
- 기본값: 화면 있는 Next.js 앱이면 우선 고려

### Radix UI
- 쓸 때: 접근성 있는 headless component primitive가 필요하고 직접 스타일링할 때
- 쓰지 않을 때: shadcn/ui만으로 충분할 때
- 기본값: shadcn/ui 아래에서 간접 사용

### React Aria
- 쓸 때: 복잡한 접근성 요구가 있는 컴포넌트를 직접 만들 때
- 쓰지 않을 때: 일반적인 업무 도구 UI일 때
- 기본값: 아님

### MUI
- 쓸 때: 이미 MUI를 쓰는 조직, 많은 enterprise component가 빠르게 필요할 때
- 쓰지 않을 때: Tailwind/shadcn 기반으로 가볍게 만들 때
- 기본값: 아님

### Ant Design
- 쓸 때: 테이블, 폼, 관리자 화면 중심의 전통적인 업무 시스템을 빠르게 만들 때
- 쓰지 않을 때: 커스텀 디자인이나 Tailwind 기반 UI를 원할 때
- 기본값: 아님

## Icons and Styling

### lucide-react
- 쓸 때: 버튼, 메뉴, 상태 표시 아이콘이 필요할 때
- 쓰지 않을 때: 아이콘이 거의 없는 텍스트 중심 도구일 때
- 기본값: shadcn/ui와 함께 우선 고려

### Heroicons
- 쓸 때: Tailwind UI 계열의 간단한 outline/solid icon이 필요할 때
- 쓰지 않을 때: lucide-react로 이미 충분할 때
- 기본값: 아님

### clsx
- 쓸 때: 조건부 className 조합이 필요할 때
- 쓰지 않을 때: className이 거의 고정일 때
- 기본값: UI가 조금만 복잡해져도 고려

### tailwind-merge
- 쓸 때: Tailwind class 충돌을 병합해야 할 때
- 쓰지 않을 때: class 조합이 단순할 때
- 기본값: shadcn/ui 스타일 유틸과 함께 고려

### class-variance-authority
- 쓸 때: 버튼, badge, input variant를 체계적으로 관리할 때
- 쓰지 않을 때: variant가 한두 개뿐일 때
- 기본값: shadcn/ui component 패턴을 직접 확장할 때 고려

## Forms and Validation

### Zod
- 쓸 때: 폼 입력, API payload, env 값을 검증할 때
- 쓰지 않을 때: 입력이 거의 없거나 TypeScript 타입만으로 충분할 때
- 기본값: 입력 검증이 있으면 우선 고려

### Valibot
- 쓸 때: 가벼운 schema validation이 필요하고 bundle size를 더 신경 쓸 때
- 쓰지 않을 때: 팀이 Zod에 익숙하거나 Zod 생태계를 이미 쓰는 경우
- 기본값: 아님

### React Hook Form
- 쓸 때: 필드가 많거나 validation, dirty state, error display가 복잡할 때
- 쓰지 않을 때: 입력 한두 개의 간단한 form일 때
- 기본값: 조건부

## Tables and Data Grids

### shadcn/ui Table
- 쓸 때: 단순 표, 작은 데이터, 정렬/필터가 거의 없을 때
- 쓰지 않을 때: 페이지네이션, 컬럼 제어, 복잡한 필터가 필요할 때
- 기본값: 단순 표의 시작점

### TanStack Table
- 쓸 때: 정렬, 필터, 페이지네이션, 컬럼 표시/숨김, row selection이 필요할 때
- 쓰지 않을 때: 정적 표나 카드 목록이면 충분할 때
- 기본값: 표 기능이 명확할 때만

### AG Grid
- 쓸 때: Excel 같은 고기능 grid, 대량 데이터, enterprise grid 기능이 필요할 때
- 쓰지 않을 때: MVP 수준의 업무 표일 때
- 기본값: 아님

## Charts and Dashboards

### Recharts
- 쓸 때: 카드형 dashboard, line/bar/pie 같은 일반 차트가 필요할 때
- 쓰지 않을 때: 매우 복잡한 interaction이나 커스텀 chart grammar가 필요할 때
- 기본값: dashboard MVP의 우선 후보

### Apache ECharts
- 쓸 때: 복잡한 chart option, 대량 데이터 시각화, heatmap/graph 등 넓은 chart coverage가 필요할 때
- 쓰지 않을 때: 기본 업무 dashboard일 때
- 기본값: 아님

### Nivo
- 쓸 때: React 기반의 보기 좋은 chart catalog와 rich chart가 필요할 때
- 쓰지 않을 때: bundle size나 단순성이 더 중요할 때
- 기본값: 아님

### visx
- 쓸 때: 차트 primitive를 낮은 수준에서 조합해 커스텀 시각화를 만들 때
- 쓰지 않을 때: 일반 dashboard 차트일 때
- 기본값: 아님

## Dates, Calendars, and Time

### date-fns
- 쓸 때: 날짜 포맷, 계산, 비교를 함수 단위로 처리할 때
- 쓰지 않을 때: 브라우저 `Intl`만으로 충분할 때
- 기본값: 날짜 계산이 많을 때 고려

### Day.js
- 쓸 때: Moment 스타일 API가 익숙하고 가벼운 date utility가 필요할 때
- 쓰지 않을 때: 함수형 utility가 더 맞을 때
- 기본값: 아님

### react-day-picker
- 쓸 때: date picker UI가 필요할 때
- 쓰지 않을 때: 날짜 입력이 단순한 text/date input이면 충분할 때
- 기본값: shadcn/ui calendar 패턴과 함께 고려

### FullCalendar
- 쓸 때: 월/주/일 calendar, 일정 drag/drop, scheduler 성격이 필요할 때
- 쓰지 않을 때: 단순 날짜 선택이나 목록이면 충분할 때
- 기본값: 아님

## State and Data Fetching

### React state and URL state
- 쓸 때: 단순 UI state, filter/search/sort state를 URL에 남기면 충분할 때
- 쓰지 않을 때: 여러 화면이 공유하는 복잡한 client state가 있을 때
- 기본값: 먼저 고려

### Zustand
- 쓸 때: 작은 전역 client state가 필요하고 Redux가 과할 때
- 쓰지 않을 때: server data나 URL state로 충분할 때
- 기본값: 아님

### Jotai
- 쓸 때: atom 단위의 작은 상태 조합이 잘 맞을 때
- 쓰지 않을 때: 상태 모델이 단순하거나 팀이 익숙하지 않을 때
- 기본값: 아님

### Redux Toolkit
- 쓸 때: Redux를 이미 쓰는 팀, 복잡한 client state와 명시적 reducer 흐름이 필요할 때
- 쓰지 않을 때: 작은 MVP나 단순 업무 도구일 때
- 기본값: 아님

### TanStack Query
- 쓸 때: API 호출 cache, refetch, optimistic update, server state 관리가 필요할 때
- 쓰지 않을 때: Next.js Server Actions/Route Handlers와 단순 fetch로 충분할 때
- 기본값: 아님

### SWR
- 쓸 때: 간단한 client-side server state cache와 revalidation이 필요할 때
- 쓰지 않을 때: server rendering이나 Server Actions로 충분할 때
- 기본값: 아님

## Storage and Database

### SQLite file
- 쓸 때: 한 PC나 내부 서버에서 작은 업무 데이터를 파일 DB로 저장할 때
- 쓰지 않을 때: 여러 서버가 동시에 같은 DB를 써야 할 때
- 기본값: 사내 demo/MVP 저장소의 우선 후보

### better-sqlite3
- 쓸 때: Node.js에서 동기 SQLite 접근이 단순하고 충분할 때
- 쓰지 않을 때: Edge runtime이나 async driver가 필요한 환경일 때
- 기본값: SQLite helper 후보

### sqlite
- 쓸 때: async SQLite API가 필요할 때
- 쓰지 않을 때: 동기 helper가 더 단순할 때
- 기본값: 조건부

### sql.js
- 쓸 때: 브라우저 안에서 SQLite를 다뤄야 할 때
- 쓰지 않을 때: 서버에서 SQLite 파일을 쓸 수 있을 때
- 기본값: 아님

### Drizzle ORM
- 쓸 때: TypeScript SQL, relation, migration, schema 관리가 실제 이득일 때
- 쓰지 않을 때: 테이블이 적고 명시 SQL + 작은 helper로 충분할 때
- 기본값: 아님

### Prisma
- 쓸 때: 팀이 Prisma에 익숙하고 DB schema/migration/client workflow가 필요할 때
- 쓰지 않을 때: SQLite demo, 단순 SQL, 작은 내부 도구일 때
- 기본값: 아님

### Kysely
- 쓸 때: SQL을 직접 유지하면서 type-safe query builder가 필요할 때
- 쓰지 않을 때: query가 단순하거나 ORM workflow가 더 맞을 때
- 기본값: 아님

## CSV, Excel, and Data Files

### Papa Parse
- 쓸 때: 브라우저나 Node에서 CSV parse/unparse가 필요할 때
- 쓰지 않을 때: 작은 서버 CSV를 Node stream으로 처리하는 게 더 맞을 때
- 기본값: CSV import/export 후보

### csv-parse and csv-stringify
- 쓸 때: Node.js에서 CSV stream 처리나 서버 측 변환이 필요할 때
- 쓰지 않을 때: 브라우저 중심 CSV 처리일 때
- 기본값: 조건부

### ExcelJS
- 쓸 때: `.xlsx` 생성, sheet, style, workbook 조작이 필요할 때
- 쓰지 않을 때: CSV로 충분할 때
- 기본값: 아님

### SheetJS
- 쓸 때: 다양한 spreadsheet 파일 읽기/쓰기 호환성이 필요할 때
- 쓰지 않을 때: 간단한 xlsx 생성만 필요할 때
- 기본값: 아님

## Documents and PDF

### pdf-lib
- 쓸 때: 기존 PDF 수정, 병합, form filling, page 조작이 필요할 때
- 쓰지 않을 때: HTML 화면을 PDF로 렌더링하는 것이 목적일 때
- 기본값: PDF 조작 후보

### PDF.js
- 쓸 때: 브라우저에서 PDF를 보여주거나 텍스트 추출이 필요할 때
- 쓰지 않을 때: 서버에서 PDF 생성만 할 때
- 기본값: 아님

### react-pdf
- 쓸 때: React component로 PDF 문서를 생성해야 할 때
- 쓰지 않을 때: 브라우저 print CSS나 서버 HTML-to-PDF가 더 단순할 때
- 기본값: 아님

### docx
- 쓸 때: Word `.docx` 파일을 생성해야 할 때
- 쓰지 않을 때: Markdown, PDF, HTML로 충분할 때
- 기본값: 아님

## Markdown and Rich Text

### react-markdown
- 쓸 때: Markdown을 React로 안전하게 렌더링할 때
- 쓰지 않을 때: 단순 plain text 출력이면 충분할 때
- 기본값: Markdown display 후보

### remark and rehype
- 쓸 때: Markdown/HTML AST 변환, plugin pipeline이 필요할 때
- 쓰지 않을 때: 렌더링만 하면 될 때
- 기본값: 조건부

### MDX
- 쓸 때: 문서 안에 React component를 섞어야 할 때
- 쓰지 않을 때: 일반 Markdown이면 충분할 때
- 기본값: 아님

### Tiptap
- 쓸 때: Notion 같은 rich text editor, extension 기반 편집기가 필요할 때
- 쓰지 않을 때: textarea나 Markdown editor로 충분할 때
- 기본값: 아님

### Lexical
- 쓸 때: 복잡한 editor를 낮은 수준에서 구성하고 장기 유지할 때
- 쓰지 않을 때: 빠른 MVP editor가 필요할 때
- 기본값: 아님

## Search

### Fuse.js
- 쓸 때: 작은 배열이나 client-side fuzzy search가 필요할 때
- 쓰지 않을 때: 데이터가 크거나 서버 검색이 필요할 때
- 기본값: 작은 로컬 검색 후보

### MiniSearch
- 쓸 때: 브라우저/Node에서 작은 full-text index가 필요할 때
- 쓰지 않을 때: typo tolerance나 서버 검색 엔진이 필요할 때
- 기본값: 조건부

### FlexSearch
- 쓸 때: 빠른 client-side full-text search가 필요할 때
- 쓰지 않을 때: 구현 단순성이 더 중요할 때
- 기본값: 조건부

### Meilisearch
- 쓸 때: 별도 검색 서버를 둘 수 있고 typo-tolerant search가 중요할 때
- 쓰지 않을 때: 외부 서비스/서버 추가가 부담일 때
- 기본값: 아님

### Typesense
- 쓸 때: 별도 검색 서버와 typed schema 기반 검색이 필요할 때
- 쓰지 않을 때: 작은 MVP 검색일 때
- 기본값: 아님

## File Upload and Images

### react-dropzone
- 쓸 때: drag-and-drop file upload UI가 필요할 때
- 쓰지 않을 때: 기본 file input이면 충분할 때
- 기본값: 조건부

### Uppy
- 쓸 때: 진행률, 복수 파일, resumable upload, 다양한 source가 필요할 때
- 쓰지 않을 때: 단순 파일 업로드일 때
- 기본값: 아님

### sharp
- 쓸 때: Node.js에서 이미지 resize, format convert, thumbnail 생성이 필요할 때
- 쓰지 않을 때: Next.js Image나 CSS 처리로 충분할 때
- 기본값: 서버 이미지 처리 후보

### browser-image-compression
- 쓸 때: 업로드 전 브라우저에서 이미지 용량을 줄여야 할 때
- 쓰지 않을 때: 서버에서 처리할 수 있을 때
- 기본값: 조건부

## Maps and Location

### Leaflet / React Leaflet
- 쓸 때: 일반 지도 표시, marker, polygon 같은 기본 GIS UI가 필요할 때
- 쓰지 않을 때: vector tile, 고급 스타일링, 대량 지도 데이터가 필요할 때
- 기본값: 단순 지도 후보

### MapLibre GL JS
- 쓸 때: vector map, custom style, 자체 tile/open map stack이 필요할 때
- 쓰지 않을 때: 단순 위치 표시만 필요할 때
- 기본값: 아님

### Mapbox GL JS
- 쓸 때: Mapbox 서비스를 쓰기로 했고 고급 지도 UI가 필요할 때
- 쓰지 않을 때: 외부 유료 서비스 의존을 피해야 할 때
- 기본값: 아님

## Realtime and Background Work

### Server-Sent Events
- 쓸 때: 서버에서 클라이언트로 단방향 진행 상황이나 log stream을 보낼 때
- 쓰지 않을 때: 양방향 realtime이 필요할 때
- 기본값: 단순 진행률/로그 stream 후보

### ws
- 쓸 때: Node.js에서 낮은 수준의 WebSocket이 필요할 때
- 쓰지 않을 때: rooms, reconnection 같은 기능을 직접 만들기 싫을 때
- 기본값: 아님

### Socket.IO
- 쓸 때: 양방향 realtime, reconnection, rooms 같은 기능이 필요할 때
- 쓰지 않을 때: 단순 server push면 SSE로 충분할 때
- 기본값: 아님

### node-cron
- 쓸 때: 한 프로세스 안에서 단순 예약 작업을 돌릴 때
- 쓰지 않을 때: 분산 작업, 재시도, 내구성이 필요할 때
- 기본값: 작은 내부 도구 후보

### BullMQ
- 쓸 때: Redis 기반 job queue, retry, worker 분리가 필요할 때
- 쓰지 않을 때: Redis를 추가하기 부담스럽거나 데모 수준일 때
- 기본값: 아님

## Auth, Email, and External Services

### Auth.js
- 쓸 때: Next.js 앱에서 여러 OAuth provider와 session 관리가 필요할 때
- 쓰지 않을 때: 교육용 데모나 사내망 MVP에서 인증이 범위 밖일 때
- 기본값: 아님

### Better Auth
- 쓸 때: 앱 내부 인증을 직접 구성하고 TypeScript 중심 auth library를 검토할 때
- 쓰지 않을 때: 외부 hosted auth가 더 적합할 때
- 기본값: 아님

### Clerk
- 쓸 때: hosted auth, 조직/사용자 관리 UI까지 빠르게 붙일 때
- 쓰지 않을 때: 외부 SaaS 의존을 피해야 할 때
- 기본값: 아님

### Supabase
- 쓸 때: Postgres, Auth, Storage, Realtime을 한 서비스로 쓰기로 했을 때
- 쓰지 않을 때: 로컬 파일 DB나 사내망 단일 PC 실행이 목표일 때
- 기본값: 아님

### Resend
- 쓸 때: transactional email을 API로 보내야 할 때
- 쓰지 않을 때: 이메일 발송이 MVP 범위가 아닐 때
- 기본값: 아님

### Nodemailer
- 쓸 때: SMTP 서버가 이미 있고 직접 이메일을 보내야 할 때
- 쓰지 않을 때: email provider API가 더 단순할 때
- 기본값: 아님

## Testing and Automation

### Vitest
- 쓸 때: TypeScript/React 프로젝트에서 빠른 unit test가 필요할 때
- 쓰지 않을 때: 테스트보다 브라우저 확인이 먼저인 작은 UI demo일 때
- 기본값: 로직이 있으면 고려

### Testing Library
- 쓸 때: React component를 사용자 행동 중심으로 테스트할 때
- 쓰지 않을 때: E2E 테스트가 더 직접적인 검증일 때
- 기본값: 조건부

### Playwright
- 쓸 때: 실제 브라우저에서 핵심 사용자 흐름을 확인할 때
- 쓰지 않을 때: CLI나 서버 로직만 있는 프로젝트일 때
- 기본값: 화면 앱 검증 후보

### MSW
- 쓸 때: API mock이 필요한 UI test나 story 환경을 만들 때
- 쓰지 않을 때: 실제 API/DB를 쓰는 통합 확인이 더 단순할 때
- 기본값: 아님

## Utilities

### ts-pattern
- 쓸 때: 복잡한 분기와 discriminated union을 명확하게 다룰 때
- 쓰지 않을 때: 단순 if/switch면 충분할 때
- 기본값: 아님

### lodash-es
- 쓸 때: 배열/객체 변환 utility가 반복적으로 필요할 때
- 쓰지 않을 때: 표준 JS로 충분할 때
- 기본값: 아님

### nanoid
- 쓸 때: 짧고 충돌 가능성이 낮은 id가 필요할 때
- 쓰지 않을 때: DB id나 `crypto.randomUUID()`로 충분할 때
- 기본값: 조건부

### pino
- 쓸 때: 서버 로그를 구조화해서 남겨야 할 때
- 쓰지 않을 때: 작은 데모에서 console log로 충분할 때
- 기본값: 아님

### dotenv
- 쓸 때: Node script에서 `.env`를 직접 읽어야 할 때
- 쓰지 않을 때: Next.js 같은 framework가 env loading을 이미 처리할 때
- 기본값: 조건부

