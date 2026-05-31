# 저장 없는 UI preset

## 사용할 때

- 계산기, 생성기, 체크리스트, 변환기, 간단한 내부 도구다.
- 서버 저장이 필요 없다.
- 새로고침 후 데이터가 사라져도 된다.
- 사용자별 개인 설정 정도만 브라우저 저장소에 둘 수 있다.

## 기본 스택

- 화면(UI): Next.js App Router
- 언어(Language): TypeScript
- 스타일(Styling): Tailwind CSS
- UI: shadcn/ui
- 아이콘(Icons): lucide-react
- 저장(Storage): 없음. 필요한 경우 `localStorage`만 사용한다.

## 실행

```json
{
  "scripts": {
    "dev": "next dev -H 0.0.0.0 -p 3000",
    "build": "next build",
    "start": "next start -H 0.0.0.0 -p 3000"
  }
}
```

사내망에서 공유하면 사용자 주소는 `http://<사내망 IPv4>:3000`이다.

## 피할 것

- DB를 미리 넣지 않는다.
- 인증(auth)을 미리 넣지 않는다.
- API route를 빈 껍데기로 만들지 않는다.
- 전역 상태관리 라이브러리를 기본으로 넣지 않는다.
