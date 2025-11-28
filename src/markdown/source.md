# L'élément `<source>`

L'élément HTML ```<source>``` spécifie plusieurs ressources médias pour les éléments ```<picture>```, ```<audio>``` ou ```<video>```.
C'est un élément vide, ce qui signifie qu'il n'a pas de contenu et n'a pas de balise de fermeture.
Il est couramment utilisé pour offrir le même contenu média dans plusieurs formats pris en charge par différents navigateurs.

## Exemple de syntaxe simple avec `<video>`

````html
    <video controls width="250">
        <source src="/shared-assets/videos/flower.webm" type="video/webm" />
        <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
        Votre navigateur ne prend pas en charge la balise vidéo.
    </video>
````

## Exemple de syntaxe avec `<audio>`

````html
    <audio controls>
        <source src="/shared-assets/audio/music.opus" type="audio/opus" />
        <source src="/shared-assets/audio/music.ogg" type="audio/ogg" />
        <source src="/shared-assets/audio/music.mp3" type="audio/mpeg" />
        Votre navigateur ne prend pas en charge l'élément audio.
    </audio>
````

## Exemple de syntaxe avec `<picture>`

````html
    <picture>
        <source srcset="/shared-assets/images/photo.avif" type="image/avif" />
        <source srcset="/shared-assets/images/photo.webp" type="image/webp" />
        <img src="/shared-assets/images/photo.jpg" alt="Description de la photo" />
    </picture>
````

Le navigateur parcourt les éléments `<source>` dans l'ordre et utilise le premier dont il peut décoder le format.

