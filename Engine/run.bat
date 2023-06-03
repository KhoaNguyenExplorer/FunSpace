@ECHO OFF

ECHO Hello Khoa

if %0% EQU run.bat (
    GOTO ENGINE
)

:ENGINE
IF EXIST "E:\GIT\Khoa_demo\FunSpace\Gen\newfile.txt" (
    DEL "E:\GIT\Khoa_demo\FunSpace\Gen\newfile.txt"
    ECHO Deleted old file
) ELSE (
    ECHO hello Khoa >> "E:\GIT\Khoa_demo\FunSpace\Gen\newfile.txt"
    ECHO Created new file
)

@REM ECHO newfile created ...
@REM ECHO text >> Gen/newfile.txt

PAUSE