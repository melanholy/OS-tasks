@echo off
setlocal enabledelayedexpansion
for /f %%a in ('copy /z "%~f0" nul') do set cr=%%a
set a=%TIME%
set a=%a:09=9%
set a=%a:08=8%
echo "%*"| find "/?" > nul
if %ERRORLEVEL%==0 goto help
if '%1'=='' goto help
echo %1| findstr /R "[^0123456789]" > nul
if %ERRORLEVEL%==0 goto error
set t=0
for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t+=%%a*360000+%%b*6000+%%c*100+%%d
set /a t1=t+%1*100
set ind=0
set ind1=0
if /i %t1% GEQ 8640000 (
	set /a t1-=8640000
	set ind1=1
)
set /p ="ADVERTISMENT!CR!" < nul
:loop
	set t=0
	set a=%TIME%
	set a=%a:09=9%
	set a=%a:08=8%
	for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t+=%%a*360000+%%b*6000+%%c*100+%%d
	if %ind%==0 if %ind1%==1 if %t% GTR %t1% goto loop
	if /i %t% LSS %t1% (
		set ind=1
		goto loop
	)
echo CMD is awake. You can work now.
exit/b
:help
echo Program allows you to make cmd fall asleep for awhile(not literally).
echo.
echo How to use: sleep [/?] [number]
echo Where number is the sleep time in seconds.
echo Warning: you don't want to run this with echo on.
echo.
echo Author: Pavel Koshara
exit/b
:error
echo Does %1 looks like a number? No it doesn't. Type sleep /? for help.
echo I can repeat it endlessly.
exit/b