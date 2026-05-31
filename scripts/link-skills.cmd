@echo off
setlocal

set "REPO=%~dp0.."
for %%I in ("%REPO%") do set "REPO=%%~fI"
set "SKILLS_DIR=%REPO%\skills"

set "CLAUDE_SKILLS_DIR=%USERPROFILE%\.claude\skills"
if defined CODEX_HOME (
  set "CODEX_SKILLS_DIR=%CODEX_HOME%\skills"
) else (
  set "CODEX_SKILLS_DIR=%USERPROFILE%\.codex\skills"
)
if defined XDG_CONFIG_HOME (
  set "OPENCODE_SKILLS_DIR=%XDG_CONFIG_HOME%\opencode\skills"
) else (
  set "OPENCODE_SKILLS_DIR=%USERPROFILE%\.config\opencode\skills"
)

set "DO_CLAUDE="
set "DO_CODEX="
set "DO_OPENCODE="

if "%~1"=="" (
  set "DO_CLAUDE=1"
  set "DO_CODEX=1"
  set "DO_OPENCODE=1"
  goto install
)

:parse
if "%~1"=="" goto install
if /I "%~1"=="--all" (
  set "DO_CLAUDE=1"
  set "DO_CODEX=1"
  set "DO_OPENCODE=1"
  shift
  goto parse
)
if /I "%~1"=="--claude" (
  set "DO_CLAUDE=1"
  shift
  goto parse
)
if /I "%~1"=="--codex" (
  set "DO_CODEX=1"
  shift
  goto parse
)
if /I "%~1"=="--opencode" (
  set "DO_OPENCODE=1"
  shift
  goto parse
)
if /I "%~1"=="--help" goto usage
if /I "%~1"=="/?" goto usage

echo error: unknown option: %~1 1>&2
goto usage_error

:usage
echo Usage: scripts\link-skills.cmd [--all^|--claude^|--codex^|--opencode]
echo.
echo Default: install links for Claude Code, Codex, and OpenCode.
exit /b 0

:usage_error
echo Usage: scripts\link-skills.cmd [--all^|--claude^|--codex^|--opencode] 1>&2
exit /b 1

:install
if defined DO_CLAUDE call :link_destination "%CLAUDE_SKILLS_DIR%" || exit /b 1
if defined DO_CODEX call :link_destination "%CODEX_SKILLS_DIR%" || exit /b 1
if defined DO_OPENCODE call :link_destination "%OPENCODE_SKILLS_DIR%" || exit /b 1
exit /b 0

:link_destination
set "DEST=%~1"
if not exist "%DEST%" mkdir "%DEST%" || exit /b 1
echo installing skills into %DEST%

for /D %%S in ("%SKILLS_DIR%\*") do (
  if exist "%%~fS\SKILL.md" call :link_skill "%%~fS" "%%~nxS" "%DEST%" || exit /b 1
)
exit /b 0

:link_skill
set "SRC=%~1"
set "NAME=%~2"
set "DEST=%~3"
set "TARGET=%DEST%\%NAME%"

if exist "%TARGET%" (
  if exist "%TARGET%\NUL" (
    fsutil reparsepoint query "%TARGET%" >NUL 2>NUL
    if errorlevel 1 (
      echo error: %TARGET% already exists and is not a junction or symlink. 1>&2
      echo Move or remove it before linking this skill. 1>&2
      exit /b 1
    )
    rmdir "%TARGET%" || exit /b 1
  ) else (
    echo error: %TARGET% already exists and is not a directory. 1>&2
    exit /b 1
  )
)

mklink /J "%TARGET%" "%SRC%" >NUL
if errorlevel 1 (
  echo error: failed to create junction %TARGET% -^> %SRC% 1>&2
  exit /b 1
)

echo linked %NAME% -^> %SRC%
exit /b 0
