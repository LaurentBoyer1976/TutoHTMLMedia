# 📁 Structure Astro → Always Data (Visuelle)

## Avant Build : Structure Source

```
TutoHTMLMedia/
│
├── 📄 README.md
├── 📄 package.json                 ← Scripts npm
├── 📄 astro.config.mjs             ← Config Astro
│
├── src/
│   ├── pages/                      ← Routes (génèrent les URLs)
│   │   ├── index.astro             → / (accueil)
│   │   ├── documentation.astro     → /documentation
│   │   │
│   │   ├── elements/
│   │   │   ├── [balise].astro      → /elements/[balise]
│   │   │   │   ├── img    /elements/img      ✅
│   │   │   │   ├── video  /elements/video    ✅
│   │   │   │   └── ...    /elements/...      ✅
│   │   │
│   │   └── api/
│   │       ├── getUserMedia.astro  → /api/getUserMedia
│   │       └── webcam-demo.astro   → /api/webcam-demo
│   │
│   ├── components/                 ← Composants réutilisables
│   │   ├── ArticleElement.astro
│   │   └── ...
│   │
│   ├── layouts/
│   │   └── Layout.astro            ← Layout principal
│   │
│   ├── Styles/                     ← CSS globaux
│   │   ├── style.css
│   │   └── home.css
│   │
│   ├── datas/
│   │   └── Json/
│   │       ├── datas.json          ← Données éléments HTML
│   │       └── codepen-mapping.json
│   │
│   ├── markdown/                   ← Documentation Markdown
│   │   ├── audio.md
│   │   ├── video.md
│   │   ├── img.md
│   │   └── api/
│   │       └── getUserMedia.md
│   │
│   └── assets/                     ← Images, audio, vidéo
│       ├── logo/
│       ├── img/
│       ├── audio/
│       └── video/
│
├── public/                         ← Assets statiques
│   ├── assets/
│   │   └── html5-et-multimedia.pdf ← PDF à télécharger
│   ├── favicon.svg
│   └── ...
│
└── dist/  ← ❌ N'existe pas encore (généré par npm run build)
```

## Après Build : Structure de Distribution

```
npm run build

↓
↓
↓

dist/                                ← Ceci est uploadé à Always Data !
│
├── index.html                       ← / (page d'accueil)
│
├── documentation/
│   └── index.html                   ← /documentation
│
├── elements/
│   ├── img/
│   │   └── index.html               ← /elements/img
│   ├── video/
│   │   └── index.html               ← /elements/video
│   ├── audio/
│   │   └── index.html               ← /elements/audio
│   ├── picture/
│   │   └── index.html               ← /elements/picture
│   ├── source/
│   │   └── index.html               ← /elements/source
│   ├── track/
│   │   └── index.html               ← /elements/track
│   ├── canvas/
│   │   └── index.html               ← /elements/canvas
│   ├── svg/
│   │   └── index.html               ← /elements/svg
│   ├── figure/
│   │   └── index.html               ← /elements/figure
│   ├── object/
│   │   └── index.html               ← /elements/object
│   └── embed/
│       └── index.html               ← /elements/embed
│
├── api/
│   ├── getUserMedia/
│   │   └── index.html               ← /api/getUserMedia
│   └── webcam-demo/
│       └── index.html               ← /api/webcam-demo
│
├── assets/
│   ├── html5-et-multimedia.pdf      ← /assets/html5-et-multimedia.pdf
│   ├── logo/
│   │   └── ...
│   ├── img/
│   │   ├── istockphoto-2098773559-1024x1024.jpg
│   │   └── ...
│   ├── audio/
│   │   ├── Bonbon/
│   │   │   └── Bonbon.mp3
│   │   └── ...
│   └── video/
│       ├── 14733700_3840_2160_60fps.mp4
│       └── ...
│
├── favicon.svg
├── _astro/                          ← CSS/JS compilés
│   ├── style.XXXXX.css
│   └── ...
│
└── ...autres fichiers statiques...
```

## Déploiement sur Always Data

```
UPLOAD "./dist/" vers Always Data
│
├── Racine du serveur web (/)
│   │
│   ├── index.html                    ✅ Always Data → / (accueil)
│   │
│   ├── documentation/
│   │   └── index.html                ✅ Always Data → /documentation
│   │
│   ├── elements/
│   │   ├── img/index.html            ✅ Always Data → /elements/img
│   │   ├── video/index.html          ✅ Always Data → /elements/video
│   │   └── ...
│   │
│   ├── api/
│   │   ├── getUserMedia/index.html   ✅ Always Data → /api/getUserMedia
│   │   └── webcam-demo/index.html    ✅ Always Data → /api/webcam-demo
│   │
│   ├── assets/
│   │   ├── html5-et-multimedia.pdf   ✅ /assets/html5-et-multimedia.pdf
│   │   ├── logo/
│   │   ├── img/
│   │   ├── audio/
│   │   └── video/
│   │
│   ├── favicon.svg                   ✅ /favicon.svg
│   │
│   └── _astro/
│       └── styles compilés
```

## Flux Complet

```
┌─────────────────────────────────────────────────────────────┐
│                 Développement Local                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  src/pages/index.astro  ──┐                               │
│  src/pages/documentation.astro ──┐                         │
│  src/pages/elements/[balise].astro ──┐                     │
│  src/pages/api/*.astro  ──┐                                │
│                           │                                │
│                      npm run dev                           │
│                           │                                │
│                           ▼                                │
│                  http://localhost:5173                     │
│                   (Tout fonctionne ✅)                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                           │
                           │
                      npm run build
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│           Fichiers Buildés (./dist/)                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✅ HTML statique pré-généré                              │
│  ✅ CSS compilé                                           │
│  ✅ JS optimisé                                           │
│  ✅ Assets compressés                                     │
│  ✅ Prêt pour production                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                           │
                           │
                    FileZilla Upload
                    (ou Panel Always Data)
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│           Serveur Always Data (Production)                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  https://votre-domaine.alwaysdata.net                      │
│  │                                                          │
│  ├─ /                 → index.html ✅                      │
│  ├─ /documentation    → documentation/index.html ✅        │
│  ├─ /elements/img     → elements/img/index.html ✅         │
│  ├─ /api/getUserMedia → api/getUserMedia/index.html ✅     │
│  ├─ /assets/...       → assets/... ✅                      │
│  └─ /favicon.svg      → favicon.svg ✅                     │
│                                                             │
│   ✅ TOUS LES LIENS FONCTIONNENT !                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Magique d'Always Data 🪄

Always Data utilise un **serveur web intelligent** qui :

```
URL Demandée          Fichier Servi (automatiquement)
─────────────────────────────────────────────────────
/                  → ./index.html
/documentation     → ./documentation/index.html
/documentation/    → ./documentation/index.html
/elements/img      → ./elements/img/index.html
/elements/img/     → ./elements/img/index.html
/api/getUserMedia  → ./api/getUserMedia/index.html
/assets/style.css  → ./assets/style.css
/favicon.svg       → ./favicon.svg

C'est du routing "magique" ! ✨
Pas besoin de configuration spéciale.
Astro génère la structure, Always Data la sert.
```

## Résumé

| Étape | Fichiers | Localisation | Statut |
|-------|----------|--------------|--------|
| **Développement** | `src/` | Votre ordinateur | En cours ✏️ |
| **Build** | `dist/` | Votre ordinateur | Statique ✅ |
| **Upload** | `dist/` | Always Data | Production 🌐 |
| **Accès** | URLs | Internet | Accessible 🎉 |

---

**Le flux : Développer → Builder → Uploader → Utiliser ! 🚀**
