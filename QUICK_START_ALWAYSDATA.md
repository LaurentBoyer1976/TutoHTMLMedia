# 🚀 DÉPLOIEMENT ALWAYS DATA - QUICK START

## En 5 Minutes Chrono ⏱️

### 1️⃣ Créer son Site Always Data (2 min)

1. Aller sur https://www.alwaysdata.com/
2. S'inscrire (gratuit)
3. Créer une application web
4. Noter votre domaine : `votre-username.alwaysdata.net`

### 2️⃣ Préparer les Fichiers (2 min)

**Windows PowerShell :**
```powershell
cd "C:\Users\Laurent\Formation_dev\LPDWCA\MiniProjetHTML\TutoHTMLMedia"
.\deploy-alwaysdata-prepare.ps1
```

**Mac/Linux :**
```bash
cd TutoHTMLMedia
npm install && npm run build
```

✅ Les fichiers sont prêts dans `./dist/`

### 3️⃣ Téléverser (1 min avec FileZilla)

**Télécharger FileZilla** : https://filezilla-project.org/

**Configuration :**
```
Protocol : SFTP
Host     : sftp.alwaysdata.net
Port     : 22
Username : votre-username
Password : votre-password
```

**Upload :**
- Gauche : Ouvrir `./dist/`
- Droite : Connecter au serveur
- Drag & drop tous les fichiers

✅ C'est fait !

### 4️⃣ Tester (Immédiat)

```
https://votre-username.alwaysdata.net
```

Tous les liens fonctionnent ! ✅

---

## Structure Astro/Always Data 📁

```
Votre Projet          Serveur Always Data
─────────────         ───────────────────
src/
├── pages/
│  ├── index.astro   →  /
│  ├── documentation →  /documentation
│  ├── elements/[x]  →  /elements/img
│  └── api/          →  /api/getUserMedia
├── assets/          →  /assets/
└── ...

Après npm run build :
dist/
├── index.html       →  Racine (/)
├── documentation/
│  └── index.html    →  /documentation
├── elements/
│  └── img/
│     └── index.html →  /elements/img
└── ...
```

Always Data gère automatiquement le routing avec `index.html` ! 🎉

---

## Fichiers de Déploiement Fournis 📦

| Fichier | Usage |
|---------|-------|
| `ALWAYSDATA_SUMMARY.md` | Comparaison GitHub Pages vs Always Data |
| `ALWAYSDATA_UPLOAD_GUIDE.md` | Guide détaillé avec dépannage |
| `deploy-alwaysdata-prepare.ps1` | Script Windows automatisé |
| `deploy-alwaysdata.bat` | Script Windows alternatif |
| `deploy-alwaysdata.sh` | Script Linux/Mac |

---

## Points Clés Always Data 🔑

✅ **Routing Automatique** - Basé sur les fichiers `index.html`
✅ **À la Racine** - Pas de base path, juste `/`
✅ **Simple** - Upload et c'est prêt
✅ **Gratuit** - Plan free excellent
✅ **Flexible** - FTP, SFTP, Git, Panel web

---

## Commandes Rapides 🚀

```bash
# 1. Build local
npm run build

# 2. Voir les fichiers
ls -la dist/

# 3. Vérifier la taille
du -sh dist/

# 4. Développer localement
npm run dev
```

---

## Après Déploiement 📝

Pour **modifier** le site :

```bash
# 1. Développer localement
npm run dev

# 2. Quand OK, builder
npm run build

# 3. Re-uploader les fichiers de ./dist/
#    → Via FileZilla ou Panel Always Data
```

---

## URLs de Test ✅

Remplacez `votre-username.alwaysdata.net` par votre domaine réel :

```
🏠  https://votre-username.alwaysdata.net
📚 https://votre-username.alwaysdata.net/documentation
🏷️  https://votre-username.alwaysdata.net/elements/img
⚡ https://votre-username.alwaysdata.net/api/getUserMedia
🎬 https://votre-username.alwaysdata.net/api/webcam-demo
📄 https://votre-username.alwaysdata.net/assets/html5-et-multimedia.pdf
```

---

## En Cas de Problème 🆘

| Problème | Solution |
|----------|----------|
| Page blanche | Vérifier que `index.html` est à la racine du serveur |
| 404 sur /documentation | Doit être `/documentation/index.html` (pas .html seul) |
| CSS/Images manquantes | Vérifier `/assets/` est uploadé |
| Favicon ne s'affiche pas | Vérifier `/favicon.svg` existe |

**Support Always Data :** support@alwaysdata.com

---

## Questions Fréquentes ❓

**Q: Combien ça coûte ?**
R: Plan gratuit parfait pour démarrer

**Q: C'est sûr ?**
R: Oui, SSL/HTTPS inclus, sauvegardes régulières

**Q: Je peux uploader avec mon téléphone ?**
R: Oui, panel web fonctionne partout

**Q: Comment faire des mises à jour ?**
R: Même processus - `npm run build` puis uploader les nouveaux fichiers

**Q: Est-ce que ça va rester en ligne ?**
R: Tant que le compte est actif, oui

---

## Résumé en 1 Ligne 📌

```
npm run build → FileZilla → Upload ./dist/ → C'est prêt ! 🎉
```

---

**Vous êtes prêt ! Bon déploiement ! 🚀**
