# 사내 대시보드 preset

## 사용할 때

- 임직원이 같은 사내망에서 지표, 현황, 차트, 표를 본다.
- 데이터는 CSV, 내부 API, 정적 JSON, SQLite 중 하나에서 온다.
- 입력보다 조회와 필터가 중심이다.

## 기본 스택

- 화면(UI): Next.js App Router
- 언어(Language): TypeScript
- 스타일(Styling): Tailwind CSS
- UI: shadcn/ui
- 아이콘(Icons): lucide-react
- 차트(Charts): Recharts
- 표(Table): shadcn/ui Table로 시작한다.

## 조건부 추가

- 정렬, 필터, 페이지네이션, 컬럼 표시/숨김이 필요하면 TanStack Table을 추가한다.
- 사용자가 파일을 업로드해 보고서를 만들면 [preset-data-report.md](./preset-data-report.md)를 우선 검토한다.
- 대시보드 설정이나 스냅샷 저장이 필요하면 SQLite 파일 저장을 추가한다. Drizzle ORM은 관계나 마이그레이션이 필요할 때만 추가한다.

## 사내망 실행

공유 실행은 `npm run build` 후 `npm run start`다.

다른 사람이 접속할 주소:

```text
http://<사내망 IPv4>:3000
```

`localhost`를 공유 주소로 안내하지 않는다.

## 완료 기준 예시

- 다른 PC에서 `http://<사내망 IPv4>:3000`으로 접속해 첫 화면을 볼 수 있다.
- 주요 숫자 카드, 차트, 표가 같은 데이터 기준으로 표시된다.
- 데이터가 없을 때 빈 상태(empty state)가 보인다.
- 데이터 로딩이나 오류 상태가 사용자에게 보인다.
