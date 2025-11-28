# <u>**L'élément :**</u>  ```<img>```

L'élément HTML ```<img>``` intègre une image dans le document.
C'est un **élément vide** (void element) qui n'a pas de balise de fermeture et ne peut pas contenir de contenu textuel.
Il est fondamental pour l'affichage d'images sur le web.

### Exemple de syntaxe simple

````html
    <img src="/shared-assets/images/sunset.jpg"
         alt="Coucher de soleil sur l'océan">
````

### Exemple avec attributs supplémentaires

````html
    <img src="/shared-assets/images/landscape.jpg"
         alt="Paysage de montagne enneigée"
         width="800"
         height="600"
         loading="lazy">
````

L'élément ```<img>``` est l'un des éléments les plus utilisés en HTML et est essentiel pour :

- Afficher des photos et illustrations
- Montrer des logos et icônes
- Présenter des graphiques et diagrammes
- Améliorer l'esthétique et la compréhension du contenu

## Les attributs

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- <u>*src :*</u>
  *Attribut obligatoire :*
  Spécifie l'URL de l'image à afficher.
  C'est l'attribut le plus important de l'élément ```<img>```.

  #### Exemples de chemins :

````html
  <!-- Chemin relatif -->
<img src="images/photo.jpg" alt="Photo">
<!-- Chemin absolu -->
<img src="/HTMLMEDIATUTORIAL/assets/images/logo.png" alt="Logo">
<!-- URL complète -->
<img src="https://example.com/images/banner.jpg" alt="Bannière">
<!-- Data URL (image encodée en base64) -->
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA..." alt="Petite icône">
  ````
