# ***L'élément :***  ```<audio>```

L'élément HTML ```<audio>``` est utilisé afin d'intégrer un contenu sonore dans un document.
Il peut contenir une ou plusieurs sources audio représentées avec l'attribut src ou l'élément```<source>```:
le navigateur choisira celle qui convient le mieux.
Il peut également être la destination de médias diffusés en continu, en utilisant un MediaStream.

## Exemple de syntaxe simple

````html
    <figure>
        <figcaption>Listen to the T.rex:</figcaption>
        <audio controls src="/shared-assets/audio/t-rex-roar.mp3"></audio>
        <a href="/shared-assets/audio/t-rex-roar.mp3"> Download audio </a>
    </figure>
````

L'exemple qui précède illustre le fonctionnement simple d'un élément ```<audio>```.
On inclut un chemin vers la ressource grâce à l'attribut src et on peut ajouter d'autres attributs afin de fournir d'autres informations :
lecture automatique, lecture en boucle, utilisation des contrôles par défaut du navigateur, etc.
Le contenu présent à l'intérieur des balises ``<audio></audio>`` est affiché comme contenu alternatif lorsque le navigateur ne prend pas en charge l'élément.

## ***Les attributs :***

Cet élément inclut les attributs universels.

- **autoplay :**
        *Un attribut booléen :*
S'il est spécifié, l'audio commencera automatiquement la lecture dès qu'il pourra le faire, sans attendre la fin du téléchargement de l'ensemble du fichier audio.

- ### **note :**

  - Les sites qui diffusent automatiquement de l'audio (ou des vidéos avec une piste audio) peuvent s'avérer désagréables pour les utilisateurs et doivent donc être évités dans la mesure du possible.
  - Si vous devez offrir une fonctionnalité de lecture automatique, vous devez la soumettre au choix de l'utilisateur.
  - Cependant, cela peut être utile lors de la création d'éléments médias dont la source sera définie ultérieurement, sous le contrôle de l'utilisateur.
  - Consultez ce [guide sur la lecture automatique](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Autoplay) pour obtenir des informations supplémentaires sur la manière d'utiliser correctement la fonction autoplay.
- **controls :**
    Si l'attribut est présent, le navigateur affichera des contrôles pour que l'utilisateur puisse gérer la lecture, le volume, et le déplacement du curseur de lecture.
  - **crossorigin :**
  Cet attribut à valeur contrainte indique comment le CORS doit être utilisé afin de récupérer la ressource.
    - Les ressources utilisant le CORS peuvent être réutilisées dans un élément ```<canvas>``` sans corrompre celui-ci.
      - Les valeurs autorisées pour cet attribut sont :

      - #### **anonymous :**

      Une requête multi-origine est envoyée sans information d'authentification.
      Autrement dit, l'en-tête HTTP Origin est envoyé sans cookie, certificat X.509 ou sans authentification HTTP.
      Si le serveur ne fournit pas d'information d'authentification au site d'origine (sans indiquer l'en-tête Access-Control-Allow-Origin), la ressource sera corrompue (tainted) et son utilisation sera restreinte.

      - #### **use-credentials :**

      Une requête multi-origine est envoyée avec une information d'authentification.

      #### **C'est-à-dire avec un en-tête HTTP Origin :**

      #### - Elle contient un cookie, un certificat ou effectuant une authentification HTTP

Lorsque cet attribut n'est pas présent, la ressource est récupérée sans requête CORS et empêche ainsi d'utiliser la ressource dans un ```<canvas>```.
Si la valeur fournie est invalide, elle sera considérée comme anonymous. Voir [Paramétrage des attributs relatifs au CORS](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Attributes/crossorigin) pour plus d'informations.
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenté l'élément ``<audio>``.
