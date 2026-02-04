# Script pour créer les symlinks vers les repos du pipeline
# Exécuter en PowerShell (mode développeur requis)

$repos = @{
    "Workgroup_Blender" = "R:\Workgroup_Blender"
    "Workgroup_Maya" = "R:\Workgroup_Maya"
    "Workgroup_Unreal" = "R:\Workgroup_Unreal"
    "Workgroup_Nuke" = "R:\Workgroup_Nuke"
    "kit-app-template" = "D:\NVIDIA-Omniverse\kit-app-template"
    "Deploy" = "D:\_DEPLOY"
    "OpenRV" = "D:\OpenRV"
    "HandBrake" = "D:\HandBrake"
    "UnrealEngine" = "D:\EpicGames\UnrealEngine"
    "Blender" = "D:\Blender"
}

$reposDir = "D:\Pipeline\repos"

# Créer le dossier repos si nécessaire
if (-not (Test-Path $reposDir)) {
    New-Item -ItemType Directory -Path $reposDir | Out-Null
}

foreach ($name in $repos.Keys) {
    $linkPath = Join-Path $reposDir $name
    $targetPath = $repos[$name]
    
    # Supprimer si existe déjà
    if (Test-Path $linkPath) {
        Remove-Item $linkPath -Force -Recurse
    }
    
    # Créer le symlink
    try {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath -ErrorAction Stop | Out-Null
        Write-Host "OK: $name -> $targetPath" -ForegroundColor Green
    }
    catch {
        Write-Host "ERREUR: $name - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nTerminé. Vérifiez avec: ls D:\Pipeline\repos\" -ForegroundColor Cyan
