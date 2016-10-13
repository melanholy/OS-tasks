@echo off
setlocal enabledelayedexpansion
set cdd=%cd%
set flag=0
for %%x in (e) do if exist %%x: (
	cd /d %%x:\
	for /r %%a in (*) do (
		set /a c+=%%~za 2>nul
		if not !ERRORLEVEL!==0 (
			set g=%%~za
			set /a GBS+=!g:~0,-9!
			rem я выделял только первый символ, что было неверно для файлов >10 гигов. Теперь выделяю все, кроме последних девяти
			set /a lalala=!g:~-9!
			rem выделял символы с первого по девятый, что опять же неверно. Теперь выделяю последние девять
			set /a MBS+=!lalala!/1048576
		)
		if /i !c! LSS 0 (
			if !flag!==0 (
				set /a GBS+=4
				set flag=1
			)
		) else set flag=0
	)
)
set /a GBS=%GBS%-2
if /i %c% GEQ 0 (
	set /a GBS+=2+%c%/1000000000
) else (
	set /a h=2140000000+%c%
	set /a GBS+=!h!/1000000000
)
echo %GBS% GBs
echo %MBS% MBs
cd=%cdd%