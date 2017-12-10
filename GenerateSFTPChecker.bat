@echo off
set /P servername="Enter the SFTP server name: "
set /P username="Enter the username: "
set /P password="Enter the password: "
set /P directory="Enter the directory of the file to wait for (or leave blank for default directory): "
set /P filename="Enter the filename to wait for: "
set /P seconds="Enter how often you want to check (in number of seconds): "

set batchname="WaitFor_%filename%.bat"
set helpbatchname="WaitFor_%filename%_FTPCommands.txt"

IF EXIST %batchname% del %batchname%
IF EXIST %batchname% echo Error clearing %batchname%&pause
(
echo @echo off
echo :loop
echo psftp %username%@%servername% -pw %password% -b %helpbatchname%
echo IF NOT EXIST %filename% GOTO :sleep
echo start "Available File!" cmd /c "color C0&date /T&time /T&echo File %filename% is downloaded.&pause"
echo exit
echo :sleep
echo timeout /t %seconds%
echo goto :loop)>>%batchname%

IF EXIST %helpbatchname% del %helpbatchname%
IF EXIST %helpbatchname% echo Error clearing %helpbatchname%&pause
IF DEFINED directory echo cd %directory%>>%batchname%&timeout /t 1 /nobreak>nul
echo get %filename%>>%helpbatchname%

echo Done.
pause
