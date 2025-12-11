# 📚 TutoHTMLMedia - Tutoriel HTML5 Multimédia# 📚 TutoHTMLMedia - Tutoriel HTML5 Multimédia# Tutoriel HTML Media - Projet Astro

## 🎯 Objectif du Projet## 🎯 Objectif du Projet## 🚀 Structure du Projet

Ce projet est un tutoriel interactif destiné aux débutants pour apprendre à intégrer et manipuler des médias dans les pages web modernes.Ce projet est un tutoriel interactif destiné aux débutants pour apprendre à intégrer et manipuler des médias dans les pages web modernes. Il couvre :```text

### Contenu du Tutoriel/

- ✅ **Les balises HTML5 multimédia** (img, picture, audio, video, etc.)- ✅ **Les balises HTML5 multimédia** (img, picture, audio, video, etc.)├── public/

- ✅ **Les API JavaScript optionnelles** (getUserMedia pour webcam/micro)

- ✅ **Des exemples pratiques et interactifs**- ✅ **Les API JavaScript optionnelles** (getUserMedia pour webcam/micro)│   └── (fichiers statiques)

- ✅ **Une documentation complète et accessible**

- ✅ **Des exemples pratiques et interactifs**├── src/

---

- ✅ **Une documentation complète et accessible**│   ├── assets/

## 📋 Éléments HTML5 Couverts

│   │   ├── audio/

### 🖼️ Images

- `<img>` - Image simple## 📋 Contenu│   │   └── logo/

- `<picture>` - Images responsives

- `<source>` - Sources multiples│   ├── components/

### 🎵 Audio & Vidéo### 🏷️ Balises HTML5 (Partie obligatoire)│   │   └── ArticleElement.astro

- `<audio>` - Lecteur audio

- `<video>` - Lecteur vidéo  │   ├── datas/

- `<track>` - Sous-titres et pistes

**Images** :│   │   └── Json/

### 🎨 Graphiques

- `<canvas>` - Dessins dynamiques- `<img>` - Image simple│   │       └── datas.json

- `<svg>` - Graphiques vectoriels

- `<picture>` - Images responsives│   ├── JS/

### 📝 Sémantique

- `<figure>` & `<figcaption>` - Légendes de médias- `<source>` - Sources multiples│   │   ├── index.js

### 🔌 Hérités│   │   ├── API/

- `<object>` & `<embed>` - Contenu externe

**Audio & Vidéo** :│   │   ├── pages/

### ⚡ API JavaScript (Optionnel/Avancé)

- **MediaDevices.getUserMedia()** : Accès webcam et microphone- `<audio>` - Lecteur audio│   │   └── template/

- **Démonstrations interactives** : Capture photo, enregistrement audio

- `<video>` - Lecteur vidéo  │   ├── layouts/

---

- `<track>` - Sous-titres et pistes│   │   └── Layout.astro

## 🚀 Démarrage Rapide

│   ├── markdown/

```bash

# 1. Installer les dépendances**Graphiques** :│   │   └── (fichiers markdown)

npm install

- `<canvas>` - Dessins dynamiques│   ├── pages/

# 2. Lancer le serveur de développement

npm run dev- `<svg>` - Graphiques vectoriels│   │   └── index.astro



# 3. Ouvrir http://localhost:4321 dans votre navigateur│   └── Styles/

```

**Sémantique** :│       └── style.css

### Commandes Disponibles

- `<figure>` & `<figcaption>` - Légendes de médias└── package.json

| Commande | Action |

|----------|--------|```markdown

| `npm install` | Installe les dépendances |

| `npm run dev` | Démarre le serveur local sur `localhost:4321` |**Hérités** :

| `npm run build` | Construit le site de production dans `./dist/` |

| `npm run preview` | Prévisualise le build localement |- `<object>` & `<embed>` - Contenu externe## 🧞 Commandes

| `npm run astro check` | Vérifie TypeScript et erreurs |

---

### ⚡ API JavaScript (Partie optionnelle/avancée)Toutes les commandes s'exécutent depuis la racine du projet, dans un terminal

## 📁 Structure du Projet

```text

TutoHTMLMedia/- **MediaDevices.getUserMedia()** : Accès webcam et microphone| Commande                   | Action                                           |

├── public/                    # Fichiers statiques

├── src/- **Démonstrations interactives** : Capture photo, enregistrement audio| :------------------------ | :----------------------------------------------- |

│   ├── assets/               # Médias (images, audio, vidéo)

│   │   ├── audio/| `npm install`             | Installe les dépendances                         |

│   │   ├── img/

│   │   ├── logo/## 🚀 Démarrage Rapide| `npm run dev`             | Démarre le serveur de développement local sur `localhost:4321` |

│   │   └── video/

│   ├── components/           # Composants Astro réutilisables| `npm run build`           | Construit le site de production dans `./dist/`    |

│   │   ├── ArticleElement.astro

│   │   ├── CodePenEmbed.astro```bash| `npm run preview`         | Prévisualise votre build localement avant de déployer |

