@echo off
setlocal enabledelayedexpansion
echo '%*'| find "/?" > nul
if %ERRORLEVEL%==0 goto help
if '%1'=='' goto help
set oldpath=%PATH%
set PATH=%PATH%;%cd%
set e=0
for %%a in ("%pathext:;=" "%") do (
	echo %1| find /i "%%~a">nul
	if !ERRORLEVEL!==0 goto wext
)
for %%a in ("%pathext:;=" "%") do for %%b in ("%path:;=" "%") do if exist %%~b\%1%%~a (
	if !e!==0 (
		echo This is an external command. 
		echo You can find it here %%~b\%1%%~a
	) else echo And here %%~b\%1%%~a
	set e=1
)
rd /q temp>nul 2>&1
mkdir temp>nul 2>&1
cd %cd%\temp
set PATH=
%1/?>nul 2>&1
if !ERRORLEVEL!==9009 (
	if %e%==0 goto error
) else (
	if %e%==0 echo This is an internal command. Boring.
	if %e%==1 echo ...and internal too. JACKPOT
)
cd..
rd /q temp>nul 2>&1
goto end
:wext
	for %%a in ("%path:;=" "%") do if exist %%~a\%1 (
		echo This is obviously an external command. 
		echo You can find it here %%~a\%1%
		set e=1
	)
	if %e%==0 goto error
goto end
:help
	echo With this (no doubt) awesome program you can determine whether the command 
	echo you'he input is internal or external(or internal and external, lol).
	echo.
	echo How to use: which [/?] [command]
	echo Where which is pure awesomeness.
	echo.
	echo Author: Pavel Koshara
exit/b
:error
	echo There is no such command.
:end
set PATH=%oldpath%
exit/b