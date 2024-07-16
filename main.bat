@echo off
set /p color=<CMCOLOR.color
color %color%
cd Data
title CmdOS+
set /p setupname=<name.txt

:mck1
cd..
echo Loading Necessary Files... (0/1)
ping -n 2 localhost >nul
if not exist Data goto bootfail1
cls
echo Loading Necessary Files... (1/1)
echo The process has completed successfully.
timeout /t 5
cd Data
goto login

:bootfail1
echo The process has failed. See the error code and explanation for more information.
echo Error Code IMPORTANT_FILES_MISSING
echo An Error has Occured. Important files are missing. Please go through the setup one more time to possibly restore these files.
timeout /t 60
exit


:login

cd..

cls

echo Hello, welcome to CmdOS! You have to log in, so you can choose from these options. (ONLY ONE OTHER USER CAN BE ADDED)
CmdMenuSel F8F0 "Login           " "Sign Up                 "

if %ERRORLEVEL% == 1 goto loginques

if %ERRORLEVEL% == 2 goto signup

:signup

cls 

set /p newuser= Username: 

set /p pass= Password:

ping -n 1 localhost >nul 

echo WRITING...

ping -n 4 localhost >nul

md other-users

cd other-users

md %newuser%

cd %newuser%

ECHO %pass% > password.txt

echo SUCCESS!! User created.

ping -n 2 localhost >nul

goto loginques





:loginques
cls
CmdMenuSel F8F0 "Admin" "Guest"

if %ERRORLEVEL% == 1 goto bootscreenc

if %ERRORLEVEL% == 2 goto guestlog

:guestlog

goto glogin

:wrongin

cls 

echo User has not been created! Go to sign up screen to sign up?

CmdMenuSel F8F0 "               Ok" "                     No"

if %ERRORLEVEL% == 1 goto signit

if %ERRORLEVEL% == 2 goto login

:glogin

cls

cd other-users

set /p username= Username: 

cd %username%

goto passwordguest



:passwordguest

set /p ou=<password.txt

echo Password:

set /p pw= 

if %pw% == %ou% goto desktopch

if not %pw% == %ou% goto wrongpassword

:not

cls

echo Username does not exist.

pause

goto glogin

:wrongpassword

echo WRONG!

ping -n 2 localhost >nul

goto login

:bootscreenc

cd Data

set /p passdesk=<password.txt

set /p passd= Password:

if %passd% == %passdesk% goto desktopch

if not %passd% == %passdesk% goto wrongpassword


:bootscreenu
cd Data
set /p bsu= Username: 
set /p usnd=<username.txt
if %bsu% == %usnd% goto bootscreen

:bootscreen

cls

cd Data

set /p pass=<password.txt

set /p password= Password:

if %password% == %pass% goto name

if not %password% == %pass% goto incorrecttwo

:name
cls
cd Data
set /p setupname=<name.txt
echo Is your name %setupname%? 
CmdMenuSel F8F0 "Yes" "No"
if %name% == 1 goto hello
if %name% == 2 goto ohno

:ohno
echo Oh No! Lets get you back to the sign in screen to get in the right account.
echo If this is okay,
pause
goto login

:hello
cls
echo Hello, %setupname% !
pause
goto desktop


:desktopcheck
cd Data
if not exist username.txt goto usernamesec
if exist username.txt goto desktop



:addusn
echo New Username:
set /p nusn=
ECHO %nusn% > username.txt
echo Done.
pause
goto desktop


:checkright
cls
echo Success! [HARDDRIVE]: BIOS_BOOT Exists!
ping -n 2 localhost >nul
echo Redirecting to desktop...
ping -n 2 localhost >nul
goto desktop

:profile

cls

set /p profile= Profiles: 1) Guest

if %profile% == 1 goto pincode

:desktopch
cls
if not exist LOG md LOG
if exist LOG goto discover
cd notifications
if not exist discovernotif.txt goto desktop
if exist discovernotif.txt goto discover

:discover
cd..
cd LOG
set _time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
ECHO Discover Notification Initiated. Time: %date% %_time% > LOGDISCOVER.txt
goto discovertwo

:discovertwo
cd..
cd notifications
cls
echo                                    Discover
echo.
echo.
echo.
echo CmdOS now has save data for games! That means if CmdOS closes abruptly,
echo it will know where you were at! 
echo Please note that this is still in its beta state.
echo Crashes may happen.
echo. 
echo.
echo 1) Ok     
echo 2) Don't show this again    

set /p ERRORLEVEL=
               
if %ERRORLEVEL% == 1 goto desktop

if %ERRORLEVEL% == 2 goto delanddesk

:delanddesk
echo WORKING...
ping -n 1 localhost >nul
del discovernotif.txt 
goto desktop
  

set /p ERRORLEVEL=
               
if %ERRORLEVEL% == 1 goto desktop

:desktop

cls

cd..

echo ===========================================
echo ===========================================
echo.
echo. 
echo   ___   __  __   ____    _____   ___
echo  / __) (  \/  ) (  _ \  (  _  ) / __)
echo ( (__   )    (   )(_) )  )(_)(  \__ \  +
echo  \___) (_/\/\_) (____/  (_____) (___/                       
echo.
echo         Welcome, %setupname% ! 
echo.
set _time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
echo          Time: %date% %_time%
echo ===========================================
echo ===========================================
goto entercommand
:entercommand
echo ENTER A COMMAND.
echo Type help to view commands!
echo.
set /p cmdselect= 
echo.
if %cmdselect% == help goto echohelp
if %cmdselect% == apps goto apps
if %cmdselect% == logout goto login
if %cmdselect% == restart goto startbb 
if %cmdselect% == shutdown goto shutdowncmdos
if %cmdselect% == clear goto desktop
if %cmdselect% == reset goto factorywarn
echo INVALID COMMAND!


:savedatarps
cd..

echo                          Save Data Found
echo.
echo.
echo.
echo CmdOS found a save file for Rock Paper Scissors.
echo.
echo Would you like to go there?
echo.
echo If you got this notification for absolutely no reason,
echo.
echo click no and report this as a bug in the github page.
echo. 
echo.
echo 1) Yes
echo 2) No   

set /p ERRORLEVEL=
               
if %ERRORLEVEL% == 1 goto start

if %ERRORLEVEL% == 2 goto desktop

:echohelp
echo -LIST OF COMMANDS-
echo help - Views a list of commands
echo apps - Views apps to go to
echo logout - Log out
echo restart - Self explanatory
echo shutdown - Shutdown
echo clear - Clears Commands (Good for messy desktop!)
echo reset - Resets CmdOS!
goto entercommand

:startbb
cd..
start bootscreen.bat
exit

:shutdowncmdos
echo Shutting Down...
exit

:apps

cls

mode con: cols=120 lines=30

echo Here are your choices.

echo 1)Write text file.

echo 2)Documents...

echo 3) Info

echo 4) Calculator

echo 5) Notepad (open in your main Windows OS)

echo 6) Close CmdOS

echo 7) Open Google (Quick way)

echo 8) Open The Folder Containing This Package (Quick way)

echo 9) unavailable

echo 10) unavailable

echo 11) Open Info (In a message box)

echo 12) Create a Batch File

echo 13) Command Prompt

echo 14) Restart Into BIOS

echo 15) Games

echo 16) Settings

echo 17) Screensaver

echo 18) Go to Desktop


set /p menuselect=

if %menuselect% == 1 goto write

if %menuselect% == 2 goto docs

if %menuselect% == 3 goto info

if %menuselect% == 4 goto calc

if %menuselect% == 5 goto notepad

if %menuselect% == 6 goto close

if %menuselect% == 7 goto google

if %menuselect% == 8 goto packageinfolder

if %menuselect% == 9 goto unavail

if %menuselect% == 10 goto unavail

if %menuselect% == 11 goto openinfoinmsgbox

if %menuselect% == 12 goto batchfile

if %menuselect% == 13 goto commandprompt

if %menuselect% == 14 goto restartbios

if %menuselect% == 15 goto gamescmdos

if %menuselect% == 16 goto settings

if %menuselect% == 17 goto screensaverone

if %menuselect% == 18 goto desktop

if %menuselect% == 19 goto failure