│   │   ├── CodeViewer.astro

│   │   └── InteractiveEditor.astro# Installer les dépendances| `npm run astro ...`       | Exécute des commandes CLI comme `astro add`, `astro check` |

│   ├── datas/Json/           # Données des éléments

│   │   ├── codepen-mapping.jsonnpm install

│   │   └── datas.json

│   ├── layouts/              # Layout principal## 📝 Fonctionnalités

│   │   └── Layout.astro

│   ├── markdown/             # Documentation markdown# Lancer le serveur de développement

│   │   ├── audio.md, video.md, img.md...

│   │   └── api/              # Documentation API JSnpm run dev- **Affichage dynamique** : Les éléments HTML sont chargés depuis un fichier JSON

│   │       └── getUserMedia.md

│   ├── pages/                # Pages du site (routes)```- **Deux vues** : Syntaxe et Attributs (configurable dans `src/pages/index.astro`)

│   │   ├── index.astro              # Page d'accueil

│   │   ├── documentation.astro      # Index documentation- **Composants réutilisables** : Architecture basée sur des composants Astro

│   │   ├── elements/[balise].astro  # Pages dynamiques

│   │   └── api/                     # Pages API JavaScriptLe site sera accessible sur `http://localhost:4321`- **Performances optimisées** : Build statique avec Astro

│   │       ├── getUserMedia.astro

│   │       └── webcam-demo.astro

│   └── Styles/               # Styles CSS

│       ├── style.css         # Styles globaux## 📁 Structure du Projet## 🎯 Migration de Vite vers Astro

│       └── home.css          # Styles page d'accueil

├── astro.config.mjs          # Configuration Astro

├── tsconfig.json             # Configuration TypeScript

└── package.json              # Dépendances```### Changements principaux

```

TutoHTMLMedia/

---

├── src/1. **Configuration** : `vite.config.js` → `astro.config.mjs`

## 🎨 Architecture & Design

│   ├── assets/              # Médias (images, audio, vidéo)2. **Point d'entrée** : `index.html` + `src/JS/index.js` → `src/pages/index.astro`

### Layout de la Page d'Accueil

│   ├── components/          # Composants Astro réutilisables3. **Logique JS** : Les factories JavaScript ont été converties en composants Astro

```markdown

┌────────────────────────────────────────────┐│   ├── datas/Json/          # Données des éléments4. **Styles** : Les CSS sont importés directement dans les composants Astro

│              HERO                          │

├────────────────────────────────────────────┤│   ├── layouts/             # Layout principal5. **Build** : Astro génère maintenant du HTML statique optimisé

│  Définition (68%)  │  Éléments (32%)      │

│  • Article         │  • Grille 2 colonnes ││   ├── markdown/            # Documentation markdown

│  • Cartes          │  • 11 éléments       │

├────────────────────────────────────────────┤│   │   ├── audio.md, video.md, img.md...### Avantages de la migration

│  API JavaScript (full-width)               │

│  • getUserMedia  • Démo Interactive        ││   │   └── api/             # 🆕 Documentation API JS

├────────────────────────────────────────────┤

│  Quick Links                               ││   │       └── getUserMedia.md- ✅ Meilleure performance (HTML statique)

└────────────────────────────────────────────┘

```│   ├── pages/- ✅ SEO optimisé par défaut



### Responsive Design│   │   ├── index.astro              # Page d'accueil- ✅ Architecture de composants claire



- **Desktop (>1024px)** : Layout côte-à-côte│   │   ├── documentation.astro      # Index documentation- ✅ Support TypeScript natif

- **Tablet (768-1024px)** : Colonnes

- **Mobile (<768px)** : Stack vertical│   │   ├── elements/[balise].astro  # Pages dynamiques- ✅ Build plus rapide



### Styles Organisés│   │   └── api/             # 🆕 Pages API JavaScript



- **`style.css`** : Styles globaux (layout, nav, footer)│   │       ├── getUserMedia.astro## 🔧 Configuration

- **`home.css`** : Styles page d'accueil (hero, sections, cards)

│   │       └── webcam-demo.astro

---

│   └── Styles/style.css     # Styles globauxPour changer la vue affichée (syntaxe ou attributs), modifiez la constante dans `src/pages/index.astro` :

## 🔧 Configuration

├── public/                  # Fichiers statiques

### Changer la Vue (Syntaxe/Attributs)

└── package.json```typescript

