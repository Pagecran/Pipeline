# Pipeline - Repo Principal du Pipeline Studio 3D

Repo central qui orchestre les différents outils et sous-projets du pipeline via submodules.

## Structure

```
Pipeline/
├── AGENTS.md                    # Configuration des agents IA pour ce repo
├── README.md                    # Ce fichier
├── .gitmodules                  # Configuration des submodules
├── submodules/                  # Répertoire des submodules
│   ├── maya-tools/             # Scripts Maya USD
│   ├── blender-fork/           # Blender customisé
│   ├── unreal-fork/            # Unreal customisé
│   ├── usd-core/               # Librairies USD partagées
│   ├── workgroup_maya/         # Templates Maya
│   └── ...
├── tools-local/                 # Liens locaux vers dev (Windows junctions)
├── docs/                       # Documentation du pipeline
└── scripts/                    # Scripts utilitaires (setup, deployment)
```

## Conventions de Nommage USD

```
<asset_type>_<asset_name>_<variant>.usd
Exemple: prop_chair_wood_v001.usd
```

## Workflow de Développement

1. **Cloner le repo Pipeline**
2. **Initialiser les submodules**: `git submodule update --init --recursive`
3. **Configurer les junctions locales** (Windows): `setup-junctions.bat`
4. **Développer** dans les submodules ou tools-local
5. **Pusher** les modifications dans les submodules d'abord
6. **Mettre à jour** les références dans Pipeline

## Commandes Utiles

```bash
# Mettre à jour tous les submodules
git submodule update --remote --recursive

# Voir l'état des submodules
git submodule status

# Ajouter un nouveau submodule
git submodule add <url> submodules/<nom>
```

## Technologies

- **Maya** - Scripts Python, USD
- **Blender** - Add-ons customisés
- **Unreal** - Plugins et outils
- **USD** - Universal Scene Description
- **Omniverse** - Déploiement prévu

## Licence

Propriétaire - Pagecran Studio
