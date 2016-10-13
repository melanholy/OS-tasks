@echo off
setlocal enabledelayedexpansion
set cdd=%cd%
for %%x in (b,d,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do if exist %%x: (
	cd /d %%x:\
	for /r %%a in (*) do (
		set /a c=0+%%~za 2>nul
		if not !ERRORLEVEL!==0 (
			set size=%%~za
			echo %%~za>%cdd%\tempfile.temp
			for %%f in (%cdd%\tempfile.temp) do set len=%%~zf
			set flag=0
			if !len! GEQ !len1! (
				if !len!==!len1! (
					if !size!a GTR !big!a set flag=1
				) else set flag=1
			)
			if "!flag!"=="1" (
				set len1=!len!
				set big=%%~za
				set name=%%~fa
			)
		) else (
			if %%~za GTR !big! if "!len1!"=="" (
				set big=%%~za
				set name=%%~fa
			)
		)
	)
)
cd=%cdd%
del %cdd%\tempfile.temp
echo %big%
echo %name%