:failure
cls
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   $$$$$
echo   $     $     $     $  $ $$     $  $   $
echo     $$$ $                       $$$$     $$$
echo                                            $
echo                                        $$$$  
echo.
echo.
echo Something happened with CmdOS. Attempting to restart...
echo.
echo Error Code: APP_FIND_FAILURE
ping  -n 10 localhost >nul
start bootscreen.bat
exit


:screensaverone

cls

echo                                           
echo                                                   ******

ping -n 1 localhost >nul

cls


echo                                                   *****


ping -n 1 localhost >nul

cls
echo                                                  ******


ping -n 1 localhost >nul

cls
echo                                           **

ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls

echo                                           ******

ping -n 1 localhost >nul

cls

echo                                           ********



ping -n 1 localhost >nul

cls
echo                                           ******


ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls
echo                                           **

ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls

echo                                           ******

ping -n 1 localhost >nul

cls

echo                                           ********


ping -n 1 localhost >nul

cls
echo                                           ******


ping -n 1 localhost >nul

cls
echo                                           ****

ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul

cls
ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul


goto screensaver


:settings
cls
echo 1) Update
echo 2) Move and Reset

set /p set=

if %set% == 1 goto update

if %set% == 2 goto backupandreset

:backupandreset

cls

echo 1) Move

echo 2) Reset

set /p bar=

if %bar% == 1 goto usureaboutthat

if %bar% == 2 goto factorywarn

:usureaboutthat
start talk.vbs
echo Are you sure you want to do this? If not, close the window.
echo If this is okay,
pause
goto backupmddm

:backupmdddm

echo Name for the folder?

set /p folder=

ping -n 2 localhost >nul

echo MAKING FOLDER...

md %folder%

ping -n 2 localhost >nul

cls

echo MOVING BOOT_...

move BOOT_ %folder%

ping -n 2 localhost >nul

cls

echo MOVING Data...

move Data %folder%

ping -n 2 localhost >nul

cls

echo MOVING bootscreen.bat...

move bootscreen.bat %folder% 

ping -n 2 localhost >nul

cls

echo MOVING cmdmenusel.exe...

move cmdmenusel.exe %folder%

ping -n 2 localhost >nul

cls

echo MOVING CmdOS.bat...

move CmdOS.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING  homecmdos.bat...

move homecmdos.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING  unavailable.vbs...

move unavailable.vbs %folder%

ping -n 2 localhost >nul

cls

echo MOVING writable.bat...

move writable.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING FOLDER TO DIRECTORY...

move %folder% %dir%

echo FINISHING...

cd %dir%

cd %folder%

ECHO Hello! Thanks for using the Move feature. If this doesn't work properly, please report this to the issue section as bug on the github page. > MoveREADME.txt

ping -n 2 localhost >nul

goto desktop

:update
cd UPDATE_
start UPDATE.bat

endlocal

pause

goto updatestarted

:updatestarted

echo Update Started. Please look at your CmdOS folder for the latest release for CmdOS.
echo If this did not download, please report this as a bug on the github page.
pause
goto desktop

:gamescmdos
cls
	
echo Pick game.	

echo 1) Character Generator   
                      
echo 2) Stopwatch      
                     
echo 3) Guess the Number  

echo 4) Rock Paper Sissors

set /p ERRORLEVEL= 


if %ERRORLEVEL% == 1 goto strt


if %ERRORLEVEL% == 2 goto counter


if %ERRORLEVEL% == 3 goto numberguesser


if %ERRORLEVEL% == 4 goto rps


:rps
title Rock, Paper, Scissors Game
color 0E
goto Start

:Start
cd Data
echo rockpaperscissors >> savedata.cmdos
cd..
cls
echo Welcome to Rock, Paper, Scissors!
echo.
echo Choose your weapon:
echo 1. Rock
echo 2. Paper
echo 3. Scissors
echo.

set /p userChoice=Enter your choice (1/2/3): 
set /a computerChoice=%random% %% 3 + 1

if %userChoice%==1 set userWeapon=Rock
if %userChoice%==2 set userWeapon=Paper
if %userChoice%==3 set userWeapon=Scissors

if %computerChoice%==1 set computerWeapon=Rock
if %computerChoice%==2 set computerWeapon=Paper
if %computerChoice%==3 set computerWeapon=Scissors

echo You chose %userWeapon%
echo Computer chose %computerWeapon%
echo.

call :CheckWin %userChoice% %computerChoice%
echo.
echo Play again? (y/n)
set /p playAgain=
if /i "%playAgain%"=="y" goto Start

echo Thanks for playing!
pause > nul
cd Data
del savedata.cmdos
cd.. 
exit

:CheckWin
if %1==%2 (
    echo It's a tie!
    goto :eof
)

if %1==1 if %2==3 (
    echo Rock crushes Scissors! You win!
    goto :eof
)

if %1==2 if %2==1 (
    echo Paper covers Rock! You win!
    goto :eof
)

if %1==3 if %2==2 (
    echo Scissors cuts Paper! You win!
    goto :eof
)

echo You lose! Better luck next time!
goto :eof

:strt
title Character Generator
cls
echo How many characters (abc...) should this generate?
echo One character=one byte on your hard disk.
set /p num=^>
set /a cutof2f=num+1
goto generate
:generate
set /a cutoff=cutoff+1
if %cutoff% equ %cutoff2% goto display
echo Generating character %cutoff% out of %num%...
set /a pre=%random%*30/32768+1
if %pre% equ 1 set char=a
if %pre% equ 2 set char=b
if %pre% equ 3 set char=c
if %pre% equ 4 set char=d
if %pre% equ 5 set char=e
if %pre% equ 6 set char=f
if %pre% equ 7 set char=g
if %pre% equ 8 set char=h
if %pre% equ 9 set char=i
if %pre% equ 10 set char=j
if %pre% equ 11 set char=k
if %pre% equ 12 set char=l
if %pre% equ 13 set char=m
if %pre% equ 14 set char=n
if %pre% equ 15 set char=o
if %pre% equ 16 set char=p
if %pre% equ 17 set char=q
if %pre% equ 18 set char=r
if %pre% equ 19 set char=s
if %pre% equ 20 set char=t
if %pre% equ 21 set char=u
if %pre% equ 22 set char=v
if %pre% equ 23 set char=w
if %pre% equ 24 set char=x
if %pre% equ 25 set char=y
if %pre% equ 26 set char=z
if %pre% equ 27 set char=1
if %pre% equ 28 set char=2
if %pre% equ 29 set char=3
if %pre% equ 30 set char=4
set /p="%char%">tempchars.txt

:counter
title Time Counter
set second=0
set minute=0
set hour=0
goto count
:count
set /a second=second+1
if %second% equ 60 set /a minute=minute+1 && set second=0
if %minute% equ 60 set /a hour=hour+1 && set minute=0
echo Hour:%hour%
echo Minute:%minute%
echo Second:%second%
ping -n 2 127.0.0.1>nul
cls
goto count

:numberguesser
title Number Picker
set points=0
goto intro
:intro
echo Number Picker
echo The goal is the get the as many points as you can!
pause
:setup
cls
echo how many numbers to choose from?
echo 1-10, 1-100 or 1-1000.
set /p answer=10, 100, 1000 or quit^>
if %answer% equ 10 goto 10
if %answer% equ 100 goto 100
if %answer% equ 1000 goto 1000
if %answer% equ quit exit
if %answer% neq 10 goto setup
:10
cls
set /a number=%random%*10/32768+1
:10_2
cls
echo Current points: %points%
echo Guess the number (1-10)
echo To guess type in a number between 1 and 10.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :10_2
:100
set /a number=%random%*100/32768+1
:100_2
cls
echo Current points: %points%
echo Guess the number (1-100)
echo To guess type in a number between 1 and 100.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :100_2
:1000
set /a number=%random%*1000/32768+1
:1000_2
cls
echo Current points: %points%
echo Guess the number (1-1000)
echo To guess type in a number between 1 and 1000.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :1000_2
:Win
cls
echo You guessed the number!
echo Good job!
echo You get 1 point!
set /a points=points+1
echo Total points: %points%
pause
goto setup

:display
cls
type tempchars.txt
start tempchars.txt
del tempchars.txt
pause
goto strt


:batchfile
start writable.bat
exit


