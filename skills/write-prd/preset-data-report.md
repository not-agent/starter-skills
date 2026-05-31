# 데이터 리포트 preset

## 사용할 때

- 사용자가 CSV, 엑셀, 붙여넣기 데이터, 내부 API 데이터를 가져온다.
- 앱이 데이터를 정리하고 표, 차트, 요약, 다운로드 결과를 보여준다.
- 장기 저장보다 분석 흐름과 결과 확인이 중요하다.

## 기본 스택

- 화면(UI): Next.js App Router
- 언어(Language): TypeScript
- 스타일(Styling): Tailwind CSS
- UI: shadcn/ui
- 아이콘(Icons): lucide-react
- 차트(Charts): Recharts
- 표(Table): shadcn/ui Table로 시작한다.
- 입력 검증(Validation): Zod

## 조건부 추가

- 정렬, 필터, 페이지네이션, 컬럼 표시/숨김이 필요하면 TanStack Table을 추가한다.
- 업로드한 데이터나 리포트 이력을 저장해야 하면 SQLite 파일 저장을 추가한다. Drizzle ORM은 관계나 마이그레이션이 필요할 때만 추가한다.
- 엑셀 파일을 직접 읽고 써야 하면 그때 전용 파서 라이브러리를 추가한다. CSV만 필요하면 먼저 단순한 CSV 흐름으로 시작한다.

## 화면 기준

- 업로드 또는 붙여넣기 영역이 있다.
- 데이터 미리보기(preview)가 있다.
- 오류 행이나 누락 값을 사용자에게 보여준다.
- 결과 요약 카드와 표를 보여준다.
- 필요한 경우 다운로드 버튼을 둔다.

## 사내망 실행

다른 사람이 접속할 주소:

```text
http://<사내망 IPv4>:3000
```

`localhost`를 공유 주소로 안내하지 않는다.
