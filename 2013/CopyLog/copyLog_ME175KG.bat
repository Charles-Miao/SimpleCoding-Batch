net use \\192.168.168.74 /user:admin btco

net use \\192.168.168.76 /user:admin btco
net use \\192.168.168.77 /user:admin btco

net use \\192.168.168.91 /user:admin btco
net use \\192.168.168.88 /user:admin btco

net use \\192.168.123.81 /user:admin btco
net use \\192.168.123.82 /user:admin btco
net use \\192.168.123.84 /user:admin btco
net use \\192.168.123.97 /user:admin btco
net use \\192.168.123.98 /user:admin btco

setlocal enabledelayedexpansion

:start

TITLE "ME175KG"
for /f "tokens=2,3,4,5 delims=/ " %%i in ("%date%") do set dd=%%k-%%i-%%j

call :copyME175KGLog \\192.168.168.76\vol1\Message\SFCS\FA\LOG_ME175KG
call :copyME175KGLog \\192.168.168.77\vol1\Message\SFCS\PCBA\LOG_ME175KG

call :copyME175KGLog \\192.168.168.74\vol1\MESSAGE\SFCS\LOG_ME175KG

::call :copyME175KGLog \\192.168.168.76\vol1\MESSAGE\SFCS\LOG_ME175KG
::call :copyME175KGLog \\192.168.168.77\vol1\MESSAGE\SFCS\LOG_ME175KG

call :copyME175KGLog \\192.168.168.91\vol1\MESSAGE\SFCS\LOG_ME175KG
call :copyME175KGLog \\192.168.168.88\vol1\MESSAGE\SFCS\LOG_ME175KG

::call :copyME175KGLog \\192.168.123.81\vol1\MESSAGE\SFCS\LOG_ME175KG
::call :copyME175KGLog \\192.168.123.82\vol1\MESSAGE\SFCS\LOG_ME175KG
call :copyME175KGLog \\192.168.123.84\vol1\MESSAGE\SFCS\LOG_ME175KG
call :copyME175KGLog \\192.168.123.97\vol1\MESSAGE\SFCS\LOG_ME175KG
call :copyME175KGLog \\192.168.123.98\vol1\MESSAGE\SFCS\LOG_ME175KG

ping 127.0.0.1 -n 4

goto Start

:copyME175KGLog
echo %1
if not exist E:\LOG\LOG_ME175KG\ME175KG_LOG%dd% mkdir E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%
for %%i in (%1\*.log) do (
 set a=%%~ni
 set a=!a:~0,2!
 if not exist E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%\!a!\ mkdir E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%\!a!\
 copy %%i E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%\!a!\%%~ni.txt /Y
 CheckLog_ASUS.exe ME175KG E:\LOG\LOG_ME175KG\ME175KG_LOG%dd%\!a!\%%~ni.txt E:\LOG\NG_LOG
 del %%i
)
goto :EOF
