@ECHO OFF
:choose
cls
set /p choose= Would you like to go to an existing batch file or make a new one? (New/Exist)
if %choose% == Exist goto existfile
if %choose% == New goto new

:existfile
set /p exist= Type your batch file's name (with extension)
goto check

:check
echo CHECKING IF FILE EXISTS...
ping -n 2 localhost >nul
if exist %exist% goto successfile
if not exist %exist% goto failfile

:failfile
echo ERROR: File does NOT exist.
ping -n 2 localhost >nul
goto choose

:successfile
echo SUCCESS! File Exists!
ping -n 2 localhost >nul 
goto typetwo



:new
cls
SET /P FileName=Enter the name for the new batch file (without extension): 
goto checkfile

:checkfile
cls 
echo Checking if %FileName%.bat Exists...
ping -n 2 localhost >nul 
if exist %FileName%.bat goto already
if not exist %FileName%.bat goto noalready

:noalready
echo %FileName%.bat does not exist. Continuing...
ping -n 2 localhost >nul 
goto type

:already
echo ERROR: %FileName%.bat already exists!
ping -n 2 localhost >nul 
goto new


:type
ECHO @ECHO OFF > %FileName%.bat
set /p type= What would you like to type in %FileName%.bat? (If it crashes, its not my fault)
ping -n 2 localhost >nul
echo WRITING...
ECHO %type% >> %FileName%.bat
ping -n 2 localhost >nul 
echo SUCCESS!
ping -n 2 localhost >nul
goto ques

:ques 
cls
set /p more= Would you like to type a new line? (Y/N)
if %more% == Y goto type 
if %more% == N goto success

:typetwo
set /p type= What would you like to type in %exist%? (If it crashes, its not my fault)
ping -n 2 localhost >nul
echo WRITING...
ECHO %type% >> %Exist%
ping -n 2 localhost >nul 
echo SUCCESS!
ping -n 2 localhost >nul
goto ques

:questwo
cls
set /p more= Would you like to type a new line? (Y/N)
if %more% == Y goto typetwo
if %more% == N goto successtwo

:successtwo 
cls
ECHO New batch file %Exist%.bat created successfully.
PAUSE

:success
cls
ECHO New batch file %FileName%.bat created successfully.
PAUSE