Dans `src/pages/index.astro` :

```const vueActuelle = 'attributs'; // ou 'syntaxe'

```typescript

const vueActuelle = 'attributs'; // ou 'syntaxe'```markdown

```

## 🎓 Utilisation Pédagogique

### Modifier les Données

## 📚 Documentation

Éditez `src/datas/Json/datas.json` pour ajouter/modifier des éléments HTML.

### Progression conseillée

---

- [Documentation Astro](https://docs.astro.build)

## 🎓Utilisation Pédagogique

### Progression Conseillée

1. **Débutant** : `<img>`, `<audio>`, `<video>`
2. **Intermédiaire** : `<picture>`, `<source>`, `<track>`
3. **Avancé** : `<canvas>`, `<svg>`, API getUserMedia

### Fonctionnalités Pédagogiques

- ✅ Vue code/aperçu côte à côte
- ✅ Exemples testables et modifiables
- ✅ Documentation complète

- ✅ Exemples testables et modifiables- ✅ Intégration CodePen

- ✅ Documentation complète- ✅ Démonstrations interactives

- ✅ Intégration CodePen

- ✅ Démonstrations interactives## 🛠️ Technologies

---- **Astro** - Framework web moderne

- **HTML5** - Balises multimédia

## 🛠️ Technologies Utilisées- **CSS3** - Styles responsive

- **TypeScript** - Code côté client

- **Astro** - Framework web moderne (SSG)- **Markdown** - Documentation

- **HTML5** - Balises multimédia natives

- **CSS3** - Styles responsive et animations## 📖 Documentation

- **TypeScript** - Code côté client typé

- **Markdown** - Documentation structuréeConsultez `/documentation` pour :

- Référence complète de chaque élément HTML5

---- API JavaScript multimédia  

- Démonstrations interactives

## 📚 Documentation- Bonnes pratiques

### Pages Disponibles## ✨ Auteurs

| Route | Description |**Laurent Boyer et Stéphane Vallejo**

|-------|-------------|- GitHub: [@LaurentBoyer1976](https://github.com/LaurentBoyer1976)

| `/` | Page d'accueil |- Branche: DevScriptJS

| `/documentation` | Index de tous les éléments |

| `/elements/[balise]` | Documentation d'un élément HTML (11 pages) |## 📝 Licence

| `/api/getUserMedia` | Documentation API JavaScript |

| `/api/webcam-demo` | Démo interactive webcam |Projet pédagogique sous licence MIT.

### Ressources Externes---

- [Documentation Astro](https://docs.astro.build)**Note importante** : Les API JavaScript (getUserMedia, etc.) sont des fonctionnalités **optionnelles et avancées**, distinctes des balises HTML5 de base. Elles nécessitent HTTPS (ou localhost) et l'autorisation de l'utilisateur.

- [MDN Web Docs - HTML](https://developer.mozilla.org/fr/docs/Web/HTML)
- [MDN - getUserMedia](https://developer.mozilla.org/fr/docs/Web/API/MediaDevices/getUserMedia)

---

## 📝 Notes Importantes

### ⚠️ API JavaScript

Les API JavaScript (getUserMedia, etc.) sont des fonctionnalités **optionnelles et avancées**, distinctes des balises HTML5 de base.

**Prérequis** :

- HTTPS (ou localhost pour développement)
- Autorisation de l'utilisateur
- Navigateurs modernes

### 🔒 Sécurité

- Toutes les captures webcam/micro sont **100% locales**
- Aucune donnée n'est envoyée à un serveur
- Les permissions sont gérées par le navigateur

---

## ✨ Auteurs

**Laurent Boyer** & **Stéphane Vallejo**

- GitHub: [@LaurentBoyer1976](https://github.com/LaurentBoyer1976)
- Branche: `master` (ex-DevScriptJS)

---

## 📄 Licence

Projet pédagogique sous licence MIT.

---

## 🚀 Migration & Historique

### De Vite vers Astro

**Changements principaux** :

1. Configuration : `vite.config.js` → `astro.config.mjs`
2. Point d'entrée : `index.html` → `src/pages/index.astro`
3. Logique JS : Factories JavaScript → Composants Astro
4. Build : HTML statique optimisé

**Avantages** :

- ✅ Meilleure performance (HTML statique)
- ✅ SEO optimisé par défaut
- ✅ Architecture de composants claire
- ✅ Support TypeScript natif
- ✅ Build plus rapide

---

**Dernière mise à jour** : 11 décembre 2025