- <u>*alt :*</u>
  *Attribut obligatoire (pour l'accessibilité) :*
  Fournit un texte alternatif pour l'image.
  Ce texte est affiché si l'image ne peut pas être chargée et est lu par les lecteurs d'écran.

  #### Bonnes pratiques pour `alt` :
````html
  <!-- ✅ Descriptif et concis -->
  <img src="team.jpg" alt="Équipe de 5 personnes souriant au bureau">
  <!-- ✅ Vide pour image décorative -->
  <img src="decoration.png" alt="">
  <!-- ❌ Trop générique -->
  <img src="team.jpg" alt="Image">
  <!-- ❌ Redondant avec le contexte -->
  <p>Voici notre équipe :</p>
  <img src="team.jpg" alt="Image de notre équipe">
  <!-- Mieux : alt="Cinq membres de l'équipe réunis dans la salle de conférence." -->
  ````
- <u>*width :*</u>
  La largeur intrinsèque de l'image en pixels (sans unité).
  Définir `width` et `height` permet d'éviter le layout shift pendant le chargement de la page.

  #### Exemples

  ````html
  <img src="photo.jpg" alt="Photo" width="800">
  <img src="icon.png" alt="Icône" width="32" height="32">
  ````

- <u>*height :*</u>
  La hauteur intrinsèque de l'image en pixels (sans unité).

  #### Note importante

  Les valeurs `width` et `height` définissent le **ratio d'aspect** de l'image, pas sa taille d'affichage.
  Utilisez CSS pour contrôler la taille d'affichage :

  ````html
  <img src="photo.jpg"
       alt="Photo"
       width="1600"
       height="900"
       style="max-width: 100%; height: auto;">
  ````

- <u>*loading :*</u>
  Indique comment le navigateur doit charger l'image.
  Valeurs possibles : `eager`, `lazy`

  - ###### <u>*eager :*</u> Charge l'image immédiatement, quelle que soit sa position dans la page (comportement par défaut)

  - ###### <u>*lazy :*</u> Diffère le chargement de l'image jusqu'à ce qu'elle soit proche du viewport

    **Excellent pour les performances !**

  #### Exemples :
````html
  <!-- Image au-dessus de la ligne de flottaison -->
  <img src="hero.jpg" alt="Image héro" loading="eager">
  <!-- Images plus bas dans la page -->
  <img src="gallery1.jpg" alt="Photo 1" loading="lazy">
  <img src="gallery2.jpg" alt="Photo 2" loading="lazy">
  <img src="gallery3.jpg" alt="Photo 3" loading="lazy">
  ````
- <u>*decoding :*</u>
  Fournit une indication au navigateur sur la façon de décoder l'image.
  Valeurs possibles : `sync`, `async`, `auto`

  - ###### <u>*sync :*</u> Décode l'image de manière synchrone pour une présentation atomique avec d'autres contenus

  - ###### <u>*async :*</u> Décode l'image de manière asynchrone pour réduire le délai de présentation d'autres contenus

  - ###### <u>*auto :*</u> Pas de préférence pour le mode de décodage (par défaut)

  #### Exemple :
````html
  <img src="large-photo.jpg"
       alt="Grande photo"
       decoding="async"
       loading="lazy">
  ````
- <u>*fetchpriority :*</u>  
  Fournit une indication sur la priorité relative à accorder lors de la récupération de l'image.
  Valeurs possibles : `high`, `low`, `auto`

  #### Exemple :
- ````html
  <!-- Image importante à charger en priorité -->
  <img src="hero-banner.jpg"
       alt="Bannière principale"
       fetchpriority="high">
  <!-- Image moins importante -->
  <img src="decoration.png"
       alt=""
       fetchpriority="low">
  ````
- <u>*srcset :*</u>  
  Définit un ensemble d'images sources que le navigateur peut choisir en fonction de la densité de pixels ou de la largeur de la fenêtre.

  #### Syntaxe avec descripteurs de densité de pixels :
- ````html
  <img src="photo-1x.jpg"
       srcset="photo-1x.jpg 1x,
               photo-2x.jpg 2x,
               photo-3x.jpg 3x"
       alt="Photo responsive">
  ````
  #### Syntaxe avec descripteurs de largeur :
````html
  <img src="photo-800.jpg"
       srcset="photo-400.jpg 400w,
               photo-800.jpg 800w,
               photo-1200.jpg 1200w,
               photo-1600.jpg 1600w"
       sizes="(max-width: 600px) 100vw,
              (max-width: 1200px) 50vw,
              800px"
       alt="Photo flexible">
 ````

- <u>*sizes :*</u>  
  Définit un ensemble de tailles d'image pour différentes conditions de mise en page.
  Utilisé conjointement avec `srcset` et des descripteurs de largeur (`w`).

  #### Exemples :
````html
  <!-- Image pleine largeur sur mobile, 50% sur desktop -->
  <img srcset="img-400.jpg 400w, img-800.jpg 800w, img-1200.jpg 1200w"
       sizes="(max-width: 768px) 100vw, 50vw"
       src="img-800.jpg"
       alt="Image responsive">
  <!-- Tailles multiples avec breakpoints -->
  <img srcset="small.jpg 300w, medium.jpg 600w, large.jpg 1200w"
       sizes="(max-width: 480px) 100vw,
              (max-width: 768px) 50vw,
              (max-width: 1200px) 33.3vw,
              25vw"
       src="medium.jpg"
       alt="Galerie d'images">
````
- <u>*crossorigin :*</u>  
  Indique si les requêtes CORS doivent être utilisées lors de la récupération de l'image.
  Valeurs possibles : `anonymous`, `use-credentials`

  #### Exemples :
````html
  <!-- Image d'un autre domaine sans credentials -->
  <img src="https://cdn.example.com/image.jpg"
       alt="Image externe"
       crossorigin="anonymous">
  <!-- Image nécessitant des credentials -->
  <img src="https://secure.example.com/private-image.jpg"
       alt="Image sécurisée"
       crossorigin="use-credentials">
````
- <u>*referrerpolicy :*</u>  
  Définit quelle information de référence envoyer lors de la récupération de l'image.
  Valeurs : `no-referrer`, `no-referrer-when-downgrade`, `origin`, `origin-when-cross-origin`, `same-origin`, `strict-origin`, `strict-origin-when-cross-origin`, `unsafe-url`

  #### Exemple :
````html
  <img src="https://example.com/image.jpg"
       alt="Image"
       referrerpolicy="no-referrer">
````
- <u>*usemap :*</u>  
  Associe l'image à une image map (carte cliquable) définie par un élément ```<map>```.
  La valeur doit être le symbole `#` suivi du nom de l'élément ```<map>```.

  #### Exemple :
````html

  <img src="world-map.jpg"
       alt="Carte du monde"
       usemap="#worldmap">
  <map name="worldmap">
      <area shape="rect" coords="0,0,100,100"
            href="europe.html" alt="Europe">
      <area shape="circle" coords="200,200,50"
            href="asia.html" alt="Asie">
  </map>
````
- <u>*ismap :*</u>  
  *Attribut booléen :*
  Indique que l'image fait partie d'une image map côté serveur.
  Lorsque l'utilisateur clique sur l'image, les coordonnées du clic sont envoyées au serveur.

  #### Exemple :
````html
  <a href="/map-handler">
      <img src="server-map.jpg" alt="Carte interactive" ismap>
  </a>
````

## Formats d'image supportés

|  Format   |  Extension   |   Type MIME    |   Support    | Usage recommandé                        |
|:---------:|:------------:|:--------------:|:------------:|:----------------------------------------|
| **JPEG**  | .jpg, .jpeg  |   image/jpeg   | ✅ Universel  | Photos, images complexes                |
|  **PNG**  |     .png     |   image/png    | ✅ Universel  | Images avec transparence, graphiques    |
|  **GIF**  |     .gif     |   image/gif    | ✅ Universel  | Animations simples (préférer WebP/AVIF) |
| **WebP**  |    .webp     |   image/webp   |  ✅ Moderne   | Excellent compromis qualité/taille      |
| **AVIF**  |    .avif     |   image/avif   | ⚠️ Émergent  | Meilleure compression que WebP          |
|  **SVG**  |     .svg     | image/svg+xml  | ✅ Universel  | Logos, icônes, graphiques vectoriels    |
|  **ICO**  |     .ico     |  image/x-icon  | ✅ Universel  | Favicons                                |
|  **BMP**  |     .bmp     |   image/bmp    |  ⚠️ Limité   | À éviter (fichiers lourds)              |

### Exemple de stratégie multi-formats

````html
<!-- Avec <picture> pour formats modernes -->
<picture>
    <source srcset="photo.avif" type="image/avif">
    <source srcset="photo.webp" type="image/webp">
    <img src="photo.jpg" alt="Photo" loading="lazy">
</picture>
<!-- Ou avec srcset uniquement -->
<img src="photo.jpg"
     srcset="photo.webp"
     alt="Photo"
     loading="lazy">
````

## Cas d'usage courants

### 1. Image simple

````html
<img src="logo.png" alt="Logo de l'entreprise" width="200" height="50">
````

### 2. Image responsive

````html
<img src="photo-800.jpg"
     srcset="photo-400.jpg 400w,
             photo-800.jpg 800w,
             photo-1200.jpg 1200w"
     sizes="(max-width: 600px) 100vw, 50vw"
     alt="Photo de paysage"
     loading="lazy">
````

### 3. Image haute résolution (Retina)

````html
<img src="icon.png"
     srcset="icon-1x.png 1x,
             icon-2x.png 2x,
             icon-3x.png 3x"
     alt="Icône"
     width="32"
     height="32">
````

### 4. Image de fond avec fallback

````html
<img src="hero-image.jpg"
     alt="Image héro de la page d'accueil"
     width="1920"
     height="1080"
     loading="eager"
     fetchpriority="high">
````

### 5. Image avec map cliquable

````html
<img src="france-map.jpg"
     alt="Carte de France"
     usemap="#france"
     width="600"
     height="800">
<map name="france">
    <area shape="circle" coords="300,200,50"
          href="paris.html" alt="Région Parisienne">
    <area shape="rect" coords="100,400,200,500"
          href="bretagne.html" alt="Bretagne">
</map>
````

## Optimisation et performances

### Lazy Loading

Le lazy loading est crucial pour les performances :

````html
<!-- Images au-dessus de la ligne de flottaison -->
<img src="header.jpg" alt="En-tête" loading="eager">
<!-- Images plus bas dans la page -->
<img src="content1.jpg" alt="Contenu 1" loading="lazy">
<img src="content2.jpg" alt="Contenu 2" loading="lazy">
````

### Dimensions pour éviter le layout shift

Toujours spécifier `width` et `height` :

````html
<!-- ✅ Bon : évite le layout shift -->
<img src="photo.jpg"
     alt="Photo"
     width="800"
     height="600"
     style="max-width: 100%; height: auto;">
<!-- ❌ Mauvais : causera un layout shift -->
<img src="photo.jpg" alt="Photo">
````

### Utiliser des formats modernes

````html
<picture>
    <source srcset="image.avif" type="image/avif">
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg"
         alt="Image optimisée"
         width="800"
         height="600"
         loading="lazy">
</picture>
````

### Priorité de chargement

````html
<!-- Image critique (hero) -->
<img src="hero.jpg"
     alt="Image héro"
     loading="eager"
     fetchpriority="high"
     width="1920"
     height="1080">
<!-- Images secondaires -->
<img src="thumbnail.jpg"
     alt="Miniature"
     loading="lazy"
     fetchpriority="low">
````

## Accessibilité

### Attribut `alt` - Les règles d'or

#### 1. Images informatives : : ````html

<img src="chart.png"
     alt="Graphique montrant une augmentation de 30% des ventes en 2024">

````
#### 2. Images décoratives : : ````html
<img src="decoration.png" alt="">
<!-- ou -->
<img src="decoration.png" alt="" role="presentation">
````

#### 3. Images fonctionnelles (boutons/liens) :
````html
<a href="search.html">
    <img src="search-icon.png" alt="Rechercher">
</a>
<button>
    <img src="save-icon.png" alt="Enregistrer">
</button>
````
#### 4. Images complexes :
````html
<figure>
    <img src="complex-diagram.png"
         alt="Diagramme du processus de développement"
         aria-describedby="diagram-description">
    <figcaption id="diagram-description">
        Le diagramme illustre les 5 étapes du processus :
        1. Planification, 2. Développement, 3. Tests,
        4. Déploiement, 5. Maintenance.
    </figcaption>
</figure>
````
### Mauvaises pratiques à éviter
````html
<!-- ❌ Alt générique -->
<img src="photo.jpg" alt="Image">
<!-- ❌ Alt avec "image de..." ou "photo de..." -->
<img src="landscape.jpg" alt="Image de paysage">
<!-- Mieux : alt="Paysage de montagne au coucher du soleil" -->
<!-- ❌ Alt manquant -->
<img src="important.jpg">
<!-- ❌ Texte alternatif trop long -->
<img src="scene.jpg"
     alt="Cette image montre une belle scène de nature avec des arbres verts,
          un ciel bleu, des nuages blancs, une rivière qui coule...">
````
## Interaction JavaScript :
### Charger une image dynamiquement
````javascript
const img = new Image();
img.src = 'photo.jpg';
img.alt = 'Photo chargée dynamiquement';
img.width = 800;
img.height = 600;
img.onload = function() {
    console.log('Image chargée avec succès');
    document.body.appendChild(img);
};
img.onerror = function() {
    console.error('Erreur de chargement de l\'image');
};
````
### Précharger des images
````javascript
function preloadImages(urls) {
    urls.forEach(url => {
        const img = new Image();
        img.src = url;
    });
}
preloadImages([
    'image1.jpg',
    'image2.jpg',
    'image3.jpg'
]);
````
### Détecter quelle image est chargée (srcset)
````javascript
const img = document.querySelector('img');
img.addEventListener('load', function() {
    console.log('Image source:', img.currentSrc);
    console.log('Dimensions naturelles:', img.naturalWidth, 'x', img.naturalHeight);
    console.log('Dimensions affichées:', img.width, 'x', img.height);
});
````
### Lazy loading manuel (pour anciens navigateurs)
````javascript
// Intersection Observer pour lazy loading
const images = document.querySelectorAll('img[data-src]');
const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const img = entry.target;
            img.src = img.dataset.src;
            img.removeAttribute('data-src');
            observer.unobserve(img);
        }
    });
});
images.forEach(img => imageObserver.observe(img));
````
````html
<!-- HTML correspondant -->
<img data-src="photo.jpg" alt="Photo" src="placeholder.jpg">
````
### Remplacer une image en cas d'erreur
````javascript
const img = document.querySelector('img');
img.addEventListener('error', function() {
    this.src = 'fallback-image.jpg';
    this.alt = 'Image de remplacement';
});
````
ou directement en HTML :
````html
<img src="photo.jpg"
     alt="Photo"
     onerror="this.src='fallback.jpg'">
