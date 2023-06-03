@ECHO OFF

ECHO Hello Khoa

if %0% EQU run.bat (
    GOTO ENGINE
)

:ENGINE
IF EXIST "E:\Demo_git\Gen\newfile.txt" (
    DEL "E:\Demo_git\Gen\newfile.txt"
) ELSE (
    ECHO hello 1234 >> "E:\Demo_git\Gen\newfile.txt"
)

@REM ECHO newfile created ...
@REM ECHO text >> Gen/newfile.txt

PAUSE