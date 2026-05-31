# 백엔드/API preset

## 사용할 때

- 화면보다 API endpoint나 서버 로직이 중심이다.
- 다른 내부 도구, 스크립트, 자동화가 이 앱의 API를 호출한다.
- 관리용 최소 화면이나 상태 확인 화면만 있으면 된다.
- 저장이 필요할 수도 있고, 외부 API를 중계하기만 할 수도 있다.

## 기본 스택

- 서버(Server): Next.js Route Handlers
- 언어(Language): TypeScript
- 입력 검증(Validation): Zod
- 관리 화면(Admin UI): 필요할 때만 Next.js page + shadcn/ui
- 실행(Runtime): Node.js

## 저장이 필요할 때

데이터가 작고 단순하면 SQLite 파일 저장을 추가한다.

- SQLite 파일: `data/app.db`
- DB 접근: 단순 SQLite helper로 시작한다.
- DB 접근은 Route Handlers나 서버 함수에서만 한다.

저장이 필요 없으면 SQLite와 ORM을 넣지 않는다. Drizzle ORM은 테이블 관계, 마이그레이션, 타입 안전한 쿼리가 실제 이득일 때만 추가한다.

## Route Handlers와 Server Actions

- 외부에서 호출할 HTTP API는 Route Handlers로 만든다.
- 같은 Next.js UI 안의 폼 제출은 Server Actions로 처리할 수 있다.
- API 응답 형식과 오류 형식은 PRD나 `docs/agents/starter-skills.md`에 기록한다.

## 사내망 실행

```json
{
  "scripts": {
    "dev": "next dev -H 0.0.0.0 -p 3000",
    "build": "next build",
    "start": "next start -H 0.0.0.0 -p 3000"
  }
}
```

API 기본 주소:

```text
http://<사내망 IPv4>:3000/api/...
```

`localhost`를 다른 시스템이나 사용자에게 안내하지 않는다.

## 완료 기준 예시

- 같은 사내망의 다른 PC에서 API를 호출할 수 있다.
- 정상 응답과 오류 응답 예시가 문서에 있다.
- 저장이 있으면 DB 파일 위치와 백업 방법이 문서에 있다.
- 최소 상태 확인 endpoint나 화면이 있다.
