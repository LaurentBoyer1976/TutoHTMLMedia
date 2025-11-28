# L'élément : ```<svg>```

L'élément HTML ```<svg>``` (Scalable Vector Graphics) définit un conteneur pour des graphiques vectoriels.
Contrairement aux images bitmap (JPEG, PNG), les graphiques SVG sont basés sur des formules mathématiques et peuvent être agrandis à l'infini sans perte de qualité.
SVG est un format XML qui permet de créer des formes, des chemins, du texte, et même des animations directement dans le HTML.

## Exemple de syntaxe simple

````html
    <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
        <circle cx="100" cy="100" r="80" fill="#3498db" />
    </svg>
````

## Exemple avec plusieurs formes

````html
    <svg width="400" height="300" xmlns="http://www.w3.org/2000/svg">
        <rect x="50" y="50" width="150" height="100" fill="#2ecc71" />
        <circle cx="300" cy="100" r="60" fill="#e74c3c" />
        <line x1="0" y1="250" x2="400" y2="250" stroke="#34495e" stroke-width="3" />
    </svg>
````

L'élément ```<svg>``` est idéal pour :

- Créer des logos et icônes qui s'adaptent à toutes les tailles
- Dessiner des graphiques et diagrammes
- Créer des animations vectorielles
- Générer des visualisations de données interactives
- Afficher des cartes et illustrations techniques

## Les attributs principaux

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes) et des attributs spécifiques SVG.

- **width :**
  La largeur du SVG.
  Peut être en pixels, pourcentages, ou autres unités CSS.
  **Exemples :**
  ``html
  <svg width="300"></svg>
  <svg width="100%"></svg>
  <svg width="20em"></svg>

  ````
- **height :**
  La hauteur du SVG.
  Peut être en pixels, pourcentages, ou autres unités CSS.
  **Exemples :**
  ``html
  <svg height="200"></svg>
  <svg height="100%"></svg>
  <svg height="15em"></svg>

  ````
- **viewBox :**
  Définit la zone de l'espace SVG visible dans le viewport.
  Format : `min-x min-y width height`
  **Essentiel pour créer des SVG responsives !**
  **Exemples :**
  ``html
  <!-- viewBox="0 0 100 100" signifie :
       commence à (0,0) et affiche une zone de 100x100 -->
  <svg viewBox="0 0 100 100" width="300" height="300">
      <circle cx="50" cy="50" r="40" fill="blue" />
  </svg>
  <!-- Le cercle s'adaptera automatiquement à la taille du SVG -->
  ````
- **xmlns :**
  L'espace de noms XML pour SVG.
  Requis lorsque SVG est dans un document XML, optionnel dans HTML5.
  **Exemple :**
  ``html
  <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">
      <!-- contenu SVG -->
  </svg>

  ````
- **preserveAspectRatio :**
  Contrôle comment le SVG doit être mis à l'échelle s'il ne correspond pas exactement au viewport.
  Valeurs courantes : `none`, `xMinYMin`, `xMidYMid`, `xMaxYMax`, etc.
  **Exemples :**
  ````html
  <!-- Centrer et ajuster -->
  <svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid meet">
  <!-- Ne pas préserver le ratio (étirement) -->
  <svg viewBox="0 0 100 100" preserveAspectRatio="none">
  ````

## Formes de base SVG

### 1. Rectangle - `<rect>`

````html
<svg width="300" height="200">
    <!-- Rectangle simple -->
    <rect x="10" y="10" width="100" height="80" fill="#3498db" />
    <!-- Rectangle avec coins arrondis -->
    <rect x="130" y="10" width="100" height="80"
          rx="15" ry="15" fill="#2ecc71" />
    <!-- Rectangle avec contour -->
    <rect x="10" y="110" width="100" height="80"
          fill="none" stroke="#e74c3c" stroke-width="3" />
</svg>
````

### 2. Cercle - `<circle>`

````html
<svg width="300" height="200">
    <!-- Cercle plein -->
    <circle cx="75" cy="75" r="50" fill="#9b59b6" />
    <!-- Cercle avec contour seulement -->
    <circle cx="200" cy="75" r="50"
            fill="none" stroke="#f39c12" stroke-width="4" />
</svg>
````

### 3. Ellipse - `<ellipse>`

````html
<svg width="300" height="200">
    <ellipse cx="150" cy="100" rx="100" ry="50" fill="#1abc9c" />
</svg>
````

### 4. Ligne - `<line>`

````html
<svg width="300" height="200">
    <line x1="0" y1="0" x2="300" y2="200"
          stroke="#34495e" stroke-width="2" />
</svg>
````

### 5. Polyligne - `<polyline>`

````html
<svg width="300" height="200">
    <polyline points="10,10 100,50 50,100 150,80"
              fill="none" stroke="#e74c3c" stroke-width="2" />