````
## Styling CSS :
### Images responsives
````css
img {
    max-width: 100%;
    height: auto;
    display: block;
}
````
### Ratio d'aspect
````css
.image-container {
    position: relative;
    padding-bottom: 56.25%; /* ratio 16:9 */
    height: 0;
    overflow: hidden;
}
.image-container img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
````
### Object-fit
````css
/* Couvre le conteneur en gardant le ratio */
img {
    width: 100%;
    height: 400px;
    object-fit: cover;
}
/* Contient l'image dans le conteneur */
img {
    object-fit: contain;
}
/* Remplit sans garder le ratio */
img {
    object-fit: fill;
}
/* Positionner l'image */
img {
    object-fit: cover;
    object-position: top center;
}
````
### Filtres et effets
````css
/* Noir et blanc */
img {
    filter: grayscale(100%);
}
/* Flou */
img {
    filter: blur(5px);
}
/* Sépia */
img {
    filter: sepia(100%);
}
/* Combinaison */
img {
    filter: brightness(110%) contrast(120%) saturate(130%);
}
````
## Sécurité :
### Content Security Policy (CSP)
````html
<!-- En-tête HTTP -->
Content-Security-Policy: img-src 'self' https://cdn.example.com
<!-- Ou dans une balise meta -->
<meta http-equiv="Content-Security-Policy"
      content="img-src 'self' https://cdn.example.com">
