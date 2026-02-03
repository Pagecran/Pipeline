# Pipeline Studio 3D - Configuration OpenCode

## Contexte du Projet

Repo principal du pipeline studio 3D Pagecran. Ce repo orchestre les sous-projets (Maya, Blender, Unreal, USD) via submodules.

## Stack Technologique

- **DCC**: Maya 2024+, Blender 4.x, Unreal 5.x
- **Python**: Scripts pipeline, USD API, PySide
- **USD**: Universal Scene Description, OpenPBR
- **Versioning**: Git avec submodules
- **Dev Environment**: Windows 11, VS Code, OpenCode

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
- **Submodules**: Mise à jour via `git submodule update --remote`

## Règles Spécifiques DCC

### Maya
- **API**: `cmds` pour scripts simples, `OpenMaya` pour advanced
- **UI**: PySide2/PySide6 selon version Maya
- **USD Export**: `usdMaya` library native

### Blender
- **API**: `bpy` + `bmesh`
- **Add-ons**: Structure standard avec `__init__.py`, `operators/`, `panels/`
- **Preferences**: Stockage via `addon_prefs`

### Unreal
- **Python**: Via `unreal` module (Editor Python API)
- **Automation**: `unreal.automator`, `unreal.blueprintnode`
- **Tools**: Editor utility widgets

## Outils et Scripts Disponibles

```bash
# Setup Windows junctions
setup-junctions.bat

# Mise à jour submodules
update-submodules.bat

# Déploiement tools
deploy-tools.ps1
```

## Modèles IA Recommandés

- **Tâches complexes**: Claude Sonnet 4.5 / Opus 4.5
- **Recherche/Contexte**: Gemini 2.5 Pro
- **Tâches simples/Fast**: Gemini 3 Flash
- **Debugging**: Claude Sonnet 4.5 Thinking

## Notes Importantes

1. Ne jamais modifier directement les submodules depuis Pipeline
2. Les modifications locales (tools-local) sont prioritaires
3. Vérifier la compatibilité USD entre DCC avant commit
4. Documenter les breaking changes dans `docs/CHANGELOG.md`
