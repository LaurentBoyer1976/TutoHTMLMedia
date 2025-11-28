# <u>**L'élément :**</u>  ```<picture>```

L'élément HTML ```<picture>``` est un conteneur utilisé pour spécifier plusieurs sources pour un élément ```<img>``` qu'il contient.  
Le navigateur choisira la source la plus appropriée en fonction de la résolution de l'écran, de la taille de la fenêtre, du format d'image supporté, et d'autres critères.  
Cet élément permet de fournir des **images responsives** et optimisées pour différents contextes d'affichage.

### Exemple de syntaxe simple

````html
    <picture>
        <source srcset="/shared-assets/images/photo.avif" type="image/avif">
        <source srcset="/shared-assets/images/photo.webp" type="image/webp">
        <img src="/shared-assets/images/photo.jpg" alt="Belle photo de paysage">
    </picture>
````

### Exemple avec media queries

````html
    <picture>
        <source media="(min-width: 1200px)" srcset="large.jpg">
        <source media="(min-width: 768px)" srcset="medium.jpg">
        <img src="small.jpg" alt="Image responsive">
    </picture>
````

L'élément ```<picture>``` est particulièrement utile pour :

- **L'art direction** : Afficher des images différentes selon le contexte
- **L'optimisation des performances** : Servir des formats modernes aux navigateurs compatibles
- **La gestion des écrans haute résolution** (Retina, 4K, etc.)
- **L'économie de bande passante** : Charger uniquement la version appropriée de l'image

## Structure et utilisation

### Anatomie d'un élément `<picture>`

````html
<picture>
    <!-- Sources optionnelles, évaluées dans l'ordre -->
    <source srcset="..." type="..." media="...">
    <source srcset="..." type="..." media="...">
    <!-- Élément img OBLIGATOIRE (fallback) -->
    <img src="..." alt="...">
</picture>
````

### Règles importantes

1. **L'élément ```<img>``` est obligatoire** et doit être le dernier enfant
2. **Les éléments ```<source>``` sont évalués dans l'ordre** d'apparition
3. **La première source compatible** est sélectionnée.
4. **L'attribut `alt`** doit être sur l'élément ```<img>```

## Les attributs (sur `<source>`)

Cet élément utilise principalement des éléments ```<source>``` qui supportent les attributs suivants :

- <u>*srcset :*</u>
  *Attribut requis :*
  Spécifie l'URL de l'image à utiliser dans différents contextes.
  Peut contenir plusieurs images avec descripteurs de taille ou de densité.

  #### Exemples

  ````html
  <!-- Une seule image -->
  <source srcset="photo.jpg">
  <!-- Images avec descripteurs de largeur -->
  <source srcset="small.jpg 400w,
                  medium.jpg 800w,
                  large.jpg 1200w">
  <!-- Images avec descripteurs de densité de pixels -->
  <source srcset="photo-1x.jpg 1x,
                  photo-2x.jpg 2x,
                  photo-3x.jpg 3x">
  ````

- <u>*type :*</u>
  Le type MIME de l'image.
  Permet au navigateur de choisir immédiatement une source sans télécharger l'image pour vérifier son format.

  #### Types MIME courants pour images

  - `image/avif` - Format AVIF (très moderne, excellente compression)
  - `image/webp` - Format WebP (moderne, bonne compression)
  - `image/jpeg` - Format JPEG (classique, universellement supporté)
  - `image/png` - Format PNG (classique, transparence)
  - `image/svg+xml` - Format SVG (vectoriel)

  #### Exemple d'usage

  ````html
  <picture>
      <source srcset="image.avif" type="image/avif">
      <source srcset="image.webp" type="image/webp">
      <img src="image.jpg" alt="Description">
  </picture>
  ````

- <u>*media :*</u>
  Spécifie une media query que le navigateur évalue pour déterminer si cette source doit être utilisée.
  Si la media query n'est pas satisfaite, le navigateur passe à la source suivante.

  #### Exemples de media queries

  ````html
  <!-- Basé sur la largeur de la fenêtre -->
  <source media="(min-width: 1200px)" srcset="large.jpg">
  <source media="(min-width: 768px)" srcset="medium.jpg">
  <!-- Basé sur l'orientation -->
  <source media="(orientation: portrait)" srcset="portrait.jpg">
  <source media="(orientation: landscape)" srcset="landscape.jpg">
  <!-- Basé sur la résolution -->
  <source media="(min-resolution: 2dppx)" srcset="high-res.jpg">
  <!-- Combinaisons multiples -->
  <source media="(min-width: 768px) and (orientation: landscape)"
          srcset="tablet-landscape.jpg">
  ````