## Les attributs

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- **type :**
  Le type MIME de la ressource, éventuellement accompagné d'un paramètre `codecs`.
  Consultez le [RFC 4281](https://tools.ietf.org/html/rfc4281) pour plus d'informations sur la façon de spécifier les codecs.

  #### Exemples de types MIME courants :
- **Vidéo**

  - `video/mp4` - Vidéo MP4
  - `video/webm` - Vidéo WebM
  - `video/ogg` - Vidéo Ogg
- **Audio**

  - `audio/mpeg` - Audio MP3
  - `audio/ogg` - Audio Ogg
  - `audio/wav` - Audio WAV
  - `audio/webm` - Audio WebM
- **Images** (pour `<picture>`) :
  - `image/avif` - Format AVIF
  - `image/webp` - Format WebP
  - `image/jpeg` - Format JPEG

- **src :**  
  *Requis pour les éléments ```<audio>``` et ```<video>``` :*  
  L'URL de la ressource média.  
  La valeur de cet attribut est ignorée lorsque l'élément `<source>` est placé à l'intérieur d'un élément ```<picture>```.

- **srcset :**  
  *Requis pour l'élément ```<picture>```, non autorisé pour ```<audio>``` et ```<video>``` :*  
  Une liste d'une ou plusieurs chaînes de caractères séparées par des virgules indiquant un ensemble de sources d'images possibles pour que le navigateur les utilise.  
  Chaque chaîne est composée de :  
  1. Une URL vers une image
  2. Optionnellement, un espace suivi d'un descripteur de largeur (par exemple : `300w`) ou un descripteur de densité de pixels (par exemple : `2x`)

  #### Exemple :
````html
  <source srcset="photo-320w.jpg 320w,
                  photo-640w.jpg 640w,
                  photo-1280w.jpg 1280w"
          sizes="(max-width: 320px) 280px,
                 (max-width: 640px) 600px,
                 1200px">
  ````

- **sizes :**  
  *Uniquement pour ```<picture>``` :*  
  Une liste de tailles d'images sources séparées par des virgules.  
  Chaque taille d'image source consiste en :  
  1. Une condition média (optionnelle) 
     - Par exemple : `(max-width: 600px)`
  2. Une valeur de largeur d'emplacement de source - Par exemple : `200px`, `50vw`
  Cet attribut affecte la taille de l'image seulement lorsque l'élément `<source>` est le descendant direct d'un élément ```<picture>```.

- **media :**  
  *Uniquement pour ```<picture>``` :*  
  Requête média décrivant les conditions pour lesquelles cette source doit être utilisée.  
  Cet attribut n'a du sens que dans un élément ```<picture>```.  

  #### Exemple :
````html
  <picture>
      <source media="(min-width: 800px)" srcset="large.jpg">
      <source media="(min-width: 400px)" srcset="medium.jpg">
      <img src="small.jpg" alt="Description">
  </picture>
  ````

- **width :**  
  *Uniquement pour ```<picture>``` :*  
  La largeur intrinsèque de l'image en pixels.  
  Doit être un nombre entier sans unité.  

- **height :**  
  *Uniquement pour ```<picture>``` :*  
  La hauteur intrinsèque de l'image en pixels.
  Doit être un nombre entier sans unité.

## Notes d'utilisation

### Ordre de priorité

Le navigateur traite les éléments `<source>` dans l'ordre où ils apparaissent dans le code.  
Il utilise le premier qu'il peut décoder avec succès.

C'est pourquoi il est recommandé de :  
1. Placer les formats modernes et optimisés en premier (WebP, AVIF, WebM, etc.)
2. Placer les formats de secours largement supportés à la fin (JPEG, PNG, MP4, etc.)

### Avec `<video>` et `<audio>`

Lorsqu'il est utilisé avec ```<video>``` ou ```<audio>```, l'élément `<source>` permet de fournir plusieurs formats de la même vidéo/audio.  
Le navigateur choisira le premier format qu'il prend en charge.

````html
<video controls>
    <!-- Format moderne, haute qualité -->
    <source src="video.av1.mp4" type="video/mp4; codecs=av01.0.05M.08">
    <!-- Format WebM avec VP9 -->
    <source src="video.webm" type="video/webm; codecs=vp9">
    <!-- Format MP4 H.264 - Large compatibilité -->
    <source src="video.h264.mp4" type="video/mp4; codecs=avc1.4D401E">
    <!-- Message de repli -->
    Votre navigateur ne prend pas en charge la lecture vidéo HTML5.
</video>
````

### Avec `<picture>`

Avec ```<picture>```, `<source>` permet de fournir différentes versions d'une image selon :

- Le format d'image (AVIF, WebP, JPEG...)
- La résolution de l'écran
- La taille de la fenêtre de visualisation
- L'orientation de l'écran

````html
<picture>
    <!-- Format AVIF pour navigateurs compatibles -->
    <source type="image/avif" srcset="photo.avif">
    <!-- Format WebP pour navigateurs compatibles -->
    <source type="image/webp" srcset="photo.webp">
    <!-- JPEG comme format de repli -->
    <img src="photo.jpg" alt="Description" loading="lazy">
</picture>
````

### Spécification des codecs

Pour une meilleure précision et performance, il est recommandé de spécifier les codecs :

````html
<video controls>
    <source src="video.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
    <source src="video.webm" type='video/webm; codecs="vp8, vorbis"'>
</video>
````

## Exemples avancés

### Images responsive avec art direction

````html
<picture>
    <!-- Orientation portrait -->
    <source media="(orientation: portrait)"
            srcset="portrait-photo.jpg">
    <!-- Orientation paysage -->
    <source media="(orientation: landscape)"
            srcset="landscape-photo.jpg">
    <!-- Image par défaut -->
    <img src="default-photo.jpg" alt="Photo responsive">
</picture>
````

### Images haute résolution

````html
<picture>
    <source srcset="photo-2x.jpg 2x,
                    photo-3x.jpg 3x"
            type="image/jpeg">
    <img src="photo-1x.jpg" alt="Photo haute résolution">
</picture>
````

### Audio multi-format avec qualités différentes

````html
<audio controls>
    <source src="podcast-hq.opus" type="audio/opus">
    <source src="podcast-hq.ogg" type="audio/ogg; codecs=vorbis">
    <source src="podcast.mp3" type="audio/mpeg">
    <p>Votre navigateur ne prend pas en charge l'audio HTML5.
       <a href="podcast.mp3">Télécharger le podcast</a>
    </p>
</audio>
````

## Compatibilité et bonnes pratiques

### Tests de format
Pour vérifier si un navigateur prend en charge un format :
````javascript
let video = document.createElement('video');
let canPlayWebM = video.canPlayType('video/webm');
let canPlayMP4 = video.canPlayType('video/mp4');
console.log('WebM: ' + canPlayWebM); // "probably", "maybe", ou ""
console.log('MP4: ' + canPlayMP4);
````

### Recommandations

1. **Toujours fournir un format de repli** largement supporté (MP4 pour vidéo, MP3 pour audio, JPEG/PNG pour images)
2. **Spécifier le type MIME** pour permettre au navigateur de détecter rapidement les formats non supportés
3. **Optimiser les médias** avant de les publier (compression, résolution appropriée)
4. **Tester sur plusieurs navigateurs** pour garantir la compatibilité
5. **Utiliser l'attribut `type`** avec les codecs pour une détection précise

## Accessibilité

Bien que `<source>` lui-même n'ait pas d'implications directes pour l'accessibilité, assurez-vous que :

- L'élément ```<img>``` dans ```<picture>``` a toujours un attribut `alt` descriptif
- Les vidéos et audios ont des sous-titres/transcriptions via ```<track>```
- Un contenu de repli textuel est fourni pour les navigateurs qui ne supportent pas les médias

## Ressources complémentaires

- [Guide des formats et codecs médias](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats)
- [Images responsive](https://developer.mozilla.org/fr/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)
- [API HTMLSourceElement](https://developer.mozilla.org/fr/docs/Web/API/HTMLSourceElement)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<source>`.
