# HTML5 et Multimédia - Checklists de Formation

## ✅ Checklist 1 — Présentation des principes fondamentaux

**Objectif :** Comprendre et présenter les bases du multimédia en HTML5.

- [ ] Rédiger une mini-fiche de l'histoire des média en HTML.
- [ ] Définir le rôle du multimédia dans le web moderne (images, audio, vidéo, interactivité).
- [ ] Expliquer les balises principales : `<img>`, `<picture>`, `<audio>`, `<video>`, `<source>`, `<track>`
- [ ] Identifier les formats multimédia courants (JPEG, WebP, MP3, MP4, WebM…) et leur compatibilité navigateur.
- [ ] Décrire les notions de compression, performance et accessibilité.
- [ ] Présenter les API multimédia JavaScript (ex. `MediaDevices.getUserMedia()`) et leur utilité.
- [ ] Créer une courte présentation théorique (texte + schéma illustrant le flux d'un média sur le web).
- [ ] Rédiger une mini-fiche synthèse : définitions + concepts clés (formats, codecs, accessibilité).

## ✅ Checklist 2 — Tutoriel pas à pas : intégration des médias HTML5

**Objectif :** Concevoir un tutoriel clair pour apprendre à intégrer des médias dans une page web.

- [ ] Créer un document HTML de base (`index.html`) avec structure `<header>`, `<main>`, `<footer>`
- [ ] Ajouter et tester une image avec `<img>` et attributs `alt`, `loading="lazy"`
- [ ] Mettre en place un `<picture>` avec `<source>` pour un affichage responsive (WebP + JPEG).
- [ ] Intégrer un lecteur audio simple avec `<audio controls>`
- [ ] Intégrer une vidéo avec `<video controls poster="image.jpg">`
- [ ] Ajouter plusieurs formats (`<source>` mp4 + webm) pour compatibilité.
- [ ] Ajouter une piste de sous-titres avec `<track kind="subtitles" src="subs.vtt">`
- [ ] Rédiger des explications claires pour chaque balise et attribut utilisé.
- [ ] Vérifier que les exemples fonctionnent sur Chrome, Firefox et Safari.

## ✅ Checklist 3 — Explications pédagogiques et expérimentation

**Objectif :** Guider l'apprentissage par la pratique et l'expérimentation.

- [ ] Expliquer comment optimiser les médias avant intégration (taille, formats, compression).
- [ ] Ajouter des consignes pour tester le comportement responsive (redimensionner la fenêtre).
- [ ] Illustrer les erreurs courantes et comment les corriger (format non supporté, absence de piste…).
- [ ] Ajouter une section "À toi de jouer" : proposer 2 mini-exercices pratiques.
  - [ ] **Exercice 1 :** intégrer une image responsive + description `alt` correcte.
  - [ ] **Exercice 2 :** ajouter une vidéo + sous-titres personnalisés.
- [ ] Fournir des captures d'écran ou GIFs d'exemple (illustration du rendu attendu).
- [ ] Ajouter un encadré "Astuce accessibilité" (usage de `alt`, `track`, `aria-label`).
- [ ] Tester les médias sur mobile et tablette (vérifier comportement tactile).

## ✅ Checklist 4 — Mise en valeur de l'expérimentation (API Multimédia)

**Objectif :** Favoriser la manipulation et montrer l'interactivité possible avec les API multimédia.

- [ ] Introduire le concept d'API multimédia JavaScript (ex : caméra, micro, capture vidéo).
- [ ] Expliquer brièvement le rôle de `navigator.mediaDevices`
- [ ] Créer un exemple simple avec `getUserMedia()` pour afficher la webcam dans une balise `<video>`
- [ ] Ajouter des contrôles "Démarrer" / "Arrêter" la webcam (boutons + JS).
- [ ] Expliquer le code JS ligne par ligne (pédagogie débutant).
- [ ] Ajouter un encadré "Attention sécurité et permissions" (HTTPS, autorisations navigateur).
- [ ] Proposer une mini-expérimentation : "Affiche ta webcam dans ta page HTML".
- [ ] Ajouter un message de fallback si la capture échoue.
- [ ] Documenter les bonnes pratiques (arrêt du flux, respect vie privée).

## ✅ Checklist 5 — Dossier de projet et démonstration finale

**Objectif :** Produire un rendu clair, fonctionnel et documenté.

- [ ] Créer une page "portfolio multimédia" intégrant images, audio, vidéo et webcam.
- [ ] Organiser le contenu par sections (`<section>` avec titres explicites).
- [ ] Ajouter une courte introduction sur le but du projet et les technologies utilisées.
- [ ] Ajouter des exemples commentés dans le code source.
- [ ] Tester la compatibilité et les performances (Lighthouse, DevTools).
- [ ] Vérifier l'accessibilité (sous-titres, `alt`, focus clavier).
- [ ] Écrire un document de synthèse (PDF/Google Docs) résumant :
  - [ ] Définitions & concepts clés.
  - [ ] Étapes du tutoriel.
  - [ ] Exemples et expérimentations.
  - [ ] Résultats observés & limites.
- [ ] Préparer une courte démonstration orale (5 min) pour présenter le résultat.
- [ ] Sauvegarder le projet sur GitHub ou dossier partagé pour évaluation.
