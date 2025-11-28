# L'élément `<track>`

L'élément HTML ```<track>``` est utilisé comme élément fils d'un élément ```<audio>``` ou ```<video>```.  
Il permet de fournir des pistes textuelles temporisées (ou données basées sur le temps) telles que des sous-titres, des légendes descriptives ou des chapitres.  
Les pistes sont formatées au format WebVTT (Web Video Text Tracks nomDuFichier.vtt).

## Exemple de syntaxe simple

````html
    <video controls width="250">
        <source src="/shared-assets/videos/friday.mp4" type="video/mp4" />
        <track default kind="captions" srclang="fr" src="/shared-assets/tracks/friday-fr.vtt" />
        <track kind="subtitles" srclang="en" src="/shared-assets/tracks/friday-en.vtt" />
        Votre navigateur ne prend pas en charge la balise vidéo.
    </video>
````

L'exemple précédent montre comment ajouter des pistes de sous-titres à une vidéo.  
L'attribut `default` indique quelle piste doit être utilisée par défaut si l'utilisateur n'en sélectionne pas une autre.

## Les attributs

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- **default :**  
  *Un attribut booléen :*  
  Cet attribut indique que cette piste doit être activée par défaut sauf si les préférences de l'utilisateur indiquent qu'une autre piste est plus appropriée.  
  Cet attribut ne peut être utilisé que sur un seul élément `<track>` par élément média.
- **kind :**  
  Cet attribut définit la façon dont la piste textuelle doit être utilisée.  
  Si cet attribut est absent, la valeur par défaut sera `subtitles`.  
  Les valeurs possibles sont :
  - **subtitles**
    Les sous-titres fournissent une traduction du contenu qui ne peut être compris par l'utilisateur.  
    Par exemple, des dialogues en anglais dans un film français pour un public francophone.  
    Les sous-titres peuvent contenir du contenu additionnel, généralement des informations contextuelles.  
    Par exemple, le texte au début d'un film Star Wars ou la date et le lieu d'une scène.  
  - **captions**
    Les légendes fournissent une transcription et éventuellement une traduction de l'audio.  
    Cela peut inclure des informations non-verbales importantes telles que des indications musicales ou des effets sonores.  
    Elles peuvent indiquer la source du son (par exemple : musique, personnage, etc.).  
    Approprié pour les utilisateurs sourds ou malentendants ou lorsque le son est coupé.  
  - **descriptions**
    Description textuelle du contenu vidéo.  
    Approprié pour les utilisateurs aveugles ou lorsque la vidéo ne peut être vue.  
  - **chapters**
    Les titres de chapitres sont destinés à être utilisés lorsque l'utilisateur navigue dans la ressource média.  
  - **metadata**
    Pistes utilisées par les scripts. Non visibles pour l'utilisateur.  
  Un titre lisible pour la piste qui est utilisé par le navigateur lors de l'affichage de la liste des pistes disponibles.  
- **src :**  
  L'adresse (URL) de la piste (fichier `.vtt`).  
  Cet attribut doit être une URL valide et est obligatoire.  
  Son URL doit avoir la même origine que le document, sauf si l'élément parent ```<audio>``` ou ```<video>``` de l'élément `<track>` a un attribut `crossorigin`.  
- **srclang :**  
  La langue des données textuelles de la piste.  
  Ce doit être une balise de langue BCP 47 valide.  
  Si l'attribut `kind` vaut `subtitles`, alors `srclang` doit être défini.  

## Notes d'utilisation

### Types de données dans les pistes

Le type de donnée que `<track>` ajoute au média est défini par l'attribut `kind`, qui peut prendre les valeurs `subtitles`, `captions`, `descriptions`, `chapters` ou `metadata`.  
L'élément pointe vers un fichier source contenant du texte temporisé que le navigateur expose lorsque l'utilisateur demande des données supplémentaires.  
Un élément `<video>` ou `<audio>` ne peut pas avoir plus d'une piste `<track>` avec le même attribut `kind`, `srclang` et `label`.

### Détection du changement de signal

L'objet TextTrack sous-jacent, accessible via `HTMLTrackElement.track`, reçoit un événement `cuechange` chaque fois que le signal actuellement présenté change.  
Cela se produit même si la piste n'est pas associée à un élément média.  
Si la piste est associée à un élément média, en utilisant `<track>` comme élément enfant de ```<audio>``` ou ```<video>```, l'événement `cuechange` est également envoyé à l'objet HTMLTrackElement.

````javascript
    let video = document.querySelector('video');
    let track = video.querySelector('track');
    track.addEventListener('cuechange', () => {
        let cue = track.track.activeCues[0];
        if (cue) {
            console.log(cue.text);
        }
    });
````

## Format WebVTT

Les fichiers WebVTT (Web Video Text Tracks) ont l'extension `.vtt` et contiennent les sous-titres ou autres textes temporisés.

### Exemple de fichier WebVTT

````
WEBVTT
00:00:00.000 --> 00:00:03.000
Ceci est le premier sous-titre.

00:00:03.500 --> 00:00:07.000
Ceci est le deuxième sous-titre.

00:00:08.000 --> 00:00:12.000
Et voici le troisième !
````

### Structure d'un fichier WebVTT
1. La première ligne doit être `WEBVTT`
2. Ensuite, chaque sous-titre suit ce format :
   - Horodatage de début --> Horodatage de fin
   - Texte du sous-titre
   - Ligne vide pour séparer les sous-titres

### Fonctionnalités avancées WebVTT

````
WEBVTT
NOTE:
Ceci est un commentaire qui n'apparaîtra pas
00:00:00.000 --> 00:00:03.000 position:50% align:middle
<v Speaker>Texte avec le nom du locuteur

00:00:03.500 --> 00:00:07.000
Texte avec <i>italique</i> et <b>gras</b>

00:00:08.000 --> 00:00:12.000
Texte avec <c.className>style CSS personnalisé</c>
````

## Accessibilité

Les sous-titres et transcriptions doivent fournir un équivalent textuel pour le contenu audio.  
Ils doivent non seulement inclure les dialogues, mais aussi identifier les locuteurs et décrire les informations significatives non verbales, y compris les effets sonores ou autres indices audio importants.  
Les pistes `<track>` améliorent considérablement l'accessibilité web pour :

- Les personnes sourdes ou malentendantes
- Les personnes qui apprennent une langue
- Les utilisateurs qui préfèrent ou nécessitent des sous-titres
- Les environnements où le son ne peut pas être utilisé

## Ressources complémentaires

- [Spécification WebVTT](https://www.w3.org/TR/webvtt1/)
- [Guide des sous-titres et légendes pour HTML5](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video)
- [TextTrack API](https://developer.mozilla.org/fr/docs/Web/API/TextTrack)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<track>`.