:restartbios
cls
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=B
for %%d in ( A ) do echo.|set /p=a   
for %%d in ( A ) do echo.|set /p=c
for %%d in ( A ) do echo.|set /p=o
for %%d in ( A ) do echo.|set /p=n
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
pause
goto biosbootup

:biosbootup

echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
ping -n 2 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo R
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RE
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RES
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo REST
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTA
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTAR
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART I
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART IN
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INT
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO B
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BI
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BIO
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BIOS
ping -n 4 localhost >nul
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
ping -n 2 localhost -2
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
ping -n 2 localhost >nul
cls
echo LOADED. BOOTING...
ping -n 2 localhost >nul
goto biosmenupick


:biosmenupick

cls

echo * 1. System Configuration and Boot * 2. Reset Options

echo 1) Boot

echo 2) Boot Options

echo To go to a new section, type esc.


set /p ERRORLEVEL= 

if %ERRORLEVEL% == 1 goto bootsetup

if %ERRORLEVEL% == 2 goto bo

if %ERRORLEVEL% == esc goto pickoptions

:pickoptions
cls
CmdMenuSel 0FF0 "1. System Configuration          " "2. Reset Options             "
if %ERRORLEVEL% == 1 goto biosmenupick
if %ERRORLEVEL% == 2 goto biosmenupicktwo

:bo
cls
CmdMenuSel 0FF0 "1. Legacy Support                    "
echo Type esc to go to a new section.
set /p bopick=
if %bopick% == esc goto pickoptions
if %ERRORLEVEL% == 1 goto yesornols

:yesornols
cd Data
cls
echo Yes Or No?
CmdMenuSel "Yes           " "No            "
if %ERRORLEVEL% == 1 echo SUCCESS & goto biosmenupick
if %ERRORLEVEL% == 2 goto biosmenupick


:biosmenupicktwo
echo 1. System Configuration * 2. Reset Options
echo 1) Reset CmdOS
set /p el=
if %el% = 1 goto factorywarn

:bootsetup
cls
echo Choose.
echo 1) Mega Menu
set /p ERRORLEVEL=
if %ERRORLEVEL% == 1 goto bootmega

:bootmega

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
for %%d in ( A ) do echo.|set /p=M
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=G
for %%d in ( A ) do echo.|set /p=A
for %%d in ( A ) do echo.|set /p=*
for %%d in ( A ) do echo.|set /p=M
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=N
for %%d in ( A ) do echo.|set /p=U
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto startuptwo

:startuptwo 
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
echo.
echo                                                         *****
echo                                                         *****
cd BOOT_
start BOOT_MENU.bat
exit

:bootdebi
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
echo.
echo                                                         *****
echo                                                         *****
cd BOOT_
start BOOT_MENU.bat
exit



:factorywarn

cls

set /p reset= WARNING!! THIS CANNOT BE UNDONE. THIS WILL DELETE ALL USERS AND WILL RESET ALL THEIRS AND YOUR DATA. RESET? Y/N

if %reset% == Y goto factoryreset
if %reset% == N goto bootrestart

:factoryreset

cls

for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=B
for %%d in ( A ) do echo.|set /p=a
for %%d in ( A ) do echo.|set /p=c
for %%d in ( A ) do echo.|set /p=o
for %%d in ( A ) do echo.|set /p=n
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto resettwo

:resettwo
cls
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=R
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=S
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=T
for %%d in ( A ) do echo.|set /p=T
for %%d in ( A ) do echo.|set /p=I
for %%d in ( A ) do echo.|set /p=N
for %%d in ( A ) do echo.|set /p=G
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto three

:three

cls

echo RESETTING. 1%
ping -n 2 localhost >nul
cls
echo RESETTING.. 1%
ping -n 2 localhost >nul
cls
echo RESETTING... 10%
ping -n 2 localhost >nul
cls
echo RESETTING.   20%
ping -n 2 localhost >nul
cls
echo RESETTING..   37%
ping -n 2 localhost >nul
cls
echo RESETTING...  45%
ping -n 2 localhost >nul
cls
echo RESETTING.     65%
ping -n 2 localhost >nul
cls
echo RESETTING..     75%
ping -n 2 localhost >nul
cls
echo RESETTING...    78%
ping -n 2 localhost >nul
cls
echo RESETTING.      89%
ping -n 2 localhost >nul
cls
echo RESETTING..     95%
ping -n 2 localhost >nul
cls
echo RESETTING...    98%
ping -n 2 localhost >nul
cls
echo RESETTING.      99%
ping -n 2 localhost >nul
cls
echo RESETTING..     100%
ping -n 2 localhost >nul
cls
echo RESETTING...    100%
ping -n 2 localhost >nul
goto setupdel

:setupdel
del Data
if exist other-users del other-users
goto checktwoo

:checktwoo
if exist other-users goto checkexistou
if not exist other-users goto setupstart


:checkexistou
del other-users
goto setupstart


:setupstart
echo    $$$     
echo   $           
echo   $           
echo     $$$  
ping -n 2 localhost >nul
cls              
echo    $$$  $$$      $     
echo   $     $   $   $  $        
echo   $     $     $     $     
echo     $$$ $  
ping -n 2 localhost >nul
cls                       
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $     
echo   $     $     $     $  $ $$       
echo     $$$ $                         
ping -n 2 localhost >nul
cls                                                                                
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   
echo   $     $     $     $  $ $$     $  $   
echo     $$$ $                       $$$$     
ping -n 2 localhost >nul
cls                                       
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   $$$$$
echo   $     $     $     $  $ $$     $  $   $
echo     $$$ $                       $$$$     $$$
echo                                            $
echo                                        $$$$ 
ping -n 2 localhost >nul
goto setupone

:setupone
cls
color 1f
title Setup
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 0 OF 3 
echo.
echo                                                               
echo.
echo -------------------------------------------------------------------------------------
echo You have tasks in order to install CmdOS.
echo 1: Install Files.
pause
goto filesinstall

:filesinstall
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing files...
echo [             0                ]
ping -n 2 localhost >nul
cls
echo Installing files...
echo [-------------50               ]
ping -n 2 localhost >nul
cls
echo Files installed.
ping -n 2 localhost >nul
goto setupagain