</svg>
````

### 6. Polygone - `<polygon>`

````html
<svg width="300" height="200">
    <!-- Triangle -->
    <polygon points="150,10 100,100 200,100" fill="#3498db" />
    <!-- Étoile -->
    <polygon points="150,10 170,70 230,70 180,110 200,170 150,130 100,170 120,110 70,70 130,70"
             fill="#f39c12" />
</svg>
````

### 7. Chemin - `<path>` (le plus puissant !)

````html
<svg width="300" height="200">
    <!-- M = MoveTo, L = LineTo, C = CurveTo, Z = ClosePath -->
    <path d="M 10 80 Q 95 10 180 80 T 350 80"
          fill="none" stroke="#2ecc71" stroke-width="3" />
</svg>
````

### 8. Texte - `<text>`

````html
<svg width="400" height="100">
    <text x="10" y="40" font-family="Arial" font-size="24" fill="#333">
        Hello SVG!
    </text>
    <!-- Texte sur un chemin -->
    <defs>
        <path id="textPath" d="M 10 80 Q 200 10 390 80" />
    </defs>
    <text font-size="16" fill="#e74c3c">
        <textPath href="#textPath">
            Texte qui suit une courbe !
        </textPath>
    </text>
</svg>
````

## Attributs de style SVG

### Remplissage et contour

````html
<svg width="300" height="200">
    <!-- Remplissage solide -->
    <circle cx="60" cy="60" r="40" fill="#3498db" />
    <!-- Contour -->
    <circle cx="150" cy="60" r="40"
            fill="none" stroke="#e74c3c" stroke-width="4" />
    <!-- Remplissage + Contour -->
    <circle cx="240" cy="60" r="40"
            fill="#2ecc71" stroke="#27ae60" stroke-width="3" />
    <!-- Opacité -->
    <circle cx="60" cy="140" r="40"
            fill="#9b59b6" fill-opacity="0.5" />
    <!-- Contour pointillé -->
    <circle cx="150" cy="140" r="40"
            fill="none" stroke="#f39c12"
            stroke-width="3" stroke-dasharray="5,5" />
</svg>
````

### Styles de contour

````html
<svg width="400" height="300">
    <!-- stroke-linecap : extrémités des lignes -->
    <line x1="50" y1="50" x2="200" y2="50"
          stroke="#333" stroke-width="10" stroke-linecap="butt" />
    <line x1="50" y1="80" x2="200" y2="80"
          stroke="#333" stroke-width="10" stroke-linecap="round" />
    <line x1="50" y1="110" x2="200" y2="110"
          stroke="#333" stroke-width="10" stroke-linecap="square" />
    <!-- stroke-linejoin : jonctions des lignes -->
    <polyline points="250,50 300,50 300,100"
              fill="none" stroke="#e74c3c"
              stroke-width="10" stroke-linejoin="miter" />
    <polyline points="250,120 300,120 300,170"
              fill="none" stroke="#2ecc71"
              stroke-width="10" stroke-linejoin="round" />
    <polyline points="250,190 300,190 300,240"
              fill="none" stroke="#3498db"
              stroke-width="10" stroke-linejoin="bevel" />
</svg>
````

## Dégradés et motifs

### Dégradé linéaire

````html
<svg width="400" height="200">
    <defs>
        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#e74c3c;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#f39c12;stop-opacity:1" />
        </linearGradient>
    </defs>
    <rect width="400" height="200" fill="url(#grad1)" />
</svg>
````

### Dégradé radial

````html
<svg width="400" height="200">
    <defs>
        <radialGradient id="grad2">
            <stop offset="0%" style="stop-color:#fff;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#3498db;stop-opacity:1" />
        </radialGradient>
    </defs>
    <circle cx="200" cy="100" r="80" fill="url(#grad2)" />
</svg>
````

### Motifs (Patterns)

````html
<svg width="400" height="200">
    <defs>
        <pattern id="pattern1" x="0" y="0" width="20" height="20" patternUnits="userSpaceOnUse">
            <circle cx="10" cy="10" r="5" fill="#3498db" />
        </pattern>
    </defs>
    <rect width="400" height="200" fill="url(#pattern1)" />
</svg>
````

## Groupes et réutilisation

### Groupe - `<g>`

````html
<svg width="400" height="200">
    <!-- Groupe avec transformation commune -->
    <g transform="translate(50, 50)" fill="#3498db">
        <circle cx="0" cy="0" r="20" />
        <circle cx="60" cy="0" r="20" />
        <circle cx="120" cy="0" r="20" />
    </g>
</svg>
````

### Définitions et réutilisation - `<defs>` et `<use>`

