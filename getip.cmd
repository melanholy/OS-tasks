@echo off
setlocal enabledelayedexpansion
echo '%*'| find "/?" > nul
if %ERRORLEVEL%==0 goto help
set /p a=Your ips is <nul
for /f "delims=: tokens=1,*" %%a in ('ipconfig ^| find "IPv4"') do (
	set ip=%%b
	set /p =!ip: =! <nul
)
echo.
exit/b
:help
	echo OH MY GOD.
	echo IS THAT WHAT I THINK IT IS?
	echo BEHOLD, YOU MORTAL - FOR GETIP IS HERE.
	echo.
	echo WANT SOMEONE TO SHOW YOU YOUR IP? GETIP CAN DO IT.
	echo WANNA SOMETHING ELSE? GO TO HELL.
	echo THERE AIN'T ANYTHING COOLER THAN TO LEARN YOUR IP THRU GETIP.
	echo.
	echo USE GETIP [/?].
exit/b