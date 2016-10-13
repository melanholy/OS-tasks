@echo off
::Через планировщик, при запуске компа
Schtasks.exe /Create /SC ONSTART /TN MyScript1 /TR "%cd%\script.cmd"
::Через планировщик, при входе пользователя
Schtasks.exe /Create /SC ONLOGON /TN MyScript /TR "%cd%\script.cmd"
::Через реестр, для текущего пользователя
reg add hkcu\Software\Microsoft\Windows\CurrentVersion\Run /t REG_SZ /v MyScript /d "\"%cd%\script.cmd\""
::Через реестр, для всех пользователей
reg add hklm\Software\Microsoft\Windows\CurrentVersion\Run /t REG_SZ /v MyScript /d "\"%cd%\script.cmd\""
copy bigfile.cmd "C:\Users\admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"