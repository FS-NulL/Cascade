@echo off


set temp_drive=t



subst %temp_drive%: /D >> nul
subst %temp_drive%: .

set map1=ut4_cascade
set map2=casc_region

ECHO.
ECHO Should Compile Correct in XP
ECHO WIN7 Needs Fixing. (Different handling of DOS style paths)
ECHO.
ECHO 1. FULL Compile
ECHO 2. REGION Compile
ECHO 3. EDIT Batch Script
ECHO.
set choice=
set /p choice=Choose a number: 
if '%choice%'=='3' goto EDIT
if '%choice%'=='2' goto REGION
set map=%map1%
goto START
:REGION
set map=%map2%
goto START
:EDIT
start notepad "null_crate RADBUMP.bat"
goto ENDSCRIPT
:START
echo.
echo Compiling: %map%
echo.
pause


time /T
echo STARTING BSP:
start "BSP: %map%" /low /B /wait "T:\q3map2\q3map2_fs_20g\q3map2_fs_20g.exe" -meta -fs_basepath "T:" -fs_game q3ut4  "T:\q3ut4\maps\%map%.map" >> %map%_BSP.txt

time /T
echo STARTING VIS:
start "VIS: %map%" /low /B /wait "T:\q3map2\q3map2_fs_20g\q3map2_fs_20g.exe" -vis -saveprt -fs_basepath "T:" -fs_game q3ut4  "T:\q3ut4\maps\%map%.bsp" >> %map%_VIS.txt

time /T
echo STARTING RAD:
start "RAD: %map%" /low /B /wait "T:\q3map2\q3map2_fs_20g\FS_q3map_Radbump_2a.exe" -light -bounce 9 -fast -patchshadows -samples 2 -radbump -shade -fs_basepath "T:" -fs_game q3ut4 "T:\q3ut4\maps\%map%.bsp" >> %map%_RAD.txt

t:

cd t:\q3ut4\maps

time /T
echo STARTING SURFACE IMPORT:
bsp -si %map%.bsp null_c22.surface

echo start "BSPC: Compiling %map%.aas" /low /wait "bspc.exe" -forcesidesvisible -optimize -bsp2aas "T:\q3ut4\maps\%map%.bsp"


:ENDSCRIPT

subst %temp_drive%: /D
