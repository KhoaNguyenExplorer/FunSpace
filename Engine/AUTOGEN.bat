@ECHO OFF
SETLOCAL

:PROMPT

ECHO Hello Khoa

IF %0% EQU AUTOGEN.bat (   
    GOTO ENGINE
)

:USER_MANUAL
ECHO "                                                                    "
ECHO "   Please input your command following this order:                  "
ECHO "   ___________________________________________________________      "
ECHO "  |                                                           |     "
ECHO "  |1. Specify OEM name for generating reprogramming sequence  |     "
ECHO "  |   -o [OEM_name]                                           |     "
ECHO "  |2. Generate file                                           |     "
ECHO "  |   -g                                                      |     "
ECHO "  |3. Build source files based on selected target and compiler|     "
ECHO "  |   -b -t [target_name] -c [compiler_name]                  |     "
ECHO "  |___________________________________________________________|     "
ECHO "  EXAMPLE COMMAND: AUTOGEN.bat -o VF -g -b -t tc277 -c tasking      "    
PAUSE
EXIT

:AUTO-GENERATE 
ECHO Generating file ...
python Scripts/Dcm_Lcfg_DslDsd.py
python Scripts/Dcm_Lcfg_DspUds.py
python Scripts/Dcm_Cfg_DslDsd.py
python Scripts/Dcm_Cfg_DspUds.py
DEL Data_cfg\Data_cfg.txt
ECHO Done generating files
EXIT /B 0

:BUILDING
ECHO Building ...
CALL BUILD.bat
ECHO Done building files
EXIT /B 0

:ENGINE
IF [%1]==[-h] (
    GOTO USER_MANUAL
) ELSE IF [%1]==[-o] (
    ECHO OEM: %2%
    ECHO %2% >> Data_cfg/Data_cfg.txt
    IF [%3]==[-g] (
        CALL :AUTO-GENERATE 
        IF [%4]==[] ( 
            GOTO END
        ) ELSE IF [%4]==[-b] (
            ECHO Target: %6%
            ECHO Compiler: %8%
            CALL :BUILDING
        ) ELSE (
            GOTO USER_MANUAL
        )
    ) ELSE (
        GOTO USER_MANUAL
    )
) ELSE (
    GOTO USER_MANUAL
)

:END
ECHO Closing application
ENDLOCAL
