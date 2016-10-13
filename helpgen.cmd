@echo off
setlocal enabledelayedexpansion
echo "%*"| find "/?" > nul
if %ERRORLEVEL%==0 goto help
if '%1'=='' goto help
if not exist %1 (
	echo There is no such directory.
	set /p answer=Do you want to create %1? [y/n] 
	if not !answer!==y goto fun
	:work
	mkdir %*
	goto main
	)
:main
	chcp 861 > nul
	net session > nul
	if %ERRORLEVEL%==0 (
		help DISKPART>%1\DISKPART.txt
	) else (
		echo You won't see DISKAPART's help because you aren't cool enought.
	)
	for /f %%a in ('help ^|findstr /R /B "[ABCDEFGHIJKLMNOPQRSTUVWXYZ][ABCDEFGHIJKLMNOPQRSTUVWXYZ]"') do (
		if not %%a==CMD if not %%a==GRAFTABL if not %%a==SC if not %%a==DISKPART (
			help %%a>%1\%%a.txt
		)
	)
	chcp 866 > nul
	echo Done
exit /b
:help
	echo Program generates detailed help for all the commands shown by "help" command.
	echo.
	echo How to use: helpgen [/?] [path]
	echo Where path is directory where program should save files.
	echo.
	echo Author: Pavel Koshara
exit /b
:fun
	set /p answer=Are you sure? [y/n]
	if !answer!==y exit /b
	if !answer!==n set /p answer=It starts to annoy me. Do you want to create goddamn directory or not? [y/n] 
	if not !answer!==y echo You're horrible person.
	if !answer!==y goto work
exit /b