- <u>*sizes :*</u>
  Spécifie la taille d'affichage prévue de l'image pour différentes conditions de mise en page.
  Utilisé avec `srcset` et des descripteurs de largeur (`w`) pour aider le navigateur à choisir l'image appropriée.

  #### Syntaxe

  ````html
  <source srcset="small.jpg 400w, medium.jpg 800w, large.jpg 1200w"
          sizes="(max-width: 600px) 400px,
                 (max-width: 900px) 800px,
                 1200px">
  ````

- <u>*width et height :*</u>
  Définissent les dimensions intrinsèques de l'image.
  Utiles pour éviter le reflow et améliorer les performances.

  #### Exemple

  ````html
  <source srcset="image.webp"
          type="image/webp"
          width="800"
          height="600">
  ````

## Cas d'usage courants

### 1. Fourniture de formats modernes avec fallback

Le cas d'usage le plus courant : servir des formats modernes optimisés (AVIF, WebP) aux navigateurs qui les supportent, avec un fallback JPEG/PNG pour les anciens navigateurs.

````html
<picture>
    <!-- Format AVIF : meilleure compression, mais support limité -->
    <source srcset="photo.avif" type="image/avif">
    <!-- Format WebP : bonne compression, bon support -->
    <source srcset="photo.webp" type="image/webp">
    <!-- Format JPEG : fallback universel -->
    <img src="photo.jpg" alt="Photo de paysage montagneux" loading="lazy">
</picture>
````

### 2. Images responsive selon la taille de l'écran

Servir différentes versions d'une image selon la largeur de la fenêtre pour optimiser la bande passante et le temps de chargement.

````html
<picture>
    <source media="(min-width: 1200px)"
            srcset="desktop-1920.jpg 1920w,
                    desktop-2560.jpg 2560w"
            sizes="100vw">
    <source media="(min-width: 768px)"
            srcset="tablet-768.jpg 768w,
                    tablet-1024.jpg 1024w"
            sizes="100vw">
    <source srcset="mobile-320.jpg 320w,
                    mobile-480.jpg 480w,
                    mobile-640.jpg 640w"
            sizes="100vw">
    <img src="mobile-640.jpg"
         alt="Vue panoramique de la ville"
         loading="lazy">
</picture>
````

### 3. Art Direction (images différentes selon le contexte)

Afficher des compositions d'image différentes selon le format d'écran. Par exemple, un recadrage différent pour mobile vs desktop.

````html
<picture>
    <!-- Desktop : image large avec contexte complet -->
    <source media="(min-width: 1024px)"
            srcset="banner-desktop-wide.jpg">
    <!-- Tablette : image moyennement recadrée -->
    <source media="(min-width: 768px)"
            srcset="banner-tablet-cropped.jpg">
    <!-- Mobile : image fortement recadrée, centrée sur le sujet -->
    <img src="banner-mobile-tight.jpg"
         alt="Portrait du chef d'équipe">
</picture>
````

### 4. Support des écrans haute densité (Retina)

Fournir des images en résolution standard et haute définition.

````html
<picture>
    <source srcset="product-1x.jpg 1x,
                    product-2x.jpg 2x,
                    product-3x.jpg 3x"
            type="image/jpeg">
    <img src="product-1x.jpg"
         alt="Produit en détail"
         width="400"
         height="300">
</picture>
````

### 5. Images selon l'orientation de l'appareil

````html
<picture>
    <!-- Portrait : image verticale -->
    <source media="(orientation: portrait)"
            srcset="photo-portrait.jpg">
    <!-- Paysage : image horizontale -->
    <source media="(orientation: landscape)"
            srcset="photo-landscape.jpg">
    <img src="photo-default.jpg"
         alt="Photo adaptative">
</picture>
````

## Exemples avancés

### Combinaison complète : formats + responsive + haute densité

