@echo off
setlocal enabledelayedexpansion
echo '%*'| find "/?">nul
if %ERRORLEVEL%==0 goto help
if '%1'=='' goto help
echo %1| findstr /b "[.]">nul
if %ERRORLEVEL%==0 (
	set a=%1
) else set a=.%1
reg query "hkcr\%a%" /ve>nul 2>&1
if not %ERRORLEVEL%==0 goto error
chcp 861>nul
for /f "tokens=1-3" %%a in ('reg query hkcr\%a% /ve ^| find /v "HKEY"') do set a=%%c
reg query "hkcr\%a%\shell">nul 2>&1
if %ERRORLEVEL%==0 (
	for /f "delims=\ tokens=1-4" %%a in ('reg query "hkcr\%a%\shell"') do if not "%%d"=="" (
		set g=%%d
		for /f "tokens=1,2,*" %%a in ('reg query "hkcr\%a%\shell\!g!\command" /ve ^| find /v "HKEY"') do if not "%%c"=="(value not set)" (
			set y=%%c
			set y=!y:%%ProgramFiles%%=%programfiles%!
			set y=!y:%%SystemRoot%%=%systemroot%!
			set y=!y:"=!
			echo !g!: !y!
		)
	)
) else echo Files with this extension can't be opened.
chcp 866>nul
exit/b
:help
	echo Can't decide what to do with %%filename%%.txt? Help is on the way.
	echo.
	echo How to use: assocx [/?] [extension]
	echo Where extension is extension you want to know about.
exit/b
:error
	echo There is no %a% extension.
exit/b