````html
<svg width="400" height="200">
    <defs>
        <!-- Définir un symbole réutilisable -->
        <g id="star">
            <polygon points="50,10 60,40 90,40 65,60 75,90 50,70 25,90 35,60 10,40 40,40"
                     fill="#f39c12" />
        </g>
    </defs>
    <!-- Réutiliser le symbole -->
    <use href="#star" x="0" y="0" />
    <use href="#star" x="100" y="0" transform="scale(0.5)" />
    <use href="#star" x="200" y="50" fill="#e74c3c" />
</svg>
````

### Symboles - `<symbol>`

````html
<svg width="400" height="200">
    <defs>
        <symbol id="icon" viewBox="0 0 100 100">
            <circle cx="50" cy="50" r="40" fill="#3498db" />
            <text x="50" y="60" text-anchor="middle" fill="white" font-size="40">i</text>
        </symbol>
    </defs>
    <use href="#icon" width="50" height="50" />
    <use href="#icon" x="100" width="80" height="80" />
</svg>
````

## Transformations

````html
<svg width="400" height="400">
    <!-- Translation -->
    <rect x="0" y="0" width="50" height="50" fill="#3498db"
          transform="translate(100, 100)" />
    <!-- Rotation (angle, centre-x, centre-y) -->
    <rect x="0" y="0" width="50" height="50" fill="#2ecc71"
          transform="rotate(45, 250, 125)" />
    <!-- Mise à l'échelle -->
    <rect x="0" y="0" width="50" height="50" fill="#e74c3c"
          transform="scale(1.5)" />
    <!-- Inclinaison (skew) -->
    <rect x="100" y="250" width="50" height="50" fill="#f39c12"
          transform="skewX(20)" />
    <!-- Combinaison -->
    <rect x="0" y="0" width="50" height="50" fill="#9b59b6"
          transform="translate(250, 250) rotate(30) scale(1.2)" />
</svg>
````

## Filtres et effets

### Ombre portée

````html
<svg width="300" height="200">
    <defs>
        <filter id="shadow">
            <feDropShadow dx="5" dy="5" stdDeviation="3" flood-opacity="0.5" />
        </filter>
    </defs>
    <circle cx="150" cy="100" r="60" fill="#3498db" filter="url(#shadow)" />
</svg>
````

### Flou

````html
<svg width="300" height="200">
    <defs>
        <filter id="blur">
            <feGaussianBlur in="SourceGraphic" stdDeviation="5" />
        </filter>
    </defs>
    <circle cx="150" cy="100" r="60" fill="#e74c3c" filter="url(#blur)" />
</svg>
````

## Animations SVG

### Animation SMIL (intégrée à SVG)

````html
<svg width="400" height="200">
    <circle cx="50" cy="100" r="30" fill="#3498db">
        <animate attributeName="cx"
                 from="50" to="350"
                 dur="3s"
                 repeatCount="indefinite" />
    </circle>
    <circle cx="200" cy="100" r="20" fill="#e74c3c">
        <animate attributeName="r"
                 from="20" to="60"
                 dur="2s"
                 repeatCount="indefinite"
                 begin="0s" />
        <animate attributeName="opacity"
                 from="1" to="0"
                 dur="2s"
                 repeatCount="indefinite" />
    </circle>
</svg>
````

### Animation CSS

````html
<style>
@keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}
.rotating {
    animation: rotate 3s linear infinite;
    transform-origin: center;
}
</style>
<svg width="200" height="200">
    <rect x="75" y="75" width="50" height="50"
          fill="#3498db" class="rotating" />
</svg>
````

### Animation JavaScript

````html
<svg id="animatedSVG" width="400" height="200">
    <circle id="movingCircle" cx="50" cy="100" r="30" fill="#2ecc71" />
</svg>
<script>
const circle = document.getElementById('movingCircle');
let x = 50;
let direction = 1;
function animate() {
    x += direction * 2;
    if (x > 350 || x < 50) {
        direction *= -1;
    }
    circle.setAttribute('cx', x);
    requestAnimationFrame(animate);
}
animate();
</script>
````

## SVG responsive

### Méthode 1 : viewBox seul

````html
<!-- Le SVG s'adaptera automatiquement à la largeur de son conteneur -->
<svg viewBox="0 0 100 100">
    <circle cx="50" cy="50" r="40" fill="#3498db" />
</svg>
<style>
svg {
    width: 100%;
    height: auto;
}
</style>
````

### Méthode 2 : Avec ratio d'aspect fixe

````html
<div class="svg-container">
    <svg viewBox="0 0 16 9" preserveAspectRatio="xMidYMid meet">
        <rect width="16" height="9" fill="#3498db" />
    </svg>
</div>
<style>
.svg-container {
    position: relative;
    padding-bottom: 56.25%; /* ratio 16:9 */
    height: 0;
}
.svg-container svg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
</style>
````

