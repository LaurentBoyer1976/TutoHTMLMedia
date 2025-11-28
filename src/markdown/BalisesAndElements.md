# Balises et éléments Média HTML5

HTML5 a introduit plusieurs balises et éléments spécifiques pour la gestion des médias, facilitant l'intégration de contenu audio et vidéo dans les pages web.
Voici un aperçu des principales balises et éléments liés aux médias en HTML5 :

## 1. Balises audio et vidéo

- `<audio>` :
  Cette balise est utilisée pour intégrer du contenu audio.
Elle prend en charge plusieurs formats audio tels que MP3, WAV et Ogg.
Voici un exemple d'utilisation et le lien [vers audio](audio.md) :

```html
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
  <source src="audio.ogg" type="audio/ogg">
  Votre navigateur ne prend pas en charge la balise audio.
</audio>
```

- `<video>` :
Cette balise est utilisée pour intégrer du contenu vidéo.
Elle prend en charge plusieurs formats vidéo tels que MP4, WebM et Ogg.
Voici un exemple d'utilisation et le lien [vers vidéo](video.md) :

```html
<video controls>
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Votre navigateur ne prend pas en charge la balise vidéo.
</video>
```

## 2. Éléments de contrôle

HTML5 fournit également des éléments de contrôle pour les balises audio et vidéo, permettant aux utilisateurs de contrôler la lecture du contenu multimédia. Les attributs `controls` ajoutent des boutons de lecture, de pause et de volume.

## 3. Éléments multimédias supplémentaires

- `<track>` :
Cette balise est utilisée pour ajouter des sous-titres ou des descriptions audio aux vidéos.
Elle est généralement utilisée à l'intérieur de la balise `<video>`.
Voici un exemple et le lien [vers track](track.md) :

```html
<video controls>
  <source src="video.mp4" type="video/mp4">
  <track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
  <track src="subtitles_fr.vtt" kind="subtitles" srclang="fr" label="Français">
  Votre navigateur ne prend pas en charge la balise vidéo.
</video>
```

- `<source>` :
Cette balise est utilisée pour spécifier plusieurs sources de média pour les balises `<audio>` et `<video>`.
Le navigateur choisit automatiquement la source qu'il peut lire.
Ici le lien [vers source](source.md) :

```html
<video controls width="250" height="200" muted>
  <source src="/shared-assets/videos/butterfly.webm" type="video/webm" />
  <source src="/shared-assets/videos/butterfly.mp4" type="video/mp4" />
  Download the
  <a href="/shared-assets/videos/butterfly.webm">WEBM</a>
  or
  <a href="/shared-assets/videos/butterfly.mp4">MP4</a>
  video.
</video>
```

- `<embed>` :
Bien que moins couramment utilisé en HTML5, cette balise permet d'intégrer des médias externes, tels que des fichiers Flash ou des applications Java.
Ici le lien [vers embed](embed.md).

```html
<embed
  type="video/mp4"
  src="/shared-assets/videos/bird.mp4"
  width="250"
  height="200" />
```

- `<object>` :
Cette balise peut également être utilisée pour intégrer des médias, mais elle est plus polyvalente et peut contenir différents types de contenu.
Ici le lien [vers object](object.md).

```html
<object
  type="video/mp4"
  data="/shared-assets/videos/bird.mp4"
  width="250"
  height="200"></object>
```

- `<picture>` :
Cette balise est utilisée pour fournir des images adaptatives, permettant de spécifier différentes sources d'images en fonction des conditions telles que la résolution de l'écran.
Ici le lien [vers picture](picture.md).
- `<source>` (dans `<picture>`) :
Utilisée pour définir différentes sources d'images pour la balise `<picture>`, permettant une meilleure adaptation aux différents appareils et résolutions.
Ici le lien [vers source](source.md).

```html
<picture>
  <source
    srcset="/shared-assets/images/examples/image-portrait.jpg"
    media="(orientation: portrait)" />
  <img src="/shared-assets/images/examples/painted-hand.jpg" alt="" />
</picture>
```

- `<img>` :
Bien que principalement utilisée pour les images, cette balise est essentielle pour afficher des images dans le contexte multimédia.
Ici le lien [vers img](img.md).

```html
<img src="/shared-assets/images/examples/painted-hand.jpg" alt="Main peinte avec des couleurs vives" />
```

- `<canvas>` :
Cette balise permet de dessiner des graphiques dynamiques via JavaScript, souvent utilisée pour des animations ou des visualisations interactives.
Ici le lien [vers canvas](canvas.md).

```html
<canvas id="myCanvas" width="200" height="100"></canvas>
```

- `<svg>` :
Utilisée pour intégrer des graphiques vectoriels scalables, offrant une qualité d'image optimale à toutes les résolutions.
Ici le lien [vers svg](svg.md).

```html
<svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />
</svg>
```

- `<figure>` et `<figcaption>` :
Ces balises sont utilisées pour regrouper des médias (images, vidéos, etc.) avec leurs légendes, améliorant ainsi la sémantique du contenu.
Ici le lien [vers figure](figureFigCaption.md).

```html
<figure>
  <img src="image.jpg" alt="Description de l'image">
  <figcaption>Légende de l'image</figcaption>
</figure>
```

Ces balises et éléments multimédias en HTML5 offrent une grande flexibilité pour intégrer et contrôler le contenu audio et vidéo sur les pages web, améliorant ainsi l'expérience utilisateur.
