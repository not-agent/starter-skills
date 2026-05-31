# Starter Skills

[![skills.sh](https://skills.sh/b/not-agent/starter-skills)](https://skills.sh/not-agent/starter-skills)

AI 코딩 에이전트와 함께 짧은 개인 프로젝트를 시작하고 끝내기 위한 최소 스킬팩(skill pack)이다.

AI 코딩은 보통 "일단 만들어줘"에서 시작할 수 있다. 하지만 프로젝트가 조금만 커져도 아이디어가 흔들리고, 문서와 실제 앱이 어긋나고, 버그를 추측으로 고치고, 코드 정리가 새 기능 구현과 섞인다.

이 스킬팩은 복잡한 개발 프로세스를 기본값으로 두지 않는다. GitHub 이슈(issue), 라벨(label), 마일스톤(milestone), 트리아지(triage)는 사용자가 명시적으로 원할 때만 쓴다. 기본값은 로컬 문서다: `PRD.md`, `TODO.md`, 필요할 때의 `CONTEXT.md`.

목표는 단순하다. 에이전트가 더 많이 하게 만드는 것이 아니라, 사용자가 원하는 것을 더 작고 분명하게 만들게 하는 것이다.

## 빠른 시작 (Quickstart)

1. skills.sh 설치 도구(installer)를 실행한다.

```bash
npx skills@latest add not-agent/starter-skills
```

2. 설치할 스킬과 사용할 코딩 에이전트(agent)를 고른다. 처음에는 `/setup-project`를 반드시 포함한다.

3. 새 프로젝트 루트(root)에서 `/setup-project`를 실행한다. 명령만 입력하면 기본 설정이 바로 기록된다. Windows는 CMD, macOS는 zsh, Linux/WSL은 bash를 기본 Shell로 둔다. 사용자 URL은 `http://<network IPv4>:3000` 형식의 네트워크 주소가 기본이다. 실행 명령 같은 조건이 있으면 `/setup-project npm run start 사용`처럼 덧붙인다. 앱 형태나 기술 스택은 이 단계에서 정하지 않는다.

4. 이제 바로 만들 작업을 요청할 수 있다.

```text
간단한 고객 명단 앱 만들어줘
```

문서로 남길 필요가 있을 때만 이어서 실행한다.

```text
/write-prd -> /write-todo
```

5. `TODO.md`를 만들었다면 TODO 번호로 구현을 요청한다.

```text
TODO 1번 해줘
```

`TODO.md`가 없다면 그냥 만들 작업을 바로 요청한다.

6. 프로젝트 중간에는 필요한 스킬만 쓴다.

```text
/apply-design # 붙여넣은 디자인 시스템을 DESIGN.md로 만들거나 UI에 적용할 때
/sync-docs   # 문서와 실제 상태가 어긋났을 때
/diagnose    # 버그가 났을 때
/refactor    # 새 기능 없이 코드만 정리할 때
```

## 왜 이 스킬들이 필요한가 (Why These Skills Exist)

이 스킬들은 AI 코딩 에이전트와 프로젝트를 만들 때 자주 겪는 실패 모드를 작게 막기 위해 만들었다.

### #1: 프로젝트마다 작업 규칙이 달라진다

**문제(Problem)**: 새 프로젝트를 시작할 때마다 에이전트가 어떤 문서를 읽어야 하는지, TODO를 어떻게 다뤄야 하는지, 언제 테스트했다고 말해도 되는지 규칙이 달라진다. 그러면 같은 사용자도 매번 다시 설명해야 한다.

**해결(Fix)**: [`/setup-project`](./skills/setup-project/SKILL.md)를 먼저 실행한다. 명령만 입력하면 문서 위치, 실행 명령, OS별 Shell, 네트워크 URL, 에이전트 작업 규칙을 기본값으로 기록한다. 부가 설명을 붙이면 그 내용만 반영한다. 제품 방향과 기술 전제는 사용자의 요청을 따르고, 문서로 남길 때 `/write-prd`에서 다룬다. Codex, Claude Code, OpenCode 중 무엇을 쓰더라도 같은 기본 흐름을 유지하기 위한 시작점이다.

### #2: 만들고 싶은 것이 아직 흐릿하다

**문제(Problem)**: "앱 만들어줘"는 시작점으로는 좋지만 구현 기준으로는 너무 넓다. 대상 사용자, 사용 순간, 첫 행동, 성공 확인이 없으면 에이전트는 그럴듯한 기능을 마음대로 채운다.

**해결(Fix)**: 필요할 때만 [`/clarify-idea`](./skills/clarify-idea/SKILL.md)를 쓴다. `grill-me`의 가벼운 버전처럼 한 번에 하나씩 질문해서 공통 이해(shared understanding)에 도달한다. 이 스킬은 PRD나 TODO를 만들지 않는다. 바로 만들 수 있을 만큼 분명한 요청에는 쓰지 않는다.

### #3: 말로 정한 내용이 사라진다

**문제(Problem)**: 대화로는 합의했지만 문서로 남기지 않으면 다음 요청에서 범위가 흔들린다. 특히 작은 개인 프로젝트에서는 "처음에 뭘 만들기로 했는지"가 사라지는 순간 기능이 계속 불어난다.

**해결(Fix)**: [`/write-prd`](./skills/write-prd/SKILL.md)를 쓴다. 현재 대화에서 이미 결정된 내용만 `PRD.md`로 정리한다. PRD는 구현 계획이 아니라 제품 결정 문서다. 같은 개념의 이름이 흔들릴 때만 `CONTEXT.md`를 작은 용어집(glossary)으로 만든다.

### #4: TODO가 기술 작업 목록이 된다

**문제(Problem)**: "DB 스키마 만들기", "API 만들기", "프론트엔드 만들기" 같은 TODO는 사용자가 검수하기 어렵다. 사용자가 볼 수 있는 변화가 아니기 때문이다.

**해결(Fix)**: [`/write-todo`](./skills/write-todo/SKILL.md)를 쓴다. `PRD.md`를 `지금 할 일(Now)`, `다음 할 일(Next)`, `나중에 할 일(Later)`로 나누고, 각 항목을 사용자가 확인할 수 있는 결과(user-visible outcome)로 쓴다.

좋은 TODO는 이런 모양이다.

```markdown
- [ ] 사용자가 이름을 입력하고 추가 버튼을 누르면 목록에 표시된다.
- [ ] 빈 값으로 추가하면 안내 문구가 보인다.
- [ ] 새로고침해도 방금 추가한 항목이 남아 있다.
```

### #5: 문서와 실제 앱이 어긋난다

**문제(Problem)**: 프로젝트 중간에는 `PRD.md`, `TODO.md`, `README.md`, 실제 구현이 조금씩 달라진다. 이 상태가 오래 가면 에이전트가 낡은 문서를 근거로 다음 작업을 한다.

**해결(Fix)**: [`/sync-docs`](./skills/sync-docs/SKILL.md)를 쓴다. 완료된 TODO를 체크하고, 더 이상 맞지 않는 TODO를 옮기고, `AGENTS.md`와 `CLAUDE.md`의 `Starter Skills` 섹션이 같은지도 확인한다.

### #6: 화면이 매번 다른 분위기로 만들어진다

**문제(Problem)**: AI가 UI를 만들 때마다 색, 카드, 버튼, 폰트 분위기가 달라진다. 사용자가 디자인을 잘 몰라도 "이런 느낌"은 줄 수 있지만, 그 참고 자료가 프로젝트 안에 남지 않으면 다음 작업에서 다시 흐트러진다.

**해결(Fix)**: [`/apply-design`](./skills/apply-design/SKILL.md)를 쓴다. shadcn.io/design 같은 곳에서 복사한 markdown이나 디자인 설명을 프로젝트용 `DESIGN.md`로 정리한다. 사용자가 요청하면 현재 UI에도 적용한다.

### #7: 오류를 추측으로 고친다

**문제(Problem)**: "안 돼", "이상해", "고쳐줘" 같은 요청은 바로 수정으로 들어가면 위험하다. 재현하지 않은 문제는 고쳤는지 확인할 수 없다.

**해결(Fix)**: [`/diagnose`](./skills/diagnose/SKILL.md)를 쓴다. 기대 결과(Expected), 실제 결과(Actual), 재현 단계(Repro Steps)를 먼저 정리하고, 같은 단계로 수정 후 다시 확인한다.

### #8: 코드 정리가 새 기능과 섞인다

**문제(Problem)**: 작은 개인 프로젝트에서 "정리해줘"는 쉽게 새 기능 추가로 번진다. 그러면 무엇이 리팩터링(refactor)이고 무엇이 기능 변경인지 구분하기 어렵다.

**해결(Fix)**: [`/refactor`](./skills/refactor/SKILL.md)를 쓴다. 변경 전 기준 동작(baseline behavior)을 확인하고, 새 기능 없이 구조, 이름, 중복, 파일 책임만 정리한다.

## 기본 흐름 (Default Flow)

새 프로젝트는 설정 후 바로 요청을 처리하는 것이 기본이다.

```text
setup-project -> 바로 사용자 요청 처리
```

문서가 필요할 때만 아래 흐름을 쓴다.

```text
write-prd -> write-todo -> TODO 번호로 구현 요청
```

각 문서의 역할은 분리한다.

- `PRD.md`: 무엇을 만들기로 했는지 기록한다.
- `TODO.md`: 어떤 순서로 구현할지 기록한다.
- `CONTEXT.md`: 같은 개념의 이름이 흔들릴 때만 만드는 작은 용어집(glossary)이다.
- `DESIGN.md`: 색, 글꼴, 간격, 컴포넌트 분위기 같은 시각 기준이다.
- `AGENTS.md`, `CLAUDE.md`: 에이전트(agent)가 프로젝트에서 지킬 작업 규칙이다.
- `docs/agents/starter-skills.md`: 문서 위치, 실행 명령, OS별 Shell, 네트워크 URL, 환경 전제 같은 프로젝트 설정이다.

## 참고 목록 (Reference)

### 시작 (Starting)

- **[setup-project](./skills/setup-project/SKILL.md)**: 새 프로젝트의 문서 위치, 실행 명령, 접속 방식, `AGENTS.md`와 `CLAUDE.md` 작업 규칙을 세팅한다.
- **[clarify-idea](./skills/clarify-idea/SKILL.md)**: 넓은 아이디어나 변경 요청을 한 질문씩 확인한다. 문서는 만들지 않는다.
- **[write-prd](./skills/write-prd/SKILL.md)**: 결정된 제품 방향, 앱 형태, 데이터 필요, 사용 환경을 로컬 `PRD.md`로 정리한다.
- **[write-todo](./skills/write-todo/SKILL.md)**: `PRD.md`를 사용자가 확인할 수 있는 작은 TODO 순서로 나눈다.
- **[apply-design](./skills/apply-design/SKILL.md)**: 붙여넣은 디자인 시스템을 프로젝트용 `DESIGN.md`로 정리하고 요청받으면 UI에 적용한다.

### 중간 작업 (During the Project)

- **[clarify-idea](./skills/clarify-idea/SKILL.md)**: 새 기능, 방향 전환, 범위 변경이 흐릿할 때 한 질문씩 다시 확인한다.
- **[apply-design](./skills/apply-design/SKILL.md)**: 새 디자인 참고 자료를 적용하거나 기존 UI 분위기를 맞춘다.
- **[sync-docs](./skills/sync-docs/SKILL.md)**: 문서와 실제 구현 상태를 다시 맞춘다.
- **[diagnose](./skills/diagnose/SKILL.md)**: 버그를 추측으로 고치지 않고 재현, 원인, 수정, 확인 순서로 처리한다.
- **[refactor](./skills/refactor/SKILL.md)**: 새 기능 없이 현재 동작을 유지하며 코드 구조를 정리한다.

## 라이선스 (License)

MIT. 자세한 내용은 [LICENSE](./LICENSE)를 참고한다.
