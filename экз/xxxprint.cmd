@echo off
setlocal enabledelayedexpansion
md tempdir
cd tempdir
for %%a in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
	for %%b in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
		for %%c in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
			for %%d in (1,2,3,4,5,6,7,8,9) do (
				md %%a%%b%%c%%d
				if ERRORLEVEL 1 set c=!c!, %%a%%b%%c%%d
			)
			md %%a%%b%%c
			if ERRORLEVEL 1 set c=!c!, %%a%%b%%c
		)
	)
)
echo %c%
cd ..
rd /q /s tempdir