## Exemples pratiques

### Exemple 1 : Logo simple

````html
<svg width="200" height="100" viewBox="0 0 200 100">
    <!-- Fond -->
    <rect width="200" height="100" fill="#3498db" rx="10" />
    <!-- Texte -->
    <text x="100" y="60"
          text-anchor="middle"
          fill="white"
          font-family="Arial, sans-serif"
          font-size="32"
          font-weight="bold">
        LOGO
    </text>
    <!-- Élément décoratif -->
    <circle cx="30" cy="30" r="15" fill="white" opacity="0.3" />
    <circle cx="170" cy="70" r="20" fill="white" opacity="0.2" />
</svg>
````

### Exemple 2 : Graphique en camembert

````html
<svg width="400" height="400" viewBox="0 0 200 200">
    <circle cx="100" cy="100" r="80" fill="#3498db" />
    <path d="M 100,100 L 100,20 A 80,80 0 0,1 163,56 Z" fill="#2ecc71" />
    <path d="M 100,100 L 163,56 A 80,80 0 0,1 163,144 Z" fill="#f39c12" />
    <path d="M 100,100 L 163,144 A 80,80 0 0,1 100,180 Z" fill="#e74c3c" />
    <!-- Labels -->
    <text x="60" y="105" fill="white" font-size="14">40%</text>
    <text x="130" y="70" fill="white" font-size="14">25%</text>
    <text x="145" y="120" fill="white" font-size="14">20%</text>
    <text x="105" y="160" fill="white" font-size="14">15%</text>
</svg>
````

### Exemple 3 : Icône interactive

````html
<svg id="iconMenu" width="60" height="60" viewBox="0 0 60 60"
     style="cursor: pointer;">
    <g id="menuLines">
        <line x1="10" y1="20" x2="50" y2="20"
              stroke="#333" stroke-width="3" stroke-linecap="round" />
        <line x1="10" y1="30" x2="50" y2="30"
              stroke="#333" stroke-width="3" stroke-linecap="round" />
        <line x1="10" y1="40" x2="50" y2="40"
              stroke="#333" stroke-width="3" stroke-linecap="round" />
    </g>
</svg>
<style>
#menuLines line {
    transition: all 0.3s ease;
}
#iconMenu:hover line:nth-child(1) {
    transform: translateY(5px);
}
#iconMenu:hover line:nth-child(3) {
    transform: translateY(-5px);
}
</style>
````

## Accessibilité SVG

### Bonnes pratiques

````html
<!-- Titre et description -->
<svg role="img" aria-labelledby="svgTitle svgDesc">
    <title id="svgTitle">Graphique des ventes</title>
    <desc id="svgDesc">
        Graphique en barres montrant l'évolution des ventes sur 6 mois,
        avec une croissance de 15% en moyenne.
    </desc>
    <!-- Contenu graphique -->
</svg>
<!-- SVG décoratif -->
<svg aria-hidden="true" focusable="false">
    <!-- Contenu purement décoratif -->
</svg>
<!-- SVG comme bouton -->
<button aria-label="Fermer">
    <svg width="24" height="24" aria-hidden="true">
        <path d="M6 6 L18 18 M6 18 L18 6" stroke="currentColor" stroke-width="2" />
    </svg>
</button>
````

## Performance et optimisation

### 1. Simplifier les chemins

````html
<!-- ❌ Complexe -->
<path d="M10.5,20.3 L15.7,25.8 L20.2,30.4 L25.9,35.1" />
<!-- ✅ Simplifié -->
<path d="M10,20 L15,25 L20,30 L25,35" />
````

### 2. Utiliser des symboles pour répétition

````html
<!-- ❌ Répétition -->
<circle cx="10" cy="10" r="5" fill="#3498db" />
<circle cx="30" cy="10" r="5" fill="#3498db" />
<circle cx="50" cy="10" r="5" fill="#3498db" />
<!-- ✅ Avec symbole -->
<defs>
    <circle id="dot" r="5" fill="#3498db" />
</defs>
<use href="#dot" x="10" y="10" />
<use href="#dot" x="30" y="10" />
<use href="#dot" x="50" y="10" />
````

### 3. Optimiser avec des outils

- **SVGO** : Optimiseur SVG en ligne de commande
- **SVGOMG** : Interface web pour SVGO
- **Adobe Illustrator** : Export optimisé pour le web

## Ressources complémentaires

- [SVG sur MDN](https://developer.mozilla.org/fr/docs/Web/SVG)
- [Tutoriel SVG](https://developer.mozilla.org/fr/docs/Web/SVG/Tutorial)
- [SVG Path Reference](https://developer.mozilla.org/fr/docs/Web/SVG/Tutorial/Paths)
- [Can I use SVG](https://caniuse.com/svg)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<svg>`.
