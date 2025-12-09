# 📚 TutoHTMLMedia - Tutoriel HTML5 Multimédia# Tutoriel HTML Media - Projet Astro

## 🎯 Objectif du Projet## 🚀 Structure du Projet

Ce projet est un tutoriel interactif destiné aux débutants pour apprendre à intégrer et manipuler des médias dans les pages web modernes. Il couvre :```text

/

- ✅ **Les balises HTML5 multimédia** (img, picture, audio, video, etc.)├── public/

- ✅ **Les API JavaScript optionnelles** (getUserMedia pour webcam/micro)│   └── (fichiers statiques)

- ✅ **Des exemples pratiques et interactifs**├── src/

- ✅ **Une documentation complète et accessible**│   ├── assets/

│   │   ├── audio/

## 📋 Contenu│   │   └── logo/

│   ├── components/

### 🏷️ Balises HTML5 (Partie obligatoire)│   │   └── ArticleElement.astro

│   ├── datas/

**Images** :│   │   └── Json/

- `<img>` - Image simple│   │       └── datas.json

- `<picture>` - Images responsives│   ├── JS/

- `<source>` - Sources multiples│   │   ├── index.js

│   │   ├── API/

**Audio & Vidéo** :│   │   ├── pages/

- `<audio>` - Lecteur audio│   │   └── template/

- `<video>` - Lecteur vidéo  │   ├── layouts/

- `<track>` - Sous-titres et pistes│   │   └── Layout.astro

│   ├── markdown/

**Graphiques** :│   │   └── (fichiers markdown)

- `<canvas>` - Dessins dynamiques│   ├── pages/

- `<svg>` - Graphiques vectoriels│   │   └── index.astro

│   └── Styles/

**Sémantique** :│       └── style.css

- `<figure>` & `<figcaption>` - Légendes de médias└── package.json

```markdown

**Hérités** :

- `<object>` & `<embed>` - Contenu externe## 🧞 Commandes



### ⚡ API JavaScript (Partie optionnelle/avancée)Toutes les commandes s'exécutent depuis la racine du projet, dans un terminal :



- **MediaDevices.getUserMedia()** : Accès webcam et microphone| Commande                   | Action                                           |

- **Démonstrations interactives** : Capture photo, enregistrement audio| :------------------------ | :----------------------------------------------- |

| `npm install`             | Installe les dépendances                         |

## 🚀 Démarrage Rapide| `npm run dev`             | Démarre le serveur de développement local sur `localhost:4321` |

| `npm run build`           | Construit le site de production dans `./dist/`    |

```bash| `npm run preview`         | Prévisualise votre build localement avant de déployer |

# Installer les dépendances| `npm run astro ...`       | Exécute des commandes CLI comme `astro add`, `astro check` |

npm install

## 📝 Fonctionnalités

# Lancer le serveur de développement

npm run dev- **Affichage dynamique** : Les éléments HTML sont chargés depuis un fichier JSON

```- **Deux vues** : Syntaxe et Attributs (configurable dans `src/pages/index.astro`)

- **Composants réutilisables** : Architecture basée sur des composants Astro

Le site sera accessible sur `http://localhost:4321`- **Performances optimisées** : Build statique avec Astro



## 📁 Structure du Projet## 🎯 Migration de Vite vers Astro



```### Changements principaux

TutoHTMLMedia/

├── src/1. **Configuration** : `vite.config.js` → `astro.config.mjs`

│   ├── assets/              # Médias (images, audio, vidéo)2. **Point d'entrée** : `index.html` + `src/JS/index.js` → `src/pages/index.astro`

│   ├── components/          # Composants Astro réutilisables3. **Logique JS** : Les factories JavaScript ont été converties en composants Astro

│   ├── datas/Json/          # Données des éléments4. **Styles** : Les CSS sont importés directement dans les composants Astro

│   ├── layouts/             # Layout principal5. **Build** : Astro génère maintenant du HTML statique optimisé

│   ├── markdown/            # Documentation markdown

│   │   ├── audio.md, video.md, img.md...### Avantages de la migration

│   │   └── api/             # 🆕 Documentation API JS

│   │       └── getUserMedia.md- ✅ Meilleure performance (HTML statique)

│   ├── pages/- ✅ SEO optimisé par défaut

│   │   ├── index.astro              # Page d'accueil- ✅ Architecture de composants claire

│   │   ├── documentation.astro      # Index documentation- ✅ Support TypeScript natif

│   │   ├── elements/[balise].astro  # Pages dynamiques- ✅ Build plus rapide

│   │   └── api/             # 🆕 Pages API JavaScript

│   │       ├── getUserMedia.astro## 🔧 Configuration

│   │       └── webcam-demo.astro

│   └── Styles/style.css     # Styles globauxPour changer la vue affichée (syntaxe ou attributs), modifiez la constante dans `src/pages/index.astro` :

├── public/                  # Fichiers statiques

└── package.json```typescript

```const vueActuelle = 'attributs'; // ou 'syntaxe'

```markdown

## 🎓 Utilisation Pédagogique

## 📚 Documentation

### Progression conseillée

- [Documentation Astro](https://docs.astro.build)

1. **Débutant** : `<img>`, `<audio>`, `<video>`- [Discord Astro](https://astro.build/chat)

2. **Intermédiaire** : `<picture>`, `<source>`, `<track>`
3. **Avancé** : `<canvas>`, `<svg>`, API getUserMedia

### Fonctionnalités

- ✅ Vue code/aperçu côte à côte
- ✅ Exemples testables et modifiables
- ✅ Documentation complète
- ✅ Intégration CodePen
- ✅ Démonstrations interactives

## 🛠️ Technologies

- **Astro** - Framework web moderne
- **HTML5** - Balises multimédia
- **CSS3** - Styles responsive
- **TypeScript** - Code côté client
- **Markdown** - Documentation

## 📖 Documentation

Consultez `/documentation` pour :
- Référence complète de chaque élément HTML5
- API JavaScript multimédia  
- Démonstrations interactives
- Bonnes pratiques

## ✨ Auteur

**Laurent Boyer**
- GitHub: [@LaurentBoyer1976](https://github.com/LaurentBoyer1976)
- Branche: DevScriptJS

## 📝 Licence

Projet pédagogique sous licence MIT.

---

**Note importante** : Les API JavaScript (getUserMedia, etc.) sont des fonctionnalités **optionnelles et avancées**, distinctes des balises HTML5 de base. Elles nécessitent HTTPS (ou localhost) et l'autorisation de l'utilisateur.
