# <u>**L'élément :**</u>  ```<object>```

L'élément HTML ```<object>``` représente une ressource externe qui peut être traitée comme une image, un contexte de navigation imbriqué ou une ressource à gérer via un plugin.  
Contrairement à ```<embed>```, cet élément permet de fournir un contenu de repli à l'intérieur de ses balises, qui sera affiché si la ressource ne peut pas être chargée.

### Exemple de syntaxe simple avec une vidéo

````html
    <object data="/shared-assets/videos/flower.mp4"
            type="video/mp4"
            width="640"
            height="480">
        <p>Votre navigateur ne prend pas en charge les vidéos.
           <a href="/shared-assets/videos/flower.mp4">Télécharger la vidéo</a>
        </p>
    </object>
````

### Exemple avec un PDF

````html
    <object data="/documents/guide.pdf"
            type="application/pdf"
            width="100%"
            height="600">
        <p>Impossible d'afficher le PDF.
           <a href="/documents/guide.pdf">Télécharger le document</a>
        </p>
    </object>
````

### Exemple avec une image SVG

````html
    <object data="/images/diagram.svg"
            type="image/svg+xml"
            width="500"
            height="400">
        <img src="/images/diagram-fallback.png" alt="Diagramme">
    </object>
````

## Les attributs

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- <u>*data :*</u>  
  L'adresse (URL) de la ressource.
  Au moins un des attributs `data` ou `type` doit être défini.

  #### Exemples :
- ````html
  <!-- Chemin relatif -->
  <object data="media/video.mp4" type="video/mp4"></object>
  <!-- Chemin absolu -->
  <object data="/HTMLMEDIATUTORIAL/assets/document.pdf" type="application/pdf"></object>
  <!-- URL complète -->
  <object data="https://example.com/content.svg" type="image/svg+xml"></object>
  ````
- <u>*type :*</u>  
  Le type MIME de la ressource spécifiée par `data`.
  Au moins un des attributs `data` ou `type` doit être défini.

  #### Types MIME courants : 
- **Vidéo**

  - `video/mp4` - Vidéo MP4
  - `video/webm` - Vidéo WebM
  - `video/ogg` - Vidéo Ogg
  - **Audio** :
    - `audio/mpeg` - Audio MP3
    - `audio/ogg` - Audio Ogg
    - `audio/wav` - Audio WAV
  - **Documents** :
    - `application/pdf` - Document PDF
    - `text/html` - Page HTML
  - **Images** :
    - `image/svg+xml` - Image SVG
    - `image/png` - Image PNG
    - `image/jpeg` - Image JPEG
- <u>*width :*</u>  
  La largeur de l'affichage de la ressource, en pixels CSS.

  #### Exemples :
````html

  <object data="video.mp4" width="640"></object>
  <object data="document.pdf" width="100%"></object>
  ````
- <u>*height :*</u>  
  La hauteur de l'affichage de la ressource, en pixels CSS.

  #### Exemples :
````html
  <object data="video.mp4" height="480"></object>
  <object data="document.pdf" height="800"></object>
  ````
- <u>*name :*</u>  
  Le nom du contexte de navigation valide (HTML5) ou le nom du contrôle (HTML 4).

  #### Exemple :
````html
  <object data="content.html" name="contentFrame"></object>
  ````
- <u>*form :*</u>  
  L'élément `<form>` auquel l'élément object est associé (son formulaire propriétaire).  
  La valeur de cet attribut doit être l'ID d'un élément ```<form>``` dans le même document.
- <u>*usemap :*</u>  
  Une référence à un élément ```<map>```.  
  La valeur de l'attribut doit être un '#' suivi de la valeur de l'attribut `name` d'un élément ```<map>```.

  #### Exemple :
````html
  <object data="world-map.png" usemap="#worldmap"></object>
  <map name="worldmap">
      <area shape="circle" coords="100,100,50" href="europe.html" alt="Europe">
  </map>
  ````
- <u>*typemustmatch :*</u>
  - *Attribut booléen :*  
    Indique si l'attribut `type` et le type MIME réel de la ressource doivent correspondre pour que la ressource soit utilisée.

## Utilisation avec `<param>`

L'élément ```<param>``` peut être utilisé comme enfant de `<object>` pour passer des paramètres au plugin ou à l'application qui gère le contenu.

### Exemple avec paramètres

````html
<object data="animation.swf"
        type="application/x-shockwave-flash"
        width="400"
        height="300">
    <param name="quality" value="high">
    <param name="bgcolor" value="#ffffff">
    <param name="allowfullscreen" value="true">
    <p>Votre navigateur ne prend pas en charge Flash.</p>
</object>
````

> **Note :**  
> Flash est obsolète et n'est plus supporté par les navigateurs modernes.

