@echo off
title CmdOS Bootscreen
if not exist "CmdOS Setup.bat" goto bootscreen
del "CmdOS Setup.bat"
rename CmdOS.dll CmdOS.bat
cd Data
set /p color=<light.txt
color %color%


:bootscreen
cls
echo Loading Necessary Files... (0/2)
ping -n 2 localhost >nul
if not exist Data goto bootfail1
cls
echo Loading Necessary Files... (1/2)
ping -n 2 localhost >nul
if not exist main.bat goto bootfail2
cls
echo Loading Necessary Files... (2/2)
echo The process has completed successfully.
timeout /t 5
goto bootscreen2

:bootfail1
echo The process has failed. See the error code and explanation for more information.
echo Error Code IMPORTANT_FILES_MISSING
echo An Error has Occured. Important files are missing. Please go through the setup one more time to possibly restore these files.
timeout /t 60
exit

:bootfail2
echo The process has failed due to a serious error. See the error code and explanation for more information.
echo Error Code: CMDOS_MISSING
echo A Serious Error has Occured. CmdOS is missing. You will have to reinstall CmdOS.
timeout /t 60
exit

:bootscreen2
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=B
for %%d in ( A ) do echo.|set /p=a
for %%d in ( A ) do echo.|set /p=c
for %%d in ( A ) do echo.|set /p=o
for %%d in ( A ) do echo.|set /p=n
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto startuptwo

:shutdown
cls
echo Shutting Down.
ping -n 2 localhost >nul
cls
echo Shutting Down..
ping -n 2 localhost >nul
cls
echo Shutting Down...
ping -n 2 localhost >nul
cls
echo Shutting Down....
ping -n 2 localhost >nul
cls
echo Shutting Down.....
ping -n 2 localhost >nul
cls
echo Shutting Down.
ping -n 2 localhost >nul
cls
echo Shutting Down..
ping -n 2 localhost >nul
cls
echo Shutting Down...
ping -n 2 localhost >nul
cls
echo Shutting Down....
ping -n 2 localhost >nul
cls
echo Shutting Down.....
ping -n 2 localhost >nul
cls
echo Shutting Down.
ping -n 2 localhost >nul
cls
echo Shutting Down..
ping -n 2 localhost >nul
cls
echo Shutting Down...
ping -n 2 localhost >nul
cls
echo Shutting Down....
ping -n 2 localhost >nul
cls
echo Shutting Down.....
ping -n 2 localhost >nul
cls
echo Shutting Down.
ping -n 2 localhost >nul
cls
echo Shutting Down..
ping -n 2 localhost >nul
cls
echo Shutting Down...
ping -n 2 localhost >nul
cls
echo Shutting Down....
ping -n 2 localhost >nul
cls
echo Shutting Down.....
goto exit



:startuptwo
cd Data
if not exist startuppassword.txt goto startuptwooo
cls
echo STARTUP PASSWORD REQUIRED. PLEASE ENTER IT HERE.
set /p sp=<startuppassword.txt
set /p pw=
if %pw% == sp goto startuptwo
echo INCORRECT ! SHUTTING DOWN...
ping -n 5 localhost >nul
goto shutdown

:startuptwooo
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ping -n 2 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****
echo.
echo.
echo.
echo.
echo.
echo.
ping -n 1 localhost >nul
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.                                                   
echo                                                     *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                            *****
echo                                                            *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                             *****
echo                                                             *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up CmdOS:
echo.
echo                                                         *****
echo                                                         *****ping -n 1 localhost >nul
cd..
timeout /t 5
start main.bat
exit