:setupagain
echo Good! Now lets install the drivers, ok?
pause
goto driversetup
:driversetup
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing drivers...
echo [              0               ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing drivers...
echo [---------     40              ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Drivers installed!
ping -n 2 localhost >nul
goto setupagaintwo

:setupagaintwo
echo Alright! Now 1 Last thing to do here: Install Additional Programs!
pause
goto additionalprogramssetup

:additionalprogramssetup
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing additional programs...
echo [               0              ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing additional programs...
echo [--------------70---------     ]  
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Additional programs installed. Continuing...
ping -n 2 localhost >nul
goto installcmdos

:installcmdos
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 2 OF 3 
echo.
echo                              Setup Requirements
echo.
echo -------------------------------------------------------------------------------------
echo.
set /p sr= What Should We Call You?
ping -n 2 localhost >nul
echo WRITING...
md Data
cd Data
ECHO %sr% > name.txt
ping -n 2 localhost >nul
echo Done.
pause
goto parttwo

:parttwo
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 2 OF 3 
echo.
echo                              Setup Requirements
echo.
echo -------------------------------------------------------------------------------------
echo.
echo What would you like your password to be?
set /p pass= 
ping -n 2 localhost >nul
echo WRITING...
ping -n 2 localhost >nul
cd Data
ECHO %pass% > password.txt
ping -n 2 localhost >nul
echo SUCCESS! 
ping -n 2 localhost >nul
pause
goto activate

:activate
cls
ECHO %random% > activatecode.txt
goto activatecode

:activatecode
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                Activate CmdOS
echo.
echo -------------------------------------------------------------------------------------
set /p activatecode=<activatecode.txt
echo CmdOS made an activate code to install CmdOS. Please look in your CmdOS folder and look
echo at a text document named activatecode.txt. 
echo Please enter that code into here.
set /p activate=
if %activate% == %activatecode% goto activatesuccess
if not %activate% == %activatecode% goto activatewrong

:activatewrong
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                Activate CmdOS
echo.
echo -------------------------------------------------------------------------------------
echo WRONG CODE!!!
pause
goto activatecode

:activatesuccess
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                     
echo.
echo -------------------------------------------------------------------------------------
echo Activating... (1%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           CmdOS just got even better!
echo.                          It can now write files!
echo -------------------------------------------------------------------------------------
echo Activating... (2%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           CmdOS just got even better!
echo.                          It can now write files!
echo -------------------------------------------------------------------------------------
echo Activating... (10%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           You can now play games!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (20%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           You can now play games!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (30%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       CmdMenuSel makes choosing better!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (30%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       CmdMenuSel makes choosing better!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (50%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       Just like the olden day computers!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (60%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       Just like the olden day computers!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (70%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                          Supported with any Windows OS!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (80%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                          Supported with any Windows OS!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (90%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                               Finishing...
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (100%)
ping -n 4 localhost >nul
goto lastsetup



:lastsetup
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                 Finished.
echo.                         
echo -------------------------------------------------------------------------------------
echo Okay, now the setup is done. Now CmdOS will Restart.
pause

start bootscreen.bat

exit






















:write

cls

echo Welcome to Write, an application which let's you write text files...

echo What will be the name of your text?

set /p writeone= Name:

cls

echo Ok, your file has been created. Have fun!

pause

cls

set /p textone=

pause

echo You will be going back to the desktop

pause

goto desktop

:docs

cls

echo 1)%writeone%

echo 2)%writetwo%

echo 3)%writethree%

set /p browse= 

if %browse% == 1 goto textone

if %browse% == 2 goto texttwo

if %browse% == 3 goto textthree

:textone

cls

echo %writeone%

echo %textone%pause

goto desktop

:texttwo

cls

echo %writetwo%

echo %texttwo%

pause

goto desktop

:textthree

cls

echo %writethree%

echo %textthree%

pause

goto desktop

p:info

echo CmdOS

pause

goto desktop 

:calc

cls

set /p equ=

set /a equ=%equ%

cls

echo %equ%

pause

goto desktop

:notepad

START /MAX C:\Windows\NOTEPAD.EXE

:close

close

:google 

START CHROME www.google.com

:packageinfolder

START F:\

START E:\

:bootscreentwo

goto bootscreen

:random

echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%

:randomtwo

echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% pause
pause
goto desktop

:openinfoinmsgbox

msg * CmdOS

:batch

cls

echo Welcome to Project Folder Creator.

echo Will create the following folder:

echo %foldername%

echo If this is okay,

pause

cls

set /p md= foldername?

set foldername=%md%

md %foldername%

cd %foldername%

md cache

cd cache

md proxies

cd md footage

cd footage

md img seq

cd..

md preview

md projectfiles

md references

md renders

cd renders

md passes

cd..

cls

cd..

start %foldername%

cd %foldername%

echo Batch Complete!

tree

pause

pause

goto desktop


:incorrect

cls

set /p incorrect= INCORRECT!!! Type back to go back

if %incorrect% == back goto bootscreen

if not %incorrect% == back goto crash

:incorrecttwo

cls

set /p incorrect= INCORRECT!!! Type back to go back

if %incorrect% == back goto pin

:crash 
start crash.vbs     

:commandprompt
cls

echo Hello! Welcome to Command Prompt! What are your commands?

set /p command= Command:

if %command% == color goto systemsetting

if %command% == run task calculator goto kalk

if %command% == filesdelete goto bsod

:bsod
cls
echo :
echo   (
echo.
echo.
echo.
echo CmdOS Has ran into a problem. Wait a minute while we fix it.
ping -n 10 localhost >nul 
echo Done. Restarting.....
ping -n 4 localhost >nul
goto bootnotfound

:bootnotfound
cls
echo BOOT NOT FOUND. GOING TO BIOS.....
ping -4 localhost >nul
echo BIOS NOT FOUND. ATTEMPTING TO DO AN EMERGENCY RESET......
ping -4 localhost >nul
goto three

:files

cls

echo Now on C:\CmdOS\CmdOS Files\.

set /p cmd= Command:

if %cmd% == start systemsetting.cmdos goto systemsetting

if %cmd% == calculator goto kalk

:systemsetting
cls

set /p ERRORLEVEL= What would you like the color to be? Type:1) Blue 2) Green 3) Aqua 4) Red 5) Purple 6) Yellow 7) Gray 8) Dark Gray 9) Light Blue 10) Light Green 11) Light Aqua 12) Light Red 13) Light Purple 14) Light Yellow 15) White


if %ERRORLEVEL% == 1 set barva=01
if %ERRORLEVEL% == 2 set barva=02
if %ERRORLEVEL% == 3 set barva=03
if %ERRORLEVEL% == 4 set barva=04
if %ERRORLEVEL% == 5 set barva=05
if %ERRORLEVEL% == 6 set barva=06
if %ERRORLEVEL% == 7 set barva=07
if %ERRORLEVEL% == 8 set barva=08
if %ERRORLEVEL% == 9 set barva=09
if %ERRORLEVEL% == 10 set barva=0A
if %ERRORLEVEL% == 11 set barva=0B
if %ERRORLEVEL% == 12 set barva=0C
if %ERRORLEVEL% == 13 set barva=0D
if %ERRORLEVEL% == 14 set barva=0E
if %ERRORLEVEL% == 15 set barva=0F
color %barva%
pause
goto desktop

:kalk
@echo off
::RESIZE
mode con: cols=120 lines=30
title Calculator
color 2E
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
if %second% equ 21 goto chyba
if %second% equ 41 goto chyba
if %second% equ 30 goto chyba
if %second% equ 05 goto chyba
goto kalk

:chyba
cd..
cd data
cd info
set /p verze=<ver.debidat
cd..
cd..
cd core
color 1F
echo CMDOS %verze% - ERROR
echo.
echo Collecting informations...
for %%d in ( A L Z ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A L Z A L Z A L Z A L ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A A A A A A A ) do echo.|set /p=.
ping -n 2 localhost >nul
echo.
echo App [ Calculator ] stopped working!
echo Click ENTER to return to the system...
echo.
echo Sorry for problems.
echo Error ID: Calculator_UNKNOWN_%random%
pause >nul

exit

:kalk
cls
echo Welcome to calculator!
echo.
echo If you want to exit calculator, type "exit"
:vypocitat
set /p kalk=Enter math expression: 

set vyrazyprikaz=vyrazy
set vyrazyprikaz2=+
set vyrazyprikaz3=-
set vyrazyprikaz4=*
set vyrazyprikaz5=/
set odejit=exit
set odejit2=odejit
set odejit3=zavrit
set odejit4=vypnout
set odejit5=stop

if "%kalk%" equ "%vyrazyprikaz%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz2%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz3%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz4%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz5%" goto vyrazy
if "%kalk%" equ "%odejit%" goto exitt
if "%kalk%" equ "%odejit2%" goto exitt
if "%kalk%" equ "%odejit3%" goto exitt
if "%kalk%" equ "%odejit4%" goto exitt
if "%kalk%" equ "%odejit5%" goto exitt

set /a vysledek=%kalk%
echo Result: %vysledek%
set /a vysledek=0
goto vypocitat

:exitt
goto desktop

:vyrazy
cls
echo List of available expressions:
echo.
echo + Add            - Substract
echo * Multiply       / Divide
echo.
echo Example: 5*3-6
echo Result: 9
echo.
echo Click ENTER to return to the calculator
pause >nul
goto kalk























--------------
-------------------------
-------------------------------------
--------------------------------------------------------------------------
----------glitched stuff; dont run cmdos on this script----------
-----------------------------------------------------------------
   ---------------------------------------------------------
         -----------------------------------------------
              -------------------------------------

                               |
                            down here
why u in the script anyway?













@echo off
cd..
set /p base=<database.cmdos
if %base% == Machine State = On goto ntop
cd Data
set /p color=<CMCOLOR.color
color %color%
cd..
del database.cmdos
echo Machine State = On > database.cmdos
cd Data
title CMDOS *5.0* !!

:ntop
cls
echo CmdOS Error!
echo CmdOS was not turned off properly.
echo For CmdOS to run, it needs to restart.
pause
del database.cmdos
echo Machine State = Off > database.cmdos
start CmdOS.bat
exit

