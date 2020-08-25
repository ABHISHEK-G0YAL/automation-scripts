@echo off
setlocal EnableDelayedExpansion
cd /d %~dp0
set sevenzip=
if "%sevenzip%"=="" if exist "%ProgramFiles(x86)%\7-zip\7z.exe" set sevenzip=%ProgramFiles(x86)%\7-zip\7z.exe
if "%sevenzip%"=="" if exist "%ProgramFiles%\7-zip\7z.exe" set sevenzip=%ProgramFiles%\7-zip\7z.exe
if "%sevenzip%"=="" echo 7-zip not found&pause&exit
set extension=.*
for %%a in (*%extension%) do (
	if not "%%~xa"=="" (
		echo !Time!
		set datetimef=!date:~-4!-!date:~3,2!-!date:~0,2!_!time: =0!
		set datetimef=!datetimef::=-!
		set datetimef=!datetimef:.=-!
		"%sevenzip%" a -mx=0 -psecretkey -mhe=on "!datetimef!." "%%a">nul
		if not "%%~xa"==".bat" del "%%a"
	)
)
pause
del "encrypt.bat"