````
### Validation des sources
````javascript
// Valider l'URL avant de charger l'image
function isValidImageUrl(url) {
    const allowedDomains = ['example.com', 'cdn.example.com'];
    try {
        const urlObj = new URL(url);
        return allowedDomains.includes(urlObj.hostname);
    } catch {
        return false;
    }
}
// Utilisation
if (isValidImageUrl(imageUrl)) {
    img.src = imageUrl;
} else {
    console.error('URL d\'image non autorisée');
}
````
## Bonnes pratiques - Checklist :
- ✅ **Toujours inclure l'attribut `alt`**
- ✅ **Spécifier `width` et `height`** pour éviter le layout shift
- ✅ **Utiliser `loading="lazy"`** pour les images hors viewport initial
- ✅ **Optimiser la taille des fichiers** (compression, format approprié)
- ✅ **Fournir plusieurs formats** (AVIF, WebP, JPEG)
- ✅ **Utiliser `srcset` et `sizes`** pour les images responsive
- ✅ **Définir `fetchpriority`** pour les images critiques
- ✅ **Tester l'accessibilité** avec des lecteurs d'écran
- ✅ **Valider les performances** avec Lighthouse
- ✅ **Utiliser un CDN** pour une livraison rapide
## Ressources complémentaires :
- [HTMLImageElement API](https://developer.mozilla.org/fr/docs/Web/API/HTMLImageElement)
- [Guide des images responsives](https://developer.mozilla.org/fr/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)
- [Optimisation des images web](https://web.dev/fast/#optimize-your-images)
- [Lazy loading natif](https://web.dev/browser-level-image-lazy-loading/)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<img>`.
