:: Code snippet taken entirely from https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights/21295806
:: {
@echo off
REM Quick test for Windows generation: UAC aware or not ; all OS before NT4 ignored for simplicity
SET NewOSWith_UAC=YES
VER | FINDSTR /IL "5." > NUL
IF %ERRORLEVEL% == 0 SET NewOSWith_UAC=NO
VER | FINDSTR /IL "4." > NUL
IF %ERRORLEVEL% == 0 SET NewOSWith_UAC=NO


REM Test if Admin
CALL NET SESSION >nul 2>&1
IF NOT %ERRORLEVEL% == 0 (

    if /i "%NewOSWith_UAC%"=="YES" (
        rem Start batch again with UAC
        echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
        echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        del "%temp%\getadmin.vbs"
        exit /B
    )

    rem Program will now start again automatically with admin rights!
    rem pause
    goto :eof
)
:: }

IF EXIST %USERPROFILE%\.vimrc del /F %USERPROFILE%\.vimrc
call mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\.vim\.vimrc"

ECHO.
IF EXIST %USERPROFILE%\.vim\.git\hooks\post-checkout del /F %USERPROFILE%\.vim\.git\hooks\post-checkout
call mklink "%USERPROFILE%\.vim\.git\hooks\post-checkout" "%USERPROFILE%\.vim\git_hooks\post-checkout"

ECHO.
IF EXIST %USERPROFILE%\.vim\.git\hooks\post-merge del /F %USERPROFILE%\.vim\.git\hooks\post-merge
call mklink "%USERPROFILE%\.vim\.git\hooks\post-merge" "%USERPROFILE%\.vim\git_hooks\post-merge"

ECHO.
IF NOT EXIST %USERPROFILE%\.vim\colors MKDIR %USERPROFILE%\.vim\colors
IF EXIST %USERPROFILE%\.vim\colors\solarized.vim del /F %USERPROFILE%\.vim\colors\solarized.vim
call mklink "%USERPROFILE%\.vim\colors\solarized.vim" "%USERPROFILE%\.vim\plugins\vim-colors-solarized\colors\solarized.vim"

ECHO.
ECHO All operations complete. Program will close in 10 seconds.
TIMEOUT /T 10
