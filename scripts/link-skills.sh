#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO/skills"
CODEX_SKILLS_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
OPENCODE_SKILLS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills"

usage() {
  cat <<'USAGE'
Usage: bash scripts/link-skills.sh [--all|--claude|--codex|--opencode]

Default: install links for Claude Code, Codex, and OpenCode.
USAGE
}

destinations=()

add_destination() {
  local dest="$1"
  local existing

  for existing in "${destinations[@]:-}"; do
    if [ "$existing" = "$dest" ]; then
      return
    fi
  done

  destinations+=("$dest")
}

if [ "$#" -eq 0 ]; then
  add_destination "$CLAUDE_SKILLS_DIR"
  add_destination "$CODEX_SKILLS_DIR"
  add_destination "$OPENCODE_SKILLS_DIR"
else
  for arg in "$@"; do
    case "$arg" in
      --all)
        add_destination "$CLAUDE_SKILLS_DIR"
        add_destination "$CODEX_SKILLS_DIR"
        add_destination "$OPENCODE_SKILLS_DIR"
        ;;
      --claude)
        add_destination "$CLAUDE_SKILLS_DIR"
        ;;
      --codex)
        add_destination "$CODEX_SKILLS_DIR"
        ;;
      --opencode)
        add_destination "$OPENCODE_SKILLS_DIR"
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        echo "error: unknown option: $arg" >&2
        usage >&2
        exit 1
        ;;
    esac
  done
fi

link_into_destination() {
  local dest="$1"

  if [ -L "$dest" ]; then
    echo "error: $dest is a symlink. Move or remove it and re-run." >&2
    exit 1
  fi

  mkdir -p "$dest"
  echo "installing skills into $dest"

  find "$SKILLS_DIR" -name SKILL.md -not -path '*/node_modules/*' -print0 |
  while IFS= read -r -d '' skill_md; do
    local src name target

    src="$(dirname "$skill_md")"
    name="$(basename "$src")"
    target="$dest/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "error: $target already exists and is not a symlink." >&2
      echo "Move or remove it before linking this skill." >&2
      exit 1
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src"
  done
}

for dest in "${destinations[@]}"; do
  link_into_destination "$dest"
done
