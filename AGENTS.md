# Pipeline Studio 3D - Configuration OpenCode

## Contexte du Projet

Repo principal du pipeline studio 3D Pagecran. Ce repo contient :
- La stratégie d'évolution du pipeline
- Les éléments de glue entre les outils DCC
- La documentation et roadmaps
- Les configs partagées

Les repos externes sont accessibles via `repos/` (junctions Windows, ignorés par Git).

## Structure du Projet

```
D:\Pipeline\
├── AGENTS.md          # Ce fichier - config OpenCode
├── README.md          # Documentation
├── opencode.json      # Config locale (OMOS activé)
├── .gitignore         # Ignore repos/
├── glue/              # Scripts d'orchestration inter-DCC (à créer)
├── docs/              # Documentation pipeline (à créer)
└── repos/             # Junctions vers les repos externes (gitignored)
    ├── Workgroup_Blender -> R:\Workgroup_Blender
    ├── Workgroup_Maya -> R:\Workgroup_Maya
    ├── Workgroup_Unreal -> R:\Workgroup_Unreal
    ├── Workgroup_Nuke -> R:\Workgroup_Nuke
    ├── kit-app-template -> D:\NVIDIA-Omniverse\kit-app-template
    ├── Deploy -> D:\_DEPLOY
    ├── OpenRV -> D:\OpenRV
    ├── HandBrake -> D:\HandBrake
    ├── UnrealEngine -> D:\EpicGames\UnrealEngine
    └── Blender -> D:\Blender
```

## Repos du Pipeline

| Repo | Chemin via repos/ | Chemin réel | GitHub |
|------|-------------------|-------------|--------|
| **Workgroup_Blender** | `repos/Workgroup_Blender` | `R:\Workgroup_Blender` | github.com/Pagecran/Workgroup_Blender |
| **Workgroup_Maya** | `repos/Workgroup_Maya` | `R:\Workgroup_Maya` | github.com/Pagecran/Workgroup_Maya |
| **Workgroup_Unreal** | `repos/Workgroup_Unreal` | `R:\Workgroup_Unreal` | github.com/Pagecran/Workgroup_Unreal |
| **Workgroup_Nuke** | `repos/Workgroup_Nuke` | `R:\Workgroup_Nuke` | github.com/Pagecran/Workgroup_Nuke |
| **kit-app-template** | `repos/kit-app-template` | `D:\NVIDIA-Omniverse\kit-app-template` | github.com/Pagecran/kit-app-template |
| **Deploy** | `repos/Deploy` | `D:\_DEPLOY` | github.com/Pagecran/Deploy |
| **OpenRV** | `repos/OpenRV` | `D:\OpenRV` | github.com/Pagecran/OpenRV |
| **HandBrake** | `repos/HandBrake` | `D:\HandBrake` | github.com/Pagecran/HandBrake |
| **UnrealEngine** | `repos/UnrealEngine` | `D:\EpicGames\UnrealEngine` | github.com/Pagecran/UnrealEngine |
| **Blender** | `repos/Blender` | `D:\Blender` | github.com/Pagecran/blender |

## Stack Technologique

- **DCC**: Maya 2024+, Blender 4.x, Unreal 5.x, Nuke
- **Python**: Scripts pipeline, USD API, PySide
- **USD**: Universal Scene Description, OpenPBR
- **Omniverse**: kit-app-template pour déploiement
- **Versioning**: Git, chaque repo a sa propre remote GitHub
- **Dev Environment**: Windows 11, Zed Editor, OpenCode

## Conventions de Code

### Python
- **Style**: PEP 8 avec Black
- **Type hints**: Obligatoires
- **Imports**: Triés avec isort
- **Documentation**: Docstrings Google style

### USD
- **Naming**: `<asset_type>_<asset_name>_<version>.usd`
- **Layers**: Reference > Sublayer > Payload
- **OpenPBR**: Shader standard pour tous les assets

### Git
- **Branches**: `feature/*`, `bugfix/*`, `hotfix/*`
- **Commits**: Conventional commits (`feat:`, `fix:`, `docs:`)

## Règles Spécifiques DCC

### Maya (Workgroup_Maya)
- **API**: `cmds` pour scripts simples, `OpenMaya` pour advanced
- **UI**: PySide2/PySide6 selon version Maya
- **USD Export**: `usdMaya` library native
- **Chemin**: `R:\Workgroup_Maya`

### Blender (Workgroup_Blender + Blender fork)
- **API**: `bpy` + `bmesh`
- **Add-ons**: Structure standard avec `__init__.py`, `operators/`, `panels/`
- **Preferences**: Stockage via `addon_prefs`
- **Workgroup**: `R:\Workgroup_Blender`
- **Fork**: `D:\Blender`

### Unreal (Workgroup_Unreal + UnrealEngine fork)
- **Python**: Via `unreal` module (Editor Python API)
- **Automation**: `unreal.automator`, `unreal.blueprintnode`
- **Tools**: Editor utility widgets
- **Workgroup**: `R:\Workgroup_Unreal`
- **Fork**: `D:\EpicGames\UnrealEngine`

### Nuke (Workgroup_Nuke)
- **Chemin**: `R:\Workgroup_Nuke`
- **Scripts Python** pour compositing

### Omniverse (kit-app-template)
- **Chemin**: `D:\NVIDIA-Omniverse\kit-app-template`
- **Déploiement** des tools studio

## Workflow Multi-Repo

Pour accéder aux fichiers d'un repo depuis OpenCode :
```
# Les chemins relatifs via repos/ fonctionnent
repos/Workgroup_Maya/scripts/mon_script.py

# Les chemins absolus fonctionnent aussi
R:\Workgroup_Maya\scripts\mon_script.py
```

Pour ouvrir le projet dans Zed :
```bash
zed D:\Pipeline
```

Pour les opérations Git sur un repo externe :
```bash
cd D:\Pipeline\repos\Workgroup_Maya
git add .
git commit -m "feat: nouveau script USD"
git push origin main
```

Note: Les commits dans `repos/*` vont dans leurs repos respectifs, pas dans Pipeline.

## Modèles IA Recommandés

- **Tâches complexes**: Claude Sonnet 4.5 / Opus 4.5
- **Recherche/Contexte**: Gemini 2.5 Pro
- **Tâches simples/Fast**: Gemini 3 Flash
- **Debugging**: Claude Sonnet 4.5 Thinking

## Notes Importantes

1. Chaque repo dans `repos/` est indépendant avec sa propre remote GitHub
2. `repos/` contient des junctions Windows (gitignored) - ne pas commiter
3. Vérifier la compatibilité USD entre DCC avant commit
4. Les Workgroups (R:\) sont en production - attention aux modifications
5. Pour recréer les junctions, voir le script dans ce repo (TODO)