````html
<picture>
    <!-- Desktop : AVIF haute résolution -->
    <source media="(min-width: 1200px)"
            srcset="desktop-1x.avif 1x, desktop-2x.avif 2x"
            type="image/avif">
    <!-- Desktop : WebP haute résolution -->
    <source media="(min-width: 1200px)"
            srcset="desktop-1x.webp 1x, desktop-2x.webp 2x"
            type="image/webp">
    <!-- Desktop : JPEG fallback -->
    <source media="(min-width: 1200px)"
            srcset="desktop-1x.jpg 1x, desktop-2x.jpg 2x">
    <!-- Tablette : AVIF -->
    <source media="(min-width: 768px)"
            srcset="tablet-1x.avif 1x, tablet-2x.avif 2x"
            type="image/avif">
    <!-- Tablette : WebP -->
    <source media="(min-width: 768px)"
            srcset="tablet-1x.webp 1x, tablet-2x.webp 2x"
            type="image/webp">
    <!-- Tablette : JPEG fallback -->
    <source media="(min-width: 768px)"
            srcset="tablet-1x.jpg 1x, tablet-2x.jpg 2x">
    <!-- Mobile : AVIF -->
    <source srcset="mobile-1x.avif 1x, mobile-2x.avif 2x"
            type="image/avif">
    <!-- Mobile : WebP -->
    <source srcset="mobile-1x.webp 1x, mobile-2x.webp 2x"
            type="image/webp">
    <!-- Fallback final -->
    <img src="mobile-1x.jpg"
         alt="Image responsive complète"
         width="800"
         height="600"
         loading="lazy">
</picture>
````

### Images avec sizes et srcset détaillés

````html
<picture>
    <source media="(min-width: 1200px)"
            srcset="hero-400.jpg 400w,
                    hero-800.jpg 800w,
                    hero-1200.jpg 1200w,
                    hero-1600.jpg 1600w,
                    hero-2000.jpg 2000w"
            sizes="(max-width: 1400px) 100vw,
                   1400px"
            type="image/jpeg">
    <source media="(min-width: 768px)"
            srcset="hero-400.jpg 400w,
                    hero-800.jpg 800w,
                    hero-1200.jpg 1200w"
            sizes="100vw"
            type="image/jpeg">
    <img src="hero-800.jpg"
         alt="Image héro responsive"
         srcset="hero-400.jpg 400w,
                 hero-800.jpg 800w"
         sizes="100vw"
         loading="eager">
</picture>
````

## Optimisation et performances

### Attribut `loading`

Utilisez le lazy loading pour améliorer les performances :

````html
<picture>
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg"
         alt="Description"
         loading="lazy">
</picture>
````

- `loading="lazy"` : Charge l'image uniquement quand elle est proche du viewport
- `loading="eager"` : Charge l'image immédiatement (par défaut)

### Attributs `width` et `height`

Définissez toujours les dimensions pour éviter le layout shift :

````html
<picture>
    <source srcset="photo.webp" type="image/webp">
    <img src="photo.jpg"
         alt="Description"
         width="800"
         height="600"
         loading="lazy">
</picture>
````

### Attribut `decoding`

````html
<picture>
    <source srcset="large-image.webp" type="image/webp">
    <img src="large-image.jpg"
         alt="Grande image"
         decoding="async"
         loading="lazy">
</picture>
````

- `decoding="async"` : Décode l'image de manière asynchrone
- `decoding="sync"` : Décode l'image de manière synchrone
- `decoding="auto"` : Laisse le navigateur décider (par défaut)

## Différences avec `<img>` seul

| Fonctionnalité          |   `<img>` seul    |          `<picture>` avec `<img>`          |
|:------------------------|:-----------------:|:------------------------------------------:|
| **Formats multiples**   | ❌ Un seul format  | ✅ Plusieurs formats (AVIF, WebP, JPEG...)  |
| **Art direction**       |   ❌ Impossible    |  ✅ Images différentes selon media queries  |
| **srcset simple**       |    ✅ Supporté     |                 ✅ Supporté                 |
| **Media queries**       |       ❌ Non       |                   ✅ Oui                    |
| **Type MIME explicite** |       ❌ Non       |                   ✅ Oui                    |
| **Complexité**          |      Simple       |      Plus complexe mais plus puissant      |

### Quand utiliser `<img>` seul

````html
<!-- Image simple avec srcset pour densité -->
<img src="photo.jpg"
     srcset="photo-1x.jpg 1x,
             photo-2x.jpg 2x"
     alt="Photo simple"
     loading="lazy">
