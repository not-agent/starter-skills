# 사내 CRUD + SQLite preset

## 사용할 때

- 회사 내부망이나 같은 네트워크에서 여러 명이 접속한다.
- 목록, 생성, 수정, 삭제, 검색이 중심이다.
- 별도 클라우드 배포 없이 한 PC나 내부 서버에서 실행한다.
- 데이터가 작고 단순해서 파일 DB로 충분하다.
- Windows에서 PowerShell 대신 CMD 기준 명령이 필요하다.

## 기본 스택

- 화면(UI): Next.js App Router
- 서버 로직(Server Logic): Next.js Server Actions / Route Handlers
- 입력 검증(Validation): Zod
- 저장(Storage): SQLite 파일, 예: `data/app.db`
- DB 접근(Database Access): 단순 SQLite helper로 시작한다.
- UI: shadcn/ui
- 아이콘(Icons): lucide-react
- 실행(Runtime): Node.js
- 개발 실행(Dev): `npm run dev`
- 공유 실행(Start): `npm run build` 후 `npm run start`
- 접속(User URL): `http://<사내망 IPv4>:3000`

React Hook Form은 필드가 많거나 폼 오류 표시가 복잡할 때만 추가한다. Drizzle ORM은 테이블 관계, 마이그레이션, 타입 안전한 쿼리가 실제 이득일 때만 추가한다.

## package.json scripts

```json
{
  "scripts": {
    "dev": "next dev -H 0.0.0.0 -p 3000",
    "build": "next build",
    "start": "next start -H 0.0.0.0 -p 3000"
  }
}
```

`npm run start`는 `npm run build` 이후에 실행한다. 개발 중 수정 확인은 `npm run dev`를 쓴다.

## Windows CMD

IPv4 주소 확인:

```cmd
ipconfig
```

공유 실행:

```cmd
npm run build
npm run start
```

다른 사람이 접속할 주소:

```text
http://<IPv4 주소>:3000
```

`localhost`는 서버를 실행하는 같은 PC에서만 쓰는 주소다. 사내망에서 다른 사람에게 안내할 주소로 쓰지 않는다.

Windows 방화벽에서 Node.js 또는 3000번 포트의 개인 네트워크 접속을 허용해야 할 수 있다.

## SQLite 규칙

- DB 파일은 `data/app.db`처럼 명확한 프로젝트 폴더에 둔다.
- `.next`, `public`, 임시 폴더에는 DB 파일을 두지 않는다.
- DB 접근은 Server Actions 또는 Route Handlers 같은 서버 코드에서만 한다.
- 데모/MVP에서는 ORM 없이 작은 `db` helper와 명시적인 SQL로 시작해도 된다.
- Drizzle ORM은 테이블이 늘거나 마이그레이션 관리가 필요할 때만 추가한다.
- SQLite를 쓰는 코드는 Node.js runtime을 전제로 한다.
- 백업은 앱을 멈춘 뒤 DB 파일을 복사하는 방식으로 설명한다.

## 맞지 않는 경우

다음 경우에는 이 preset을 기본값으로 쓰지 않는다.

- 인터넷 공개 서비스가 필요하다.
- 동시에 많은 사용자가 쓰는 고부하 앱이다.
- 여러 서버에서 같은 DB를 공유해야 한다.
- 권한, 감사 로그, 개인정보 보호 요구가 강하다.
