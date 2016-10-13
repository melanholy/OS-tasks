@echo off
setlocal enabledelayedexpansion
set flag=0
for /l %%i in (1,1,%1) do (
	set /a c+=%1
	if /i !c! LSS 0 (
			if !flag!==0 (
				set /a MLR+=4
				set flag=1
				set /a c+=294967296
			)
		) else set flag=0
)
if /i !c! LSS 0 (
	set /a c=2000000000+!c!
	set /a MLR-=2
)
echo !MLR!!c!
rem изменил вывод. Не знаю, зачем я делал как раньше, ведь этот выглядит по-человечески