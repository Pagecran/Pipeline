# Pipeline - Repo Principal du Pipeline Studio 3D Pagecran

Repo central pour l'orchestration des agents IA sur tous les outils du pipeline.

## Architecture

Ce repo utilise un **Multi-Root Workspace** pour référencer tous les repos du pipeline sans duplication.

```
Pipeline/
├── Pipeline.code-workspace      # Workspace multi-root (ouvre tous les repos)
├── AGENTS.md                    # Configuration OpenCode pour le contexte 3D
├── README.md                    # Ce fichier
└── .gitignore
```

## Repos référencés

| Repo | Emplacement | Description |
|------|-------------|-------------|
| Workgroup_Blender | R:\Workgroup_Blender | Add-ons Blender studio |
| Workgroup_Maya | R:\Workgroup_Maya | Scripts Maya studio |
| Workgroup_Unreal | R:\Workgroup_Unreal | Plugins Unreal studio |
| Workgroup_Nuke | R:\Workgroup_Nuke | Scripts Nuke studio |
| kit-app-template | D:\NVIDIA-Omniverse\kit-app-template | Template Omniverse |
| Deploy | D:\_DEPLOY | Scripts de déploiement |
| OpenRV | D:\OpenRV | Player OpenRV customisé |
| HandBrake | D:\HandBrake | Encodeur vidéo |
| UnrealEngine | D:\EpicGames\UnrealEngine | Fork Unreal Engine |
| Blender | D:\Blender | Fork Blender |

## Utilisation

### Ouvrir le workspace

```bash
# Avec Zed
zed D:\Pipeline\Pipeline.code-workspace

# Avec VS Code
code D:\Pipeline\Pipeline.code-workspace

# Avec OpenCode
cd D:\Pipeline
opencode
```

### Workflow de commit

Chaque repo reste **indépendant** avec sa propre remote GitHub :

```bash
# Modifier un fichier dans Workgroup_Blender
# Le changement est visible dans Zed/OpenCode

# Commiter depuis le repo original
cd R:\Workgroup_Blender
git add .
git commit -m "fix: shader bug"
git push origin main  # Pousse vers github.com/Pagecran/Workgroup_Blender
```

## Conventions

### USD Naming
```
<asset_type>_<asset_name>_<variant>.usd
Exemple: prop_chair_wood_v001.usd
```

### Git Commits
Format: `<type>: <description>`
- `feat:` nouvelle fonctionnalité
- `fix:` correction de bug
- `docs:` documentation
- `refactor:` refactoring

## Technologies

- **Maya** - Scripts Python, USD
- **Blender** - Add-ons customisés
- **Unreal** - Plugins et outils
- **Nuke** - Scripts compositing
- **USD** - Universal Scene Description
- **Omniverse** - Déploiement prévu

## Licence

Propriétaire - Pagecran Studio
