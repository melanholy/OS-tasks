@echo off
set res=
if '%1'=='/?' goto goto :EOF
if '%1'=='' goto help
:loop
	if '%1'=='' goto end
	set a=%1
	set a| find "/?" > nul
	if %ERRORLEVEL%==0 goto help
	set res=%res%%1
	shift
	goto loop
:end
	set res=%res: =%
	echo %res%| findstr /R "[^0123456789/\|&\%%\^\<\>\+\-\""\*\(\)]" > nul
	if %ERRORLEVEL%==0 goto error
	echo %res%| find "/0" > nul
	if %ERRORLEVEL%==0 goto null
	set /a res=%res%
	if %ERRORLEVEL%==0 ( echo %res%
	) else goto error
exit /b
:help
	echo This is a simple calculator. You write what you want to calculate as argument 
	echo and program calculates it for you. What a beauty!
	echo.
	echo How to use: calc [/?] [expression]
	echo.
	echo Available operators: + * - / ^% ^^ ^| ^& ^<^< ^>^> ( )
	echo If you use any of the logical operators(yeah, you can), you need to enclose 
	echo the expression string in quotes.
	echo.
	echo Author: Pavel Koshara
exit /b
:null
	echo Well well. Someone's trying to divide by zero.
	echo In spite of all your expectations the answer is 24.
exit /b
:error
	echo What's wrong with you man? How the f should I calculate %res%? 
	echo Use your head!(or type deathanddecay.cmd /?)
exit /b