## Cas d'usage modernes

### 1. Intégration de documents PDF

````html
<object data="documentation.pdf"
        type="application/pdf"
        width="100%"
        height="800">
    <iframe src="documentation.pdf" width="100%" height="800">
        <p>Impossible d'afficher le PDF.
           <a href="documentation.pdf">Télécharger le document</a>
        </p>
    </iframe>
</object>
````

### 2. SVG interactif avec fallback

````html
<object data="interactive-chart.svg"
        type="image/svg+xml"
        width="800"
        height="600">
    <!-- Fallback en cascade -->
    <object data="interactive-chart.png"
            type="image/png"
            width="800"
            height="600">
        <p>Impossible d'afficher le graphique.
           <a href="interactive-chart.svg">Télécharger le SVG</a> ou
           <a href="interactive-chart.png">Télécharger le PNG</a>
        </p>
    </object>
</object>
````

### 3. Intégration de page HTML externe

````html
<object data="external-content.html"
        type="text/html"
        width="100%"
        height="500">
    <p>Impossible de charger le contenu externe.
       <a href="external-content.html">Voir le contenu</a>
    </p>
</object>
````

### 4. Vidéo avec fallback complet

````html
<object data="presentation.mp4"
        type="video/mp4"
        width="640"
        height="480">
    <!-- Fallback vers video HTML5 -->
    <video controls width="640" height="480">
        <source src="presentation.webm" type="video/webm">
        <source src="presentation.mp4" type="video/mp4">
        <!-- Fallback final -->
        <p>Votre navigateur ne prend pas en charge la vidéo.
           <a href="presentation.mp4">Télécharger la vidéo</a>
        </p>
    </video>
</object>
````

## Différences entre `<object>`, `<embed>` et `<iframe>`

| Caractéristique |  `<object>`  |      `<embed>`       |      `<iframe>`      |
|-----------------|:------------:|:--------------------:|:--------------------:|
| **Balise de fermeture** |     Oui      |         Non          |         Oui          |
| **Contenu de repli** |    Oui ✅     |        Non ❌         |        Oui ✅         |
| **Paramètres (`<param>`)** |    Oui ✅     |        Non ❌         |        Non ❌         |
| **Types de contenu** | Très variés  |        Limité        | HTML principalement  |
| **Sécurité** |   Moyenne    |        Faible        |   Élevée (sandbox)   |
| **Accessibilité** |   Moyenne    |        Faible        |        Bonne         |
| **Support navigateur** |     Bon      |        Limité        |      Excellent       |
| **Standard actuel** |    HTML5     | HTML5 (déconseillé)  |  HTML5 (recommandé)  |

## Quand utiliser `<object>`

### ✅ Cas d'usage appropriés

1. **SVG interactif** nécessitant l'accès au DOM du SVG
2. **Documents PDF** avec fallback approprié
3. **Contenu nécessitant des paramètres** (`<param>`)
4. **Fallback en cascade** (plusieurs niveaux de repli)
5. **Types de médias variés** avec gestion d'erreur

### ❌ Éviter `<object>` pour

1. **Vidéos simples** → Utilisez ```<video>```
2. **Audio simple** → Utilisez ```<audio>```
3. **Images standards** → Utilisez ```<img>``` ou ```<picture>```
4. **Pages web externes** → Utilisez ```<iframe>```
5. **Plugins obsolètes** (Flash, Silverlight) → Cherchez des alternatives modernes

## Exemples pratiques

### Exemple 1 : Galerie d'images avec fallback

````html
<figure>
    <object data="gallery/photo-hd.jpg"
            type="image/jpeg"
            width="800"
            height="600">
        <img src="gallery/photo-sd.jpg"
             alt="Photo de paysage"
             width="800"
             height="600">
    </object>
    <figcaption>Magnifique paysage de montagne</figcaption>
</figure>
````

### Exemple 2 : Carte interactive

````html
<object data="maps/world-map.svg"
        type="image/svg+xml"
        width="1000"
        height="600"
        aria-label="Carte mondiale interactive">
    <img src="maps/world-map-static.png"
         alt="Carte du monde"
         width="1000"
         height="600">
</object>
````

### Exemple 3 : Widget externe

````html
<div class="widget-container">
    <object data="widgets/calculator.html"
            type="text/html"
            width="400"
            height="500">
        <p>Le widget calculatrice n'est pas disponible.
           <a href="widgets/calculator.html">Ouvrir dans une nouvelle fenêtre</a>
        </p>
    </object>
</div>
````

## Interaction JavaScript

### Accéder au contenu d'un object

