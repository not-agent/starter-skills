@echo off
setlocal

set "REPO=%~dp0.."
for %%I in ("%REPO%") do set "REPO=%%~fI"

for /f "delims=" %%S in ('dir /b /ad "%REPO%\skills" ^| sort') do (
  if exist "%REPO%\skills\%%S\SKILL.md" echo skills\%%S\SKILL.md
)
