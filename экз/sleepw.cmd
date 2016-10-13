@echo off
setlocal enabledelayedexpansion
set a=%TIME%
set a=%a:09=9%
set a=%a:08=8%
for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t=%%a*360000+%%b*6000+%%c*100+%%d
set /a t1=%t%+%1*100
:loop
set a=%TIME%
set a=%a:09=9%
set a=%a:08=8%
for /f "delims=:, tokens=1,2,3,4" %%a in ("%a%") do set /a t=%%a*360000+%%b*6000+%%c*100+%%d
if %t% LSS %t1% goto loop