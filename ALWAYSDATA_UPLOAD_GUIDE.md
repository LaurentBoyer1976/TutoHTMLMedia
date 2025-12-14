# 🚀 Téléversement du Projet sur Always Data - Guide Complet

## Prérequis

✅ Compte Always Data créé (https://www.alwaysdata.com/)
✅ Projet TutoHTMLMedia préparé localement
✅ Fichiers buildés dans `./dist/`

## Étape 1 : Préparer le Build Local

### Windows PowerShell
```powershell
# Aller dans le dossier du projet
cd "C:\Users\Laurent\Formation_dev\LPDWCA\MiniProjetHTML\TutoHTMLMedia"

# Installer les dépendances
npm install

# Builder le projet
npm run build

# Vérifier que ./dist existe avec index.html
ls .\dist\index.html
```

### macOS / Linux
```bash
cd TutoHTMLMedia
npm install
npm run build
ls dist/index.html
```

### Structure des fichiers buildés
```
dist/
├── index.html              ← Page d'accueil (IMPORTANT!)
├── documentation/
│   └── index.html
├── elements/
│   ├── img/
│   │   └── index.html
│   ├── video/
│   │   └── index.html
│   └── ...
├── api/
│   ├── getUserMedia/
│   │   └── index.html
│   └── webcam-demo/
│       └── index.html
├── assets/
│   ├── html5-et-multimedia.pdf
│   └── ...
└── favicon.svg
```

## Étape 2 : Accéder à Always Data

### Via le Panel Always Data

1. **Connectez-vous** à https://admin.alwaysdata.com/
2. **Sélectionnez votre site** dans le menu de gauche
3. **Allez à "Fichiers"** (Files)

### Structure du serveur Always Data
```
/
├── index.html           ← Racine (votre site)
├── documentation/
│   └── index.html       ← /documentation
├── elements/
│   └── index.html       ← /elements
└── assets/
    ├── html5-et-multimedia.pdf
    └── favicon.svg
```

## Étape 3 : Téléverser les Fichiers

### Option A : FTP/SFTP (Recommandé pour Always Data)

#### Windows - Via FileZilla

1. **Télécharger FileZilla** : https://filezilla-project.org/
2. **Ouvrir FileZilla**
3. **File → Site Manager**
4. **New Site**
   - Protocol: `SFTP`
   - Host: `sftp.alwaysdata.net` (ou votre domaine)
   - Port: `22` (ou `990` pour FTP)
   - Username: Votre username Always Data
   - Password: Votre password Always Data
5. **Connect**

#### Naviguer et Uploader

```
Local files (gauche)          |  Remote files (droite)
C:\...TutoHTMLMedia\dist     |  /
  ├── index.html      →       |
  ├── documentation   →       |
  ├── elements        →       |
  ├── api             →       |
  ├── assets          →       |
  └── favicon.svg     →       |
```

**Actions :**
1. À gauche : Ouvrez `C:\...\TutoHTMLMedia\dist\`
2. À droite : Connectez-vous au serveur
3. **Sélectionnez tout** (`Ctrl+A`)
4. **Drag & drop** vers la droite OU **Upload**

### Option B : Panel Always Data (Upload direct)

1. **Panel → Fichiers**
2. **Bouton "Upload"**
3. **Sélectionnez le dossier `dist/`** complet
4. Attendez la fin (ça peut prendre quelques minutes)

### Option C : Git (Si configuré sur Always Data)

```bash
# Ajouter remote Always Data
git remote add alwaysdata <votre-repo-git>

# Builder
npm run build

# Commit
git add dist/
git commit -m "Build production"

# Push
git push alwaysdata main
```

## Étape 4 : Vérifier la Structure Après Upload

### Via Panel Always Data → Fichiers

```
/ (racine du serveur web)
├── index.html                    ✅
├── documentation/
│   └── index.html                ✅
├── elements/
│   └── img/
│       └── index.html            ✅
├── api/
│   ├── getUserMedia/
│   │   └── index.html            ✅
│   └── webcam-demo/
│       └── index.html            ✅
├── assets/
│   ├── html5-et-multimedia.pdf   ✅
│   └── ...                       ✅
└── favicon.svg                   ✅
```

### Comment Always Data traite les fichiers

Always Data utilise un **routing intelligent** :

```
URL accédée              Fichier servi
─────────────────────────────────────────
/                     → ./index.html
/documentation        → ./documentation/index.html
/elements/img         → ./elements/img/index.html
/api/getUserMedia     → ./api/getUserMedia/index.html
/assets/style.css     → ./assets/style.css
```

**C'est automatique !** Pas besoin de configuration.

## Étape 5 : Tester le Déploiement

### Depuis votre domaine Always Data

```
https://votre-username.alwaysdata.net
```

Ou si vous avez un domaine personnalisé :
```
https://www.votredomaine.com
```

### Vérifications à faire ✅

Ouvrez votre navigateur et testez :

1. **Page d'accueil**
   ```
   https://votre-domaine.alwaysdata.net
   → Doit afficher le hero "Tutoriel Éléments HTML Media"
   ```

2. **Documentation**
   ```
   https://votre-domaine.alwaysdata.net/documentation
   → Doit afficher la liste des éléments HTML
   ```

3. **Élément (exemple img)**
   ```
   https://votre-domaine.alwaysdata.net/elements/img
   → Doit afficher la documentation de <img>
   ```

4. **API JavaScript**
   ```
   https://votre-domaine.alwaysdata.net/api/getUserMedia
   → Doit afficher la doc API
   ```

5. **Démo Interactive**
   ```
   https://votre-domaine.alwaysdata.net/api/webcam-demo
   → Doit afficher la démo webcam
   ```

6. **Téléchargement PDF**
   ```
   https://votre-domaine.alwaysdata.net/assets/html5-et-multimedia.pdf
   → Doit télécharger le PDF
   ```

7. **Favicon**
   ```
   Vérifier dans l'onglet du navigateur
   → Doit afficher l'emoji 🎬
   ```

## Étape 6 : Dépannage

### ❌ Page blanche au chargement ?

```bash
# Vérifier que les fichiers sont uplodés
# Via Panel → Fichiers
# Doit voir :
# - index.html à la racine
# - Dossiers : documentation/, elements/, api/, assets/
```

### ❌ Erreur 404 sur /documentation ?

```
Vérifier qu'il existe :
/documentation/index.html (pas /documentation.html)
```

### ❌ CSS/Images ne se chargent pas ?

```
Vérifier :
1. Assets uploadés dans /assets/
2. Chemins corrects dans le HTML
3. Permissions des fichiers (644 pour HTML, 755 pour dossiers)
```

### ❌ Favicon ne s'affiche pas ?

```
Vérifier :
1. /favicon.svg existe à la racine
2. Type MIME correct (image/svg+xml)
```

### 💾 Uploader à nouveau les fichiers

```bash
# Pour mettre à jour après modification :
npm run build
# Re-uploader les fichiers de ./dist/
```

## Étape 7 : Utilisation Quotidienne

### Modifier le site localement

```bash
# Développer localement
npm run dev
# → http://localhost:5173

# Quand prêt à mettre en ligne :
npm run build
# → Fichiers dans ./dist/
```

### Mettre à jour Always Data

**Via FTP :**
1. Ouvrir FileZilla
2. Uploader les fichiers de `./dist/`
3. Rafraîchir le navigateur

**Via Panel :**
1. Panel → Fichiers
2. Supprimer les fichiers actuels
3. Uploader la nouvelle version

**Via Git :**
```bash
git push alwaysdata main
```

## Commandes Rapides Windows PowerShell

```powershell
# Build et préparer pour upload
npm run build

# Voir les fichiers à uploader
ls -Recurse .\dist\ | Select-Object FullName

# Vérifier la taille totale
(Get-ChildItem -Recurse .\dist\ | Measure-Object -Property Length -Sum).Sum / 1MB
```

## Checklist Final

- [ ] Compte Always Data créé et accessible
- [ ] `npm run build` exécuté sans erreurs
- [ ] Dossier `./dist/` contient tous les fichiers
- [ ] Fichiers uplodés à la racine du serveur web
- [ ] Structure de dossiers correcte (documentation/, elements/, api/, assets/)
- [ ] `index.html` à la racine
- [ ] URL d'accès notée
- [ ] Tous les tests de navigation ✅
- [ ] Performance acceptable
- [ ] Backups configurées (optionnel)

## Support

- **Documentation Always Data** : https://www.alwaysdata.com/documentation/
- **Support Always Data** : support@alwaysdata.com
- **Chat Always Data** : Disponible dans le panel
- **Problèmes Astro** : https://astro.build/

---

**🎉 Votre site est maintenant en ligne sur Always Data !**

### URLs à tester :
```
🏠 Accueil         : https://votre-domaine.alwaysdata.net
📚 Documentation   : https://votre-domaine.alwaysdata.net/documentation
🏷️ Éléments        : https://votre-domaine.alwaysdata.net/elements/img
⚡ API JS          : https://votre-domaine.alwaysdata.net/api/getUserMedia
🎬 Démo Webcam     : https://votre-domaine.alwaysdata.net/api/webcam-demo
📄 PDF             : https://votre-domaine.alwaysdata.net/assets/html5-et-multimedia.pdf
```
