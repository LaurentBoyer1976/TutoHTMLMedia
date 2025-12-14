# 🚀 Guide de Déploiement sur Always Data

## Avantages d'Always Data vs GitHub Pages

| Fonctionnalité | Always Data | GitHub Pages |
|---|---|---|
| **Routing dynamique** | ✅ Oui (serveur réel) | ❌ Non (site statique) |
| **Base path** | ✅ À la racine (`/`) | ❌ Sous-dossier requis |
| **Performance** | ✅ Excellente | ✅ Bonne |
| **SSL/HTTPS** | ✅ Inclus | ✅ Inclus |
| **Support** | ✅ Équipe support | ✅ Communauté GitHub |

## Étapes de Déploiement

### 1. Créer un compte Always Data

1. Aller sur [always-data.com](https://www.alwaysdata.com/)
2. S'inscrire (gratuit ou abonnement)
3. Créer une application web

### 2. Configurer le domaine

- Option A : Utiliser le domaine Always Data (`your-username.alwaysdata.net`)
- Option B : Utiliser un domaine personnalisé

### 3. Mettre à jour la configuration

Éditez `astro.config.mjs` :

```javascript
export default defineConfig({
  site: 'https://votre-domaine.alwaysdata.net',
  // ou pour domaine personnalisé :
  // site: 'https://www.votredomaine.com',
  // base: '/', // Pas besoin avec Always Data
  srcDir: './src',
  publicDir: './public',
  outDir: './dist',
  // ...
});
```

### 4. Préparer le build

```bash
# Installer les dépendances
npm install

# Construire le site
npm run build

# Les fichiers prêts sont dans ./dist/
```

### 5. Déployer via Always Data

**Option A : Git (recommandé)**

```bash
# Initialize git repository
git init
git add .
git commit -m "Initial commit"

# Ajouter remote Always Data
git remote add alwaysdata <your-repo-url>

# Pousser
git push alwaysdata main
```

**Option B : FTP/SFTP**

1. Connectez-vous à Always Data via FTP/SFTP
2. Uploadez le contenu de `./dist/` à la racine du serveur web
3. Vérifiez que `index.html` est accessible via `/`

**Option C : Panel Always Data**

1. Allez dans le panel Always Data
2. Créez une application web Node.js
3. Connectez votre repo Git
4. Configurez le build :
   ```
   Build command: npm run build
   Output directory: dist
   ```

### 6. Vérifier le déploiement

```bash
# Votre site devrait être accessible à :
https://votre-domaine.alwaysdata.net

# Ou avec domaine personnalisé :
https://www.votredomaine.com
```

## Tests après déploiement

✅ Vérifier que tous les liens fonctionnent :
- [ ] Page d'accueil : `/`
- [ ] Documentation : `/documentation`
- [ ] Éléments : `/elements/img`
- [ ] API : `/api/getUserMedia`
- [ ] Démo : `/api/webcam-demo`
- [ ] PDF : `/assets/html5-et-multimedia.pdf`

## Avantages locaux

Pendant le développement, tous les chemins fonctionnent aussi :

```bash
npm run dev
# → http://localhost:5173 (tous les liens OK)
```

## Variables d'environnement (optionnel)

Si vous avez besoin de variables d'environnement avec Always Data :

1. Créez un fichier `.env` :
```
SITE_URL=https://votre-domaine.alwaysdata.net
API_KEY=votre_clé
```

2. Dans Astro (utilisez `import.meta.env`) :
```javascript
const siteUrl = import.meta.env.SITE_URL;
```

## Support Always Data

- Documentation : https://www.alwaysdata.com/documentation/
- Support : support@alwaysdata.com
- Chat : Disponible dans le panel

## Migration depuis GitHub Pages

Si vous aviez GitHub Pages avant :

1. ✅ Le code est prêt (pas besoin de `base: '/TutoHTMLMedia'`)
2. ✅ Tous les liens fonctionnent sans `baseUrl`
3. ✅ Le routing est maintenant complet

**C'est tout ! 🎉 Votre site fonctionne sur Always Data !**
