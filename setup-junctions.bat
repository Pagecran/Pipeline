@echo off
REM Setup Windows Junctions pour Pagecran Pipeline
REM Crée des liens symboliques vers les repos de développement locaux

echo ============================================
echo Pagecran Pipeline - Setup Junctions
echo ============================================

REM Répertoire racine du script
set SCRIPT_DIR=%~dp0
cd %SCRIPT_DIR%

setlocal enabledelayedexpansion

echo.
echo Creation des junctions dans tools-local\
echo.

REM Créer le repertoire tools-local si inexistant
if not exist "tools-local" mkdir tools-local

REM Deploy
if exist "D:\_DEPLOY" (
    echo [OK] Deploy trouve
    if not exist "tools-local\Deploy" mklink /J "tools-local\Deploy" "D:\_DEPLOY"
) else (
    echo [ATTENTION] Deploy non trouve: D:\_DEPLOY
)

REM Blender
if exist "D:\Blender" (
    echo [OK] Blender trouve
    if not exist "tools-local\Blender" mklink /J "tools-local\Blender" "D:\Blender"
) else (
    echo [ATTENTION] Blender non trouve: D:\Blender
)

REM UnrealEngine
if exist "D:\EpicGames\UnrealEngine" (
    echo [OK] UnrealEngine trouve
    if not exist "tools-local\UnrealEngine" mklink /J "tools-local\UnrealEngine" "D:\EpicGames\UnrealEngine"
) else (
    echo [ATTENTION] UnrealEngine non trouve: D:\EpicGames\UnrealEngine
)

REM OpenRV
if exist "D:\OpenRV" (
    echo [OK] OpenRV trouve
    if not exist "tools-local\OpenRV" mklink /J "tools-local\OpenRV" "D:\OpenRV"
) else (
    echo [ATTENTION] OpenRV non trouve: D:\OpenRV
)

REM HandBrake
if exist "D:\HandBrake" (
    echo [OK] HandBrake trouve
    if not exist "tools-local\HandBrake" mklink /J "tools-local\HandBrake" "D:\HandBrake"
) else (
    echo [ATTENTION] HandBrake non trouve: D:\HandBrake
)

echo.
echo ============================================
echo Junction setup termine !
echo ============================================
echo.
echo Les liens sont maintenant disponibles dans tools-local\
echo.
echo Liste des junctions creees:
echo   Deploy        -> D:\_DEPLOY
echo   Blender       -> D:\Blender
echo   UnrealEngine  -> D:\EpicGames\UnrealEngine
echo   OpenRV        -> D:\OpenRV
echo   HandBrake     -> D:\HandBrake
echo.
echo Les Workgroups sont geres par les submodules (R:\)
echo.
pause