````javascript
// Récupérer l'élément object
const objectElement = document.querySelector('object');
// Accéder au document du contenu (pour HTML ou SVG)
objectElement.addEventListener('load', function() {
    const objectDoc = objectElement.contentDocument;
    if (objectDoc) {
        // Manipuler le contenu
        const svgElement = objectDoc.querySelector('svg');
        console.log('SVG chargé:', svgElement);
    }
});
// Gérer les erreurs de chargement
objectElement.addEventListener('error', function() {
    console.error('Erreur de chargement de la ressource');
    // Afficher le contenu de fallback
});
````

### Vérifier si la ressource est chargée

````javascript
const obj = document.getElementById('myObject');
// Méthode 1 : Événement load
obj.addEventListener('load', () => {
    console.log('Ressource chargée avec succès');
});
// Méthode 2 : Vérifier le contentDocument
if (obj.contentDocument) {
    console.log('Document accessible');
} else {
    console.log('Document non accessible ou non chargé');
}
````

### Communication avec un SVG intégré

````javascript
// Dans le document parent
const svgObject = document.getElementById('svgObject');
svgObject.addEventListener('load', function() {
    const svgDoc = svgObject.contentDocument;
    const circle = svgDoc.getElementById('myCircle');
    // Modifier le SVG
    circle.setAttribute('fill', 'red');
    circle.setAttribute('r', '50');
    // Ajouter un événement
    circle.addEventListener('click', function() {
        alert('Cercle cliqué !');
    });
});
````

## Sécurité et bonnes pratiques

### Sécurité

1. **Validation du type MIME** : Toujours spécifier l'attribut `type`
2. **Sources fiables** : N'intégrez que des ressources de sources vérifiées
3. **HTTPS** : Utilisez HTTPS pour les ressources externes
4. **CSP (Content Security Policy)** : Configurez correctement votre politique de sécurité

````html
<!-- ❌ Non sécurisé -->
<object data="http://site-non-fiable.com/content.swf"></object>
<!-- ✅ Sécurisé -->
<object data="https://site-verifie.com/content.svg"
        type="image/svg+xml">
    <img src="fallback.png" alt="Contenu alternatif">
</object>
````

### Bonnes pratiques

1. **Toujours fournir un fallback** significatif
2. **Spécifier width et height** pour éviter le reflow
3. **Utiliser des types MIME appropriés**
4. **Tester l'accessibilité** avec des lecteurs d'écran
5. **Vérifier la compatibilité navigateur**

````html
<!-- Exemple de bonnes pratiques -->
<object data="content.pdf"
        type="application/pdf"
        width="800"
        height="600"
        aria-label="Document de présentation">
    <iframe src="content.pdf" width="800" height="600">
        <p>Votre navigateur ne peut pas afficher ce PDF.
           <a href="content.pdf" download>Télécharger le PDF (2.5 MB)</a>
        </p>
    </iframe>
</object>
````

## Accessibilité

### Améliorer l'accessibilité

````html
<object data="diagram.svg"
        type="image/svg+xml"
        width="600"
        height="400"
        role="img"
        aria-label="Diagramme des processus métier">
    <img src="diagram-description.png"
         alt="Diagramme montrant les 5 étapes du processus:
              1. Planification, 2. Développement, 3. Test,
              4. Déploiement, 5. Maintenance">
</object>
````

### Points clés pour l'accessibilité

1. **Utiliser `aria-label`** ou `aria-labelledby` pour décrire le contenu
2. **Fournir un texte alternatif** dans le fallback
3. **S'assurer que le contenu est navigable au clavier**
4. **Tester avec les lecteurs d'écran**
5. **Éviter le contenu clignotant** qui pourrait causer des crises

## Compatibilité navigateur

L'élément `<object>` est bien supporté dans tous les navigateurs modernes, mais :

- Le support des types MIME varie selon les navigateurs
- Certains plugins nécessaires peuvent ne pas être installés
- Le comportement du fallback peut différer
- L'accès à `contentDocument` peut être restreint pour des raisons de sécurité (CORS)

### Test de compatibilité

````javascript
function testObjectSupport() {
    const obj = document.createElement('object');
    obj.data = 'test.svg';
    obj.type = 'image/svg+xml';
    obj.addEventListener('load', () => {
        console.log('✅ Object supporté et chargé');
    });
    obj.addEventListener('error', () => {
        console.log('❌ Erreur de chargement');
    });
}
````

## Ressources complémentaires

- [HTMLObjectElement API](https://developer.mozilla.org/fr/docs/Web/API/HTMLObjectElement)
- [Élément `<param>`](https://developer.mozilla.org/fr/docs/Web/HTML/Element/param)
- [Guide des types MIME](https://developer.mozilla.org/fr/docs/Web/HTTP/Basics_of_HTTP/MIME_types)
- [Politique de sécurité du contenu (CSP)](https://developer.mozilla.org/fr/docs/Web/HTTP/CSP)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<object>`.