:mck1
cd..
echo Loading Necessary Files... (0/1)
ping -n 2 localhost >nul
if not exist Data goto bootfail1
cls
echo Loading Necessary Files... (1/1)
echo The process has completed successfully.
timeout /t 5
cd Data
goto login

:bootfail1
echo The process has failed. See the error code and explanation for more information.
echo Error Code IMPORTANT_FILES_MISSING
echo An Error has Occured. Important files are missing. Please go through the setup one more time to possibly restore these files.
timeout /t 60
exit


:login

cd..

cls

echo Hello, welcome to CmdOS! You have to log in, so you can choose from these options. (ONLY ONE OTHER USER CAN BE ADDED)
CmdMenuSel F8F0 "Login           " "Sign Up                 "

if %ERRORLEVEL% == 1 goto loginques

if %ERRORLEVEL% == 2 goto signup

:signup

cls 

set /p newuser= Username: 

set /p pass= Password:

ping -n 1 localhost >nul 

echo WRITING...

ping -n 4 localhost >nul

md other-users

cd other-users

md %newuser%

cd %newuser%

ECHO %pass% > password.txt

echo SUCCESS!! User created.

ping -n 2 localhost >nul

goto loginques





:loginques
cls
CmdMenuSel F8F0 "Admin" "Guest"

if %ERRORLEVEL% == 1 goto bootscreenc

if %ERRORLEVEL% == 2 goto guestlog

:guestlog

goto glogin

:wrongin

cls 

echo User has not been created! Go to sign up screen to sign up?

CmdMenuSel F8F0 "               Ok" "                     No"

if %ERRORLEVEL% == 1 goto signit

if %ERRORLEVEL% == 2 goto login

:glogin

cls

cd other-users

set /p username= Username: 

cd %username%

goto passwordguest



:passwordguest

set /p ou=<password.txt

echo Password:

set /p pw= 

if %pw% == %ou% goto desktopch

if not %pw% == %ou% goto wrongpassword

:not

cls

echo Username does not exist.

pause

goto glogin

:wrongpassword

echo WRONG!

ping -n 2 localhost >nul

goto login

:bootscreenc

cd Data

set /p passdesk=<password.txt

set /p passd= Password:

if %passd% == %passdesk% goto desktopch

if not %passd% == %passdesk% goto wrongpassword


:bootscreenu
cd Data
set /p bsu= Username: 
set /p usnd=<username.txt
if %bsu% == %usnd% goto bootscreen

:bootscreen

cls

cd Data

set /p pass=<password.txt

set /p password= Password:

if %password% == %pass% goto name

if not %password% == %pass% goto incorrecttwo

:name
cls
cd Data
set /p setupname=<name.txt
echo Is your name %setupname%? 
CmdMenuSel F8F0 "Yes" "No"
if %name% == 1 goto hello
if %name% == 2 goto ohno

:ohno
echo Oh No! Lets get you back to the sign in screen to get in the right account.
echo If this is okay,
pause
goto login

:hello
cls
echo Hello, %setupname% !
pause
goto desktop


:desktopcheck
cd Data
if not exist username.txt goto usernamesec
if exist username.txt goto desktop



:addusn
echo New Username:
set /p nusn=
ECHO %nusn% > username.txt
echo Done.
pause
goto desktop


:checkright
cls
echo Success! [HARDDRIVE]: BIOS_BOOT Exists!
ping -n 2 localhost >nul
echo Redirecting to desktop...
ping -n 2 localhost >nul
goto desktop

:profile

cls

set /p profile= Profiles: 1) Guest

if %profile% == 1 goto pincode

:desktopch
cls
if not exist LOG md LOG
if exist LOG goto discover
cd notifications
if not exist discovernotif.txt goto desktop
if exist discovernotif.txt goto discover

:discover
cd..
cd LOG
set _time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
ECHO Discover Notification Initiated. Time: %date% %_time% > LOGDISCOVER.txt
goto discovertwo

:discovertwo
cd..
cd notifications
cls
echo                                    Discover
echo.
echo.
echo.
echo CmdOS Now has a DOS first thing after sign in! Before accessing all of the apps, 
echo you will have to put the command "apps"!
echo. 
echo.
echo 1) Ok     
echo 2) Don't show this again    

set /p ERRORLEVEL=
               
if %ERRORLEVEL% == 1 goto notificationch

if %ERRORLEVEL% == 2 goto delanddesk

:delanddesk
echo WORKING...
ping -n 1 localhost >nul
del discovernotif.txt 
goto desktop

:notificationch
cls
echo                                    Discover
echo.
echo.
echo.
echo What you just saw there was a Notification. It's a new thing in CmdOS!
echo.
echo. 
echo.
echo 1) Ok     

set /p ERRORLEVEL=
               
if %ERRORLEVEL% == 1 goto desktop
:desktop

cls

cd..

echo ######################################################################################
echo.
echo. 
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   $$$$$
echo   $     $     $     $  $ $$     $  $   $
echo     $$$ $                       $$$$     $$$
echo                                            $
echo                                        $$$$                       
echo.
echo                   Welcome, %setupname% ! 
echo.
set _time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
echo                  Time: %date% %_time%
echo ########################################################################################
goto entercommand
:entercommand
echo ENTER A COMMAND.
echo Type help to view commands!
echo.
set /p cmdselect= 
echo.
if %cmdselect% == help goto echohelp
if %cmdselect% == apps goto apps
if %cmdselect% == logout goto login
if %cmdselect% == restart goto startbb 
if %cmdselect% == shutdown goto shutdowncmdos
if %cmdselect% == clear goto desktop
if %cmdselect% == reset goto factorywarn
echo INVALID COMMAND!


:echohelp
echo -LIST OF COMMANDS-
echo help - Views a list of commands
echo apps - Views apps to go to
echo logout - Log out
echo restart - Self explanatory
echo shutdown - Shutdown
echo clear - Clears Commands (Good for messy desktop!)
echo reset - Resets CmdOS!
goto entercommand

:startbb
cd..
start bootscreen.bat
exit

:shutdowncmdos
echo Shutting Down...
cd..
del database.cmdos
echo Machine State = Off > database.cmdos
exit

:apps

cls

mode con: cols=120 lines=30

echo Here are your choices.

echo 1)Write text file.

echo 2)Documents...

echo 3) Info

echo 4) Calculator

echo 5) Notepad (open in your main Windows OS)

echo 6) Close CmdOS

echo 7) Open Google (Quick way)

echo 8) Open The Folder Containing This Package (Quick way)

echo 9) unavailable

echo 10) unavailable

echo 11) Open Info (In a message box)

echo 12) Create a Batch File

echo 13) Command Prompt

echo 14) Restart Into BIOS

echo 15) Games

echo 16) Settings

echo 17) Screensaver

echo 18) Go to Desktop


set /p menuselect=

if %menuselect% == 1 goto write

if %menuselect% == 2 goto docs

if %menuselect% == 3 goto info

if %menuselect% == 4 goto calc

if %menuselect% == 5 goto notepad

if %menuselect% == 6 goto close

if %menuselect% == 7 goto google

if %menuselect% == 8 goto packageinfolder

if %menuselect% == 9 goto unavail

if %menuselect% == 10 goto unavail

if %menuselect% == 11 goto openinfoinmsgbox

if %menuselect% == 12 goto batchfile

if %menuselect% == 13 goto commandprompt

if %menuselect% == 14 goto restartbios

if %menuselect% == 15 goto gamescmdos

if %menuselect% == 16 goto settings

if %menuselect% == 17 goto screensaverone

if %menuselect% == 18 goto desktop

if %menuselect% == 19 goto failure

:failure
cls
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   $$$$$
echo   $     $     $     $  $ $$     $  $   $
echo     $$$ $                       $$$$     $$$
echo                                            $
echo                                        $$$$  
echo.
echo.
echo Something happened with CmdOS. Attempting to restart...
echo.
echo Error Code: APP_FIND_FAILURE
ping  -n 10 localhost >nul
start bootscreen.bat
exit


:screensaverone

cls

echo                                           
echo                                                   ******

ping -n 1 localhost >nul

cls


echo                                                   *****


ping -n 1 localhost >nul

cls
echo                                                  ******


ping -n 1 localhost >nul

