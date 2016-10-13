@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%A in (as) do (
    set "str=%%A"
	set "str=!str:"=!"
	set "str=!str:^=!"
	set "str=!str:<=!"
	set "str=!str:>=!"
	set "str=!str:&=!"
	set "str=!str:|=!"
	if not "!str!"=="" call :loop
)
for /f "tokens=2,3 delims=.=" %%X in ('set dic.') do echo %%X = %%Y
endlocal
exit/b

:loop
for /f "tokens=1,* delims=`~!@#$%%*()-_+=\[]{};:/?., " %%X in ("%str%") do (
	set wd=%%X
	set /a dic.!wd!+=1
	set str=%%Y
)
if not "%str%"=="" goto :loop