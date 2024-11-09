@echo off
color 2
chcp 65001 >nul
title therizzra's hacking tool

set /p pass="Enter password: "
if "%pass%" NEQ "6869" exit

:menu
echo.
echo   *****************
echo         Menu
echo   *****************
echo.
echo 1) List Users on Computer
echo 2) Create a New User
echo 3) Change a User's Password
echo 4) Delete a User Account
echo 5) Exit
echo.
set /p input="© "

if "%input%" EQU "1" (
    title List Users
    cls
    net user
    pause
    cls
    goto menu
)

if "%input%" EQU "2" (
    call :checkadmin
    title Create a User
    cls
    set /p user="USERNAME: "
    set /p password="PASSWORD: "
    net user %user% %password% /add
    echo New user created with credentials
    echo %user% : %password%
    pause
    cls
    goto menu
)

if "%input%" EQU "3" (
    call :checkadmin
    title Change a User's Password
    cls
    set /p user="TARGET USER: "
    set /p password="NEW PASSWORD: "
    net user %user% %password%
    pause
    cls
    goto menu
)

if "%input%" EQU "4" (
    color 4
    title Your Messed Up
    echo you have no morals and are messed up for trying to do this :(
    pause
    cls
    goto menu
)

if "%input%" EQU "5" exit

:checkadmin
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    cls
    echo.
    echo Restart the script and run it as admin.
    pause
    cls
    goto menu
)
exit /b

