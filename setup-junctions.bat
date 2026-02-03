@echo off
REM Setup Windows Junctions pour Pagecran Pipeline
REM Crée des liens symboliques vers les repos de développement locaux

echo ============================================
echo Pagecran Pipeline - Setup Junctions
echo ============================================

REM Répertoire racine du script
set SCRIPT_DIR=%~dp0
cd %SCRIPT_DIR%

REM Configuration - MODIFIEZ CES CHEMINS SELON VOTRE ENVIRONNEMENT
setlocal enabledelayedexpansion

REM Chemins par défaut (à adapter)
set "DEV_PATH_D=D:\dev"
set "WORKGROUP_PATH=\\serveur\workgroup_maya"

echo.
echo Creation des junctions dans tools-local\
echo.

REM Blender Fork
if exist "%DEV_PATH_D%\blender-fork" (
    echo [OK] blender-fork trouve
    if not exist "tools-local\blender-fork" mklink /J "tools-local\blender-fork" "%DEV_PATH_D%\blender-fork"
) else (
    echo [ATTENTION] blender-fork non trouve dans %DEV_PATH_D%
)

REM Unreal Fork
if exist "%DEV_PATH_D%\unreal-fork" (
    echo [OK] unreal-fork trouve
    if not exist "tools-local\unreal-fork" mklink /J "tools-local\unreal-fork" "%DEV_PATH_D%\unreal-fork"
) else (
    echo [ATTENTION] unreal-fork non trouve dans %DEV_PATH_D%
)

REM Maya Scripts
if exist "%DEV_PATH_D%\maya-scripts" (
    echo [OK] maya-scripts trouve
    if not exist "tools-local\maya-scripts" mklink /J "tools-local\maya-scripts" "%DEV_PATH_D%\maya-scripts"
) else (
    echo [ATTENTION] maya-scripts non trouve dans %DEV_PATH_D%
)

REM Outils USD
if exist "%DEV_PATH_D%\usd-tools" (
    echo [OK] usd-tools trouve
    if not exist "tools-local\usd-tools" mklink /J "tools-local\usd-tools" "%DEV_PATH_D%\usd-tools"
) else (
    echo [ATTENTION] usd-tools non trouve dans %DEV_PATH_D%
)

REM Workgroup Network
if exist "%WORKGROUP_PATH%" (
    echo [OK] workgroup_maya reseau trouve
    if not exist "tools-local\workgroup_maya" mklink /J "tools-local\workgroup_maya" "%WORKGROUP_PATH%"
) else (
    echo [ATTENTION] workgroup_maya non trouve: %WORKGROUP_PATH%
)

REM Créer le repertoire tools-local si inexistant
if not exist "tools-local" mkdir tools-local

echo.
echo ============================================
echo Junction setup termine !
echo ============================================
echo.
echo Les liens sont maintenant disponibles dans tools-local\
echo Ils pointent vers vos repertoires de dev locaux.
echo.
pause
