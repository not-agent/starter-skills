Starter Skills는 개인 프로젝트를 AI 코딩 에이전트와 진행하기 위한 스킬팩(skill pack)이다.

스킬은 `skills/<name>/SKILL.md`에 둔다. 공개 스킬은 반드시 다음 두 곳에도 등록한다.

- `README.md`의 참고 목록(Reference)
- `.claude-plugin/plugin.json`

각 스킬은 하나의 실패 모드만 겨냥한다. 새 스킬을 추가하기 전에 기존 스킬의 설명(description)을 넓히는 것으로 충분한지 먼저 판단한다.

`clarify-idea`는 새 프로젝트뿐 아니라 새 기능, 방향 전환, 중간 변경처럼 사용자의 의도가 아직 흐릿할 때도 사용한다.

`CONTEXT.md`는 이 에디션의 용어집(glossary)이다. 스킬 이름, 문서 이름, README 표현이 흔들릴 때 먼저 읽고 같은 용어를 사용한다.

`setup-project`는 프로젝트별 설정을 기본값으로 바로 기록하는 스킬이다. OS별 Shell은 Windows CMD, macOS zsh, Linux/WSL bash 중 하나로 두고, 사용자 URL은 네트워크 주소를 기본값으로 둔다. 앱을 바로 만들거나 PRD/TODO를 대신 만들지 않는다. 앱 형태, 데이터 필요, 기술 전제는 사용자의 요청을 따르고, 문서로 남길 때 `write-prd`에서 다룬다.

`skills/write-prd/references/LIBRARY_MAP.md`는 앱 기능과 화면 완성도를 높이는 라이브러리 후보를 좁히는 참고 문서다. SaaS나 외부 서비스 후보표가 아니다. 필요한 카테고리만 읽고, 라이브러리를 자동으로 추가하지 않는다.

기술 preset은 `skills/write-prd/preset-*.md`와 `skills/write-prd/mvp-library-stack.md`에 둔다. 이미 결정된 앱 형태와 데이터 필요를 PRD에 정리할 때만 조건부로 참고한다.

문서 규칙:

- `README.md`는 사용자를 위한 설명과 설치 안내를 담는다.
- `AGENTS.md`와 `CLAUDE.md`는 이 에디션을 관리하는 에이전트(agent) 작업 규칙을 담는다.
- `AGENTS.md`와 `CLAUDE.md`는 같은 내용으로 유지한다.
- 스킬 폴더 안에는 별도 README나 설치 가이드 같은 사용자용 보조 문서를 만들지 않는다. 조건부로 필요한 reference 파일은 `SKILL.md`에서 직접 링크한다.

설치 스크립트 규칙:

- macOS, Linux, WSL용 설치는 `scripts/link-skills.sh`에 둔다.
- Windows CMD용 설치는 `scripts/link-skills.cmd`에 둔다.
- macOS, Linux, WSL용 목록 확인은 `scripts/list-skills.sh`에 둔다.
- Windows CMD용 목록 확인은 `scripts/list-skills.cmd`에 둔다.
- 설치 대상은 Claude Code, Codex, OpenCode를 함께 지원한다.

기본 흐름:

```text
setup-project -> 바로 사용자 요청 처리
```

문서가 필요할 때 쓰는 흐름:

```text
write-prd -> write-todo -> TODO 번호로 구현 요청
```

중간 작업:

```text
apply-design # DESIGN.md를 만들거나 UI 분위기를 맞출 때
sync-docs    # 문서와 실제 상태를 맞출 때
diagnose     # 버그를 재현하고 고칠 때
refactor     # 새 기능 없이 동작 유지하며 정리할 때
```