cls
echo                                           **

ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls

echo                                           ******

ping -n 1 localhost >nul

cls

echo                                           ********



ping -n 1 localhost >nul

cls
echo                                           ******


ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls
echo                                           **

ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul

cls
echo                                           ****


ping -n 1 localhost >nul

cls

echo                                           ******

ping -n 1 localhost >nul

cls

echo                                           ********


ping -n 1 localhost >nul

cls
echo                                           ******


ping -n 1 localhost >nul

cls
echo                                           ****

ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul

cls
ping -n 1 localhost >nul

cls
echo                                           **


ping -n 1 localhost >nul


goto screensaver


:settings
cls
echo 1) Update
echo 2) Move and Reset

set /p set=

if %set% == 1 goto update

if %set% == 2 goto backupandreset

:backupandreset

cls

echo 1) Move

echo 2) Reset

set /p bar=

if %bar% == 1 goto usureaboutthat

if %bar% == 2 goto factorywarn

:usureaboutthat
start talk.vbs
echo Are you sure you want to do this? If not, close the window.
echo If this is okay,
pause
goto backupmddm

:backupmdddm

echo Name for the folder?

set /p folder=

ping -n 2 localhost >nul

echo MAKING FOLDER...

md %folder%

ping -n 2 localhost >nul

cls

echo MOVING BOOT_...

move BOOT_ %folder%

ping -n 2 localhost >nul

cls

echo MOVING Data...

move Data %folder%

ping -n 2 localhost >nul

cls

echo MOVING bootscreen.bat...

move bootscreen.bat %folder% 

ping -n 2 localhost >nul

cls

echo MOVING cmdmenusel.exe...

move cmdmenusel.exe %folder%

ping -n 2 localhost >nul

cls

echo MOVING CmdOS.bat...

move CmdOS.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING  homecmdos.bat...

move homecmdos.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING  unavailable.vbs...

move unavailable.vbs %folder%

ping -n 2 localhost >nul

cls

echo MOVING writable.bat...

move writable.bat %folder%

ping -n 2 localhost >nul

cls

echo MOVING FOLDER TO DIRECTORY...

move %folder% %dir%

echo FINISHING...

cd %dir%

cd %folder%

ECHO Hello! Thanks for using the Move feature. If this doesn't work properly, please report this to the issue section as bug on the github page. > MoveREADME.txt

ping -n 2 localhost >nul

goto desktop

:update
cd UPDATE_
start UPDATE.bat

endlocal

pause

goto updatestarted

:updatestarted

echo Update Started. Please look at your CmdOS folder for the latest release for CmdOS.
echo If this did not download, please report this as a bug on the github page.
pause
goto desktop

:gamescmdos
cls
	
echo Pick game.	

echo 1) Character Generator   
                      
echo 2) Stopwatch      
                     
echo 3) Guess the Number  

echo 4) Rock Paper Sissors

set /p ERRORLEVEL= 


if %ERRORLEVEL% == 1 goto strt


if %ERRORLEVEL% == 2 goto counter


if %ERRORLEVEL% == 3 goto numberguesser


if %ERRORLEVEL% == 4 goto rps


:rps
title Rock, Paper, Scissors Game
color 0E
goto Start

:Start
cls
echo Welcome to Rock, Paper, Scissors!
echo.
echo Choose your weapon:
echo 1. Rock
echo 2. Paper
echo 3. Scissors
echo.

set /p userChoice=Enter your choice (1/2/3): 
set /a computerChoice=%random% %% 3 + 1

if %userChoice%==1 set userWeapon=Rock
if %userChoice%==2 set userWeapon=Paper
if %userChoice%==3 set userWeapon=Scissors

if %computerChoice%==1 set computerWeapon=Rock
if %computerChoice%==2 set computerWeapon=Paper
if %computerChoice%==3 set computerWeapon=Scissors

echo You chose %userWeapon%
echo Computer chose %computerWeapon%
echo.

call :CheckWin %userChoice% %computerChoice%
echo.
echo Play again? (y/n)
set /p playAgain=
if /i "%playAgain%"=="y" goto Start

echo Thanks for playing!
pause > nul
exit

:CheckWin
if %1==%2 (
    echo It's a tie!
    goto :eof
)

if %1==1 if %2==3 (
    echo Rock crushes Scissors! You win!
    goto :eof
)

if %1==2 if %2==1 (
    echo Paper covers Rock! You win!
    goto :eof
)

if %1==3 if %2==2 (
    echo Scissors cuts Paper! You win!
    goto :eof
)

echo You lose! Better luck next time!
goto :eof

:strt
title Character Generator
cls
echo How many characters (abc...) should this generate?
echo One character=one byte on your hard disk.
set /p num=^>
set /a cutof2f=num+1
goto generate
:generate
set /a cutoff=cutoff+1
if %cutoff% equ %cutoff2% goto display
echo Generating character %cutoff% out of %num%...
set /a pre=%random%*30/32768+1
if %pre% equ 1 set char=a
if %pre% equ 2 set char=b
if %pre% equ 3 set char=c
if %pre% equ 4 set char=d
if %pre% equ 5 set char=e
if %pre% equ 6 set char=f
if %pre% equ 7 set char=g
if %pre% equ 8 set char=h
if %pre% equ 9 set char=i
if %pre% equ 10 set char=j
if %pre% equ 11 set char=k
if %pre% equ 12 set char=l
if %pre% equ 13 set char=m
if %pre% equ 14 set char=n
if %pre% equ 15 set char=o
if %pre% equ 16 set char=p
if %pre% equ 17 set char=q
if %pre% equ 18 set char=r
if %pre% equ 19 set char=s
if %pre% equ 20 set char=t
if %pre% equ 21 set char=u
if %pre% equ 22 set char=v
if %pre% equ 23 set char=w
if %pre% equ 24 set char=x
if %pre% equ 25 set char=y
if %pre% equ 26 set char=z
if %pre% equ 27 set char=1
if %pre% equ 28 set char=2
if %pre% equ 29 set char=3
if %pre% equ 30 set char=4
set /p="%char%">tempchars.txt

:counter
title Time Counter
set second=0
set minute=0
set hour=0
goto count
:count
set /a second=second+1
if %second% equ 60 set /a minute=minute+1 && set second=0
if %minute% equ 60 set /a hour=hour+1 && set minute=0
echo Hour:%hour%
echo Minute:%minute%
echo Second:%second%
ping -n 2 127.0.0.1>nul
cls
goto count

:numberguesser
title Number Picker
set points=0
goto intro
:intro
echo Number Picker
echo The goal is the get the as many points as you can!
pause
:setup
cls
echo how many numbers to choose from?
echo 1-10, 1-100 or 1-1000.
set /p answer=10, 100, 1000 or quit^>
if %answer% equ 10 goto 10
if %answer% equ 100 goto 100
if %answer% equ 1000 goto 1000
if %answer% equ quit exit
if %answer% neq 10 goto setup
:10
cls
set /a number=%random%*10/32768+1
:10_2
cls
echo Current points: %points%
echo Guess the number (1-10)
echo To guess type in a number between 1 and 10.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :10_2
:100
set /a number=%random%*100/32768+1
:100_2
cls
echo Current points: %points%
echo Guess the number (1-100)
echo To guess type in a number between 1 and 100.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :100_2
:1000
set /a number=%random%*1000/32768+1
:1000_2
cls
echo Current points: %points%
echo Guess the number (1-1000)
echo To guess type in a number between 1 and 1000.
echo You can also quit.
set /p answer=^>
if %answer% equ %number% goto Win
if %answer% equ quit goto intro
if %answer% neq %number% goto :1000_2
:Win
cls
echo You guessed the number!
echo Good job!
echo You get 1 point!
set /a points=points+1
echo Total points: %points%
pause
goto setup

:display
cls
type tempchars.txt
start tempchars.txt
del tempchars.txt
pause
goto strt


:batchfile
start writable.bat
exit


:restartbios
cls
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=B
for %%d in ( A ) do echo.|set /p=a   
for %%d in ( A ) do echo.|set /p=c
for %%d in ( A ) do echo.|set /p=o
for %%d in ( A ) do echo.|set /p=n
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
pause
goto biosbootup

:biosbootup

echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
ping -n 2 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo R
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RE
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RES
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo REST
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTA
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTAR
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART I
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART IN
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INT
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO B
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BI
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BIO
ping -n 1 localhost >nul
cls
echo COMMAND PROMPT FOR CMDOS (BOOTUP EDITION) 
echo RESTART INTO BIOS
ping -n 4 localhost >nul
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
ping -n 2 localhost -2
cls
echo LOADING.
ping -n 2 localhost >nul
cls
echo LOADING..
ping -n 2 localhost >nul
cls
echo LOADING...
ping -n 2 localhost >nul
cls
echo LOADED. BOOTING...
ping -n 2 localhost >nul
goto biosmenupick


:biosmenupick

cls

echo * 1. System Configuration and Boot * 2. Reset Options

echo 1) Boot

echo 2) Boot Options

echo To go to a new section, type esc.


set /p ERRORLEVEL= 

if %ERRORLEVEL% == 1 goto bootsetup

if %ERRORLEVEL% == 2 goto bo

if %ERRORLEVEL% == esc goto pickoptions

:pickoptions
cls
CmdMenuSel 0FF0 "1. System Configuration          " "2. Reset Options             "
if %ERRORLEVEL% == 1 goto biosmenupick
if %ERRORLEVEL% == 2 goto biosmenupicktwo

:bo
cls
CmdMenuSel 0FF0 "1. Legacy Support                    "
echo Type esc to go to a new section.
set /p bopick=
if %bopick% == esc goto pickoptions
if %ERRORLEVEL% == 1 goto yesornols

:yesornols
cd Data
cls
echo Yes Or No?
CmdMenuSel "Yes           " "No            "
if %ERRORLEVEL% == 1 echo SUCCESS & goto biosmenupick
if %ERRORLEVEL% == 2 goto biosmenupick


:biosmenupicktwo
echo 1. System Configuration * 2. Reset Options
echo 1) Reset CmdOS
set /p el=
if %el% = 1 goto factorywarn

:bootsetup
cls
echo Choose.
echo 1) Mega Menu
set /p ERRORLEVEL=
if %ERRORLEVEL% == 1 goto bootmega

:bootmega

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
for %%d in ( A ) do echo.|set /p=M
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=G
for %%d in ( A ) do echo.|set /p=A
for %%d in ( A ) do echo.|set /p=*
for %%d in ( A ) do echo.|set /p=M
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=N
for %%d in ( A ) do echo.|set /p=U
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto startuptwo

:startuptwo 
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
echo.
echo                                                         *****
echo                                                         *****
cd BOOT_
start BOOT_MENU.bat
exit

:bootdebi
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
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
echo                                                     Starting up:
echo.
echo                                                         *****
echo                                                         *****
cd BOOT_
start BOOT_MENU.bat
exit



:factorywarn

cls

set /p reset= WARNING!! THIS CANNOT BE UNDONE. THIS WILL DELETE ALL USERS AND WILL RESET ALL THEIRS AND YOUR DATA. RESET? Y/N

if %reset% == Y goto factoryreset
if %reset% == N goto bootrestart

:factoryreset

cls

for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=B
for %%d in ( A ) do echo.|set /p=a
for %%d in ( A ) do echo.|set /p=c
for %%d in ( A ) do echo.|set /p=o
for %%d in ( A ) do echo.|set /p=n
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A ) do echo.|set /p=y
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto resettwo

:resettwo
cls
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=-
for %%d in ( A ) do echo.|set /p=R
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=S
for %%d in ( A ) do echo.|set /p=E
for %%d in ( A ) do echo.|set /p=T
for %%d in ( A ) do echo.|set /p=T
for %%d in ( A ) do echo.|set /p=I
for %%d in ( A ) do echo.|set /p=N
for %%d in ( A ) do echo.|set /p=G
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A a A) do echo|set /p=-
goto three

:three

cls

echo RESETTING. 1%
ping -n 2 localhost >nul
cls
echo RESETTING.. 1%
ping -n 2 localhost >nul
cls
echo RESETTING... 10%
ping -n 2 localhost >nul
cls
echo RESETTING.   20%
ping -n 2 localhost >nul
cls
echo RESETTING..   37%
ping -n 2 localhost >nul
cls
echo RESETTING...  45%
ping -n 2 localhost >nul
cls
echo RESETTING.     65%
ping -n 2 localhost >nul
cls
echo RESETTING..     75%
ping -n 2 localhost >nul
cls
echo RESETTING...    78%
ping -n 2 localhost >nul
cls
echo RESETTING.      89%
ping -n 2 localhost >nul
cls
echo RESETTING..     95%
ping -n 2 localhost >nul
cls
echo RESETTING...    98%
ping -n 2 localhost >nul
cls
echo RESETTING.      99%
ping -n 2 localhost >nul
cls
echo RESETTING..     100%
ping -n 2 localhost >nul
cls
echo RESETTING...    100%
ping -n 2 localhost >nul
goto setupdel

:setupdel
del Data
if exist other-users del other-users
goto checktwoo

:checktwoo
if exist other-users goto checkexistou
if not exist other-users goto setupstart


:checkexistou
del other-users
goto setupstart


:setupstart
echo    $$$     
echo   $           
echo   $           
echo     $$$  
ping -n 2 localhost >nul
cls              
echo    $$$  $$$      $     
echo   $     $   $   $  $        
echo   $     $     $     $     
echo     $$$ $  
ping -n 2 localhost >nul
cls                       
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $     
echo   $     $     $     $  $ $$       
echo     $$$ $                         
ping -n 2 localhost >nul
cls                                                                                
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   
echo   $     $     $     $  $ $$     $  $   
echo     $$$ $                       $$$$     
ping -n 2 localhost >nul
cls                                       
echo    $$$  $$$      $     $$$$
echo   $     $   $   $  $   $   $    $$$$   $$$$$
echo   $     $     $     $  $ $$     $  $   $
echo     $$$ $                       $$$$     $$$
echo                                            $
echo                                        $$$$ 
ping -n 2 localhost >nul
goto setupone

:setupone
cls
color 1f
title Setup
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 0 OF 3 
echo.
echo                                                               
echo.
echo -------------------------------------------------------------------------------------
echo You have tasks in order to install CmdOS.
echo 1: Install Files.
pause
goto filesinstall

:filesinstall
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing files...
echo [             0                ]
ping -n 2 localhost >nul
cls
echo Installing files...
echo [-------------50               ]
ping -n 2 localhost >nul
cls
echo Files installed.
ping -n 2 localhost >nul
goto setupagain

