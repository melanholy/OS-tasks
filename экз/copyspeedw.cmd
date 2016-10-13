@echo off
setlocal enabledelayedexpansion
set a=%TIME%
set a=%a:09=9%
set a=%a:08=8%
for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t=%%a*360000+%%b*6000+%%c*100+%%d
copy "%1" "%1.temp" >nul
set a=%TIME%
set a=%a:09=9%
set a=%a:08=8%
for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t1=%%a*360000+%%b*6000+%%c*100+%%d
set /a t=%t1%-%t%
set /a h=0+%~z1 2>nul
if not !ERRORLEVEL!==0 (
	set /a t=%t%/100
	set h=%~z1
	set h=!h:~0,-6!
	set /a h=!h!-!h:~0,-3!*49
	rem после обрезания 6 последних цифр получаем некоторое количество тысяч. обрезав еще 3 последних цифры, получим как раз количество этих тысяч. 
	rem Вычитаем это число умноженное на 49 для более точного деления(по сути делим большое число на 1048576)
	set /a ha=!h!/!t!
) else set /a ha=(%h%/%t%)*100/1048576
echo %ha% MB/sec
del %1.temp