````

### Quand utiliser `<picture>`

````html
<!-- Formats modernes + art direction -->
<picture>
    <source media="(min-width: 768px)"
            srcset="wide.webp"
            type="image/webp">
    <source media="(min-width: 768px)"
            srcset="wide.jpg">
    <source srcset="narrow.webp" type="image/webp">
    <img src="narrow.jpg" alt="Image complexe">
</picture>
````

## Interaction JavaScript

### Détecter quelle source est utilisée

````javascript
const picture = document.querySelector('picture');
const img = picture.querySelector('img');
img.addEventListener('load', function() {
    // currentSrc contient l'URL de l'image réellement chargée
    console.log('Image chargée:', img.currentSrc);
    console.log('Largeur naturelle:', img.naturalWidth);
    console.log('Hauteur naturelle:', img.naturalHeight);
});
````

### Changer dynamiquement les sources

````javascript
function updatePictureSources(pictureElement, sources) {
    // Supprimer les anciennes sources
    const oldSources = pictureElement.querySelectorAll('source');
    oldSources.forEach(source => source.remove());
    // Ajouter les nouvelles sources
    const img = pictureElement.querySelector('img');
    sources.forEach(sourceData => {
        const source = document.createElement('source');
        source.srcset = sourceData.srcset;
        if (sourceData.type) source.type = sourceData.type;
        if (sourceData.media) source.media = sourceData.media;
        pictureElement.insertBefore(source, img);
    });
}
// Exemple d'utilisation
const picture = document.getElementById('myPicture');
updatePictureSources(picture, [
    { srcset: 'new-photo.avif', type: 'image/avif' },
    { srcset: 'new-photo.webp', type: 'image/webp' }
]);
````

### Responsive Image Breakpoints avec JavaScript

````javascript
function getOptimalImageSize() {
    const width = window.innerWidth;
    if (width >= 1200) return 'large';
    if (width >= 768) return 'medium';
    return 'small';
}
// Réagir aux changements de taille
window.addEventListener('resize', debounce(() => {
    const size = getOptimalImageSize();
    console.log('Taille optimale:', size);
}, 250));
function debounce(func, wait) {
    let timeout;
    return function(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), wait);
    };
}
````

## Accessibilité

### Bonnes pratiques

1. **Toujours fournir un `alt` descriptif** sur l'élément ```<img>```
2. **L'attribut `alt` doit décrire l'image**, pas le contexte technique
3. **Utiliser `alt=""` pour images décoratives**
4. **Ne pas mettre `alt` sur les ```<source>```** (seulement sur ```<img>```)

````html
<!-- ✅ Bon exemple -->
<picture>
    <source srcset="team.webp" type="image/webp">
    <img src="team.jpg"
         alt="Équipe de développement réunie autour d'un ordinateur">
</picture>
<!-- ❌ Mauvais exemple -->
<picture>
    <source srcset="team.webp" type="image/webp" alt="Image WebP">
    <img src="team.jpg" alt="team.jpg">
</picture>
````

### Images décoratives

````html
<picture>
    <source srcset="decoration.webp" type="image/webp">
    <img src="decoration.jpg" alt="" role="presentation">
</picture>
````

## Outils et ressources

### Outils de génération d'images

- **[Squoosh](https://squoosh.app/)** : Convertir et optimiser des images
- **[ImageOptim](https://imageoptim.com/)** : Optimisation d'images
- **[Sharp](https://sharp.pixelplumbing.com/)** : Traitement d'images en Node.js
- **[Responsive Image Breakpoints Generator](https://responsivebreakpoints.com/)** : Générer des breakpoints

### Test et validation

- **[Chrome DevTools](https://developer.chrome.com/docs/devtools/)** : Inspecter les images chargées
- **[Lighthouse](https://developers.google.com/web/tools/lighthouse)** : Audit de performance
- **[WebPageTest](https://www.webpagetest.org/)** : Test de performance détaillé

## Ressources complémentaires

- [HTMLPictureElement API](https://developer.mozilla.org/fr/docs/Web/API/HTMLPictureElement)
- [Guide des images responsives](https://developer.mozilla.org/fr/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)
- [Spécification srcset et sizes](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-img-srcset)
- [Guide des formats d'image](https://developer.mozilla.org/fr/docs/Web/Media/Guides/Formats/Image_types)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<picture>`.