:setupagain
echo Good! Now lets install the drivers, ok?
pause
goto driversetup
:driversetup
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing drivers...
echo [              0               ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing drivers...
echo [---------     40              ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Drivers installed!
ping -n 2 localhost >nul
goto setupagaintwo

:setupagaintwo
echo Alright! Now 1 Last thing to do here: Install Additional Programs!
pause
goto additionalprogramssetup

:additionalprogramssetup
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing additional programs...
echo [               0              ]
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Installing additional programs...
echo [--------------70---------     ]  
ping -n 2 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 1 OF 3 
echo.
echo.                           Install Important Files
echo.
echo -------------------------------------------------------------------------------------
echo Additional programs installed. Continuing...
ping -n 2 localhost >nul
goto installcmdos

:installcmdos
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 2 OF 3 
echo.
echo                              Setup Requirements
echo.
echo -------------------------------------------------------------------------------------
echo.
set /p sr= What Should We Call You?
ping -n 2 localhost >nul
echo WRITING...
md Data
cd Data
ECHO %sr% > name.txt
ping -n 2 localhost >nul
echo Done.
pause
goto parttwo

:parttwo
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 2 OF 3 
echo.
echo                              Setup Requirements
echo.
echo -------------------------------------------------------------------------------------
echo.
echo What would you like your password to be?
set /p pass= 
ping -n 2 localhost >nul
echo WRITING...
ping -n 2 localhost >nul
cd Data
ECHO %pass% > password.txt
ping -n 2 localhost >nul
echo SUCCESS! 
ping -n 2 localhost >nul
pause
goto activate

:activate
cls
ECHO %random% > activatecode.txt
goto activatecode

:activatecode
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                Activate CmdOS
echo.
echo -------------------------------------------------------------------------------------
set /p activatecode=<activatecode.txt
echo CmdOS made an activate code to install CmdOS. Please look in your CmdOS folder and look
echo at a text document named activatecode.txt. 
echo Please enter that code into here.
set /p activate=
if %activate% == %activatecode% goto activatesuccess
if not %activate% == %activatecode% goto activatewrong

:activatewrong
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                Activate CmdOS
echo.
echo -------------------------------------------------------------------------------------
echo WRONG CODE!!!
pause
goto activatecode

:activatesuccess
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                     
echo.
echo -------------------------------------------------------------------------------------
echo Activating... (1%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           CmdOS just got even better!
echo.                          It can now write files!
echo -------------------------------------------------------------------------------------
echo Activating... (2%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           CmdOS just got even better!
echo.                          It can now write files!
echo -------------------------------------------------------------------------------------
echo Activating... (10%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           You can now play games!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (20%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                           You can now play games!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (30%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       CmdMenuSel makes choosing better!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (30%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       CmdMenuSel makes choosing better!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (50%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       Just like the olden day computers!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (60%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                       Just like the olden day computers!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (70%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                          Supported with any Windows OS!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (80%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                          Supported with any Windows OS!
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (90%)
ping -n 4 localhost >nul
cls
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                               Finishing...
echo.                         
echo -------------------------------------------------------------------------------------
echo Activating... (100%)
ping -n 4 localhost >nul
goto lastsetup



:lastsetup
echo ------------------------------------------------------------------------------------
echo.                                          
echo                                  CMDOS SETUP
echo.
echo                                 PART 3 OF 3 
echo.
echo                                 Finished.
echo.                         
echo -------------------------------------------------------------------------------------
echo Okay, now the setup is done. Now CmdOS will Restart.
pause

start bootscreen.bat

exit






















:write

cls

echo Welcome to Write, an application which let's you write text files...

echo What will be the name of your text?

set /p writeone= Name:

cls

echo Ok, your file has been created. Have fun!

pause

cls

set /p textone=

pause

echo You will be going back to the desktop

pause

goto desktop

:docs

cls

echo 1)%writeone%

echo 2)%writetwo%

echo 3)%writethree%

set /p browse= 

if %browse% == 1 goto textone

if %browse% == 2 goto texttwo

if %browse% == 3 goto textthree

:textone

cls

echo %writeone%

echo %textone%pause

goto desktop

:texttwo

cls

echo %writetwo%

echo %texttwo%

pause

goto desktop

:textthree

cls

echo %writethree%

echo %textthree%

pause

goto desktop

p:info

echo CmdOS

pause

goto desktop 

:calc

cls

set /p equ=

set /a equ=%equ%

cls

echo %equ%

pause

goto desktop

:notepad

START /MAX C:\Windows\NOTEPAD.EXE

:close

close

:google 

START CHROME www.google.com

:packageinfolder

START F:\

START E:\

:bootscreentwo

goto bootscreen

:random

echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%echo %random%

:randomtwo

echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% pause
pause
goto desktop

:openinfoinmsgbox

msg * CmdOS

:batch

cls

echo Welcome to Project Folder Creator.

echo Will create the following folder:

echo %foldername%

echo If this is okay,

pause

cls

set /p md= foldername?

set foldername=%md%

md %foldername%

cd %foldername%

md cache

cd cache

md proxies

cd md footage

cd footage

md img seq

cd..

md preview

md projectfiles

md references

md renders

cd renders

md passes

cd..

cls

cd..

start %foldername%

cd %foldername%

echo Batch Complete!

tree

pause

pause

goto desktop


:incorrect

cls

set /p incorrect= INCORRECT!!! Type back to go back

if %incorrect% == back goto bootscreen

if not %incorrect% == back goto crash

:incorrecttwo

cls

set /p incorrect= INCORRECT!!! Type back to go back

if %incorrect% == back goto pin

:crash 
start crash.vbs     

:commandprompt
cls

echo Hello! Welcome to Command Prompt! What are your commands?

set /p command= Command:

if %command% == color goto systemsetting

if %command% == run task calculator goto kalk

if %command% == filesdelete goto bsod

:bsod
cls
echo :
echo   (
echo.
echo.
echo.
echo CmdOS Has ran into a problem. Wait a minute while we fix it.
ping -n 10 localhost >nul 
echo Done. Restarting.....
ping -n 4 localhost >nul
goto bootnotfound

:bootnotfound
cls
echo BOOT NOT FOUND. GOING TO BIOS.....
ping -4 localhost >nul
echo BIOS NOT FOUND. ATTEMPTING TO DO AN EMERGENCY RESET......
ping -4 localhost >nul
goto three

:files

cls

echo Now on C:\CmdOS\CmdOS Files\.

set /p cmd= Command:

if %cmd% == start systemsetting.cmdos goto systemsetting

if %cmd% == calculator goto kalk

:systemsetting
cls

set /p ERRORLEVEL= What would you like the color to be? Type:1) Blue 2) Green 3) Aqua 4) Red 5) Purple 6) Yellow 7) Gray 8) Dark Gray 9) Light Blue 10) Light Green 11) Light Aqua 12) Light Red 13) Light Purple 14) Light Yellow 15) White


if %ERRORLEVEL% == 1 set barva=01
if %ERRORLEVEL% == 2 set barva=02
if %ERRORLEVEL% == 3 set barva=03
if %ERRORLEVEL% == 4 set barva=04
if %ERRORLEVEL% == 5 set barva=05
if %ERRORLEVEL% == 6 set barva=06
if %ERRORLEVEL% == 7 set barva=07
if %ERRORLEVEL% == 8 set barva=08
if %ERRORLEVEL% == 9 set barva=09
if %ERRORLEVEL% == 10 set barva=0A
if %ERRORLEVEL% == 11 set barva=0B
if %ERRORLEVEL% == 12 set barva=0C
if %ERRORLEVEL% == 13 set barva=0D
if %ERRORLEVEL% == 14 set barva=0E
if %ERRORLEVEL% == 15 set barva=0F
color %barva%
pause
goto desktop

:kalk
@echo off
::RESIZE
mode con: cols=120 lines=30
title Calculator
color 2E
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
if %second% equ 21 goto chyba
if %second% equ 41 goto chyba
if %second% equ 30 goto chyba
if %second% equ 05 goto chyba
goto kalk

:chyba
cd..
cd data
cd info
set /p verze=<ver.debidat
cd..
cd..
cd core
color 1F
echo CMDOS %verze% - ERROR
echo.
echo Collecting informations...
for %%d in ( A L Z ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A L Z A L Z A L Z A L ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A A A A A A A ) do echo.|set /p=.
ping -n 2 localhost >nul
echo.
echo App [ Calculator ] stopped working!
echo Click ENTER to return to the system...
echo.
echo Sorry for problems.
echo Error ID: Calculator_UNKNOWN_%random%
pause >nul

exit

:kalk
cls
echo Welcome to calculator!
echo.
echo If you want to exit calculator, type "exit"
:vypocitat
set /p kalk=Enter math expression: 

set vyrazyprikaz=vyrazy
set vyrazyprikaz2=+
set vyrazyprikaz3=-
set vyrazyprikaz4=*
set vyrazyprikaz5=/
set odejit=exit
set odejit2=odejit
set odejit3=zavrit
set odejit4=vypnout
set odejit5=stop

if "%kalk%" equ "%vyrazyprikaz%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz2%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz3%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz4%" goto vyrazy
if "%kalk%" equ "%vyrazyprikaz5%" goto vyrazy
if "%kalk%" equ "%odejit%" goto exitt
if "%kalk%" equ "%odejit2%" goto exitt
if "%kalk%" equ "%odejit3%" goto exitt
if "%kalk%" equ "%odejit4%" goto exitt
if "%kalk%" equ "%odejit5%" goto exitt

set /a vysledek=%kalk%
echo Result: %vysledek%
set /a vysledek=0
goto vypocitat

:exitt
goto desktop

:vyrazy
cls
echo List of available expressions:
echo.
echo + Add            - Substract
echo * Multiply       / Divide
echo.
echo Example: 5*3-6
echo Result: 9
echo.
echo Click ENTER to return to the calculator
pause >nul
goto kalk









