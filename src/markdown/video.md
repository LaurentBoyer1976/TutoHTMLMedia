# L'élément `<video>`

L'élément HTML ```<video>``` intègre un lecteur de média qui prend en charge la lecture vidéo dans le document.
Vous pouvez également utiliser ```<video>``` pour le contenu audio.
Cependant l'élément [audio](audio.md) peut fournir une expérience utilisateur plus appropriée.

## Exemple de syntaxe simple

````html
    <video controls width="250">
    <source src="/shared-assets/videos/flower.webm" type="video/webm" />
    <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
    Télécharger la vidéo
    <a href="/shared-assets/videos/flower.webm">WEBM</a>
    ou
    <a href="/shared-assets/videos/flower.mp4">MP4</a>
    .
</video>
````

L'exemple précédent illustre comment utiliser l'élément ```<video>``` simplement, à la façon d'un élément ```<img>```.
Le chemin vers le média à afficher est fourni via l'attribut ***src***.
On peut inclure d'autres attributs afin de spécifier la largeur et la hauteur, la lecture automatique et/ou en boucle, les contrôles affichés, etc.
Le contenu fourni entre les balises ```<video></video>``` est affiché comme contenu alternatif par les navigateurs qui ne prennent pas en charge l'élément.

## Les attributs

À l'instar des autres éléments HTML, cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- **autoplay**
  Un attribut booléen qui indique que la vidéo doit automatiquement être lancée dès qu'elle peut être jouée sans être arrêtée par le chargement des données.
  > **Note :** Les navigateurs modernes bloquent l'audio (ou les vidéos avec une piste audio non assurée) de la lecture automatique. Les sites qui jouent automatiquement l'audio peuvent être une expérience désagréable pour les utilisateurs. Consultez notre [guide sur la lecture automatique](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Autoplay) pour plus d'informations.
Pour désactiver la vidéo automatique, autoplay="false" ne fonctionnera pas.
La vidéo sera automatiquement lue si l'attribut est présent dans le tag ```<video>```.
Pour supprimer la lecture automatique, l'attribut doit être complètement supprimé.
- **controls :**
- **controls**
  Si cet attribut est présent, le navigateur affichera des contrôles pour permettre à l'utilisateur de contrôler la lecture de la vidéo, le volume et la mise sur pause.
    L'attribut controlslist, lorsqu'il est indiqué, aide le navigateur à choisir les contrôles à afficher pour la manipulation du média lorsque l'attribut controls est utilisé.
    Les valeurs autorisées pour cet attribut sont nodownload, nofullscreen et noremoteplayback.
    On utilisera l'attribut disablePictureInPicture afin de désactiver ce mode et les contrôles associés.
- **crossorigin :**
      Cet attribut à valeur contrainte indique comment le CORS doit être utilisé afin de récupérer la ressource.
        - Les ressources utilisant le CORS peuvent être réutilisées dans un élément ```<canvas>``` sans corrompre celui-ci.
            - Les valeurs autorisées pour cet attribut sont :

  - ### **anonymous :**

    Une requête multi-origine est envoyée sans information d'authentification.
    Autrement dit, l'en-tête HTTP Origin est envoyé sans cookie, certificat X.509 ou sans authentification HTTP.
    Si le serveur ne fournit pas d'information d'authentification au site d'origine (sans indiquer l'en-tête Access-Control-Allow-Origin), la ressource sera corrompue (tainted) et son utilisation sera restreinte.

    - ### **use-credentials :**

    #### Une requête multi-origine est envoyée avec une information d'authentification

    #### **C'est-à-dire avec un en-tête HTTP Origin :**

    #### - Elle contient un cookie, un certificat ou effectuant une authentification HTTP

    #### - Si le serveur ne fournit pas d'informations d'authentification au site d'origine (c'est-à-dire en n'envoyant pas l'en-tête HTTP Access-Control-Allow-Credentials :, la vidéo sera corrompue et son utilisation sera restreinte

Lorsque cet attribut n'est pas présent, la ressource est récupérée sans requête CORS et empêche ainsi d'utiliser la ressource dans un ```<canvas>```.
Si la valeur fournie est invalide, elle sera considérée comme anonymous. Voir [Paramétrage des attributs relatifs au CORS](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Attributes/crossorigin) pour plus d'informations.

- **disablepictureinpicture :**

  Empêche le navigateur de suggérer un menu contextuel pour la superposition d'une image/vidéo ("Picture-in-picture") ou de demander l'activation automatique pour la superposition du média.
- **disableremoteplayback**
  Un attribut booléen utilisé pour désactiver la capacité de lecture à distance dans les appareils qui sont attachés à l'aide de technologies câblées (HDMI, DVI, etc.) et sans fil (Miracast, Chromecast, DLNA, AirPlay, etc.).
- **height**
  La hauteur de la zone où afficher la vidéo, exprimée en pixels CSS (en valeur absolue uniquement ; pas de pourcentages).
- **loop**
  Un attribut booléen, qui, lorsqu'il est présent, indique que la vidéo doit être jouée en boucle.
- **muted**
  Un attribut booléen qui indique s'il faut couper le son contenu dans la vidéo. Si cet attribut est utilisé, le son sera coupé au lancement de la vidéo. Sa valeur par défaut est false, ce qui signifie que l'audio sera lu lorsque la vidéo sera lue.
- **playsinline**
  Un attribut booléen qui indique que la vidéo doit être jouée en incise, c'est-à-dire au sein de la zone de lecture de l'élément.
  > **Note :** L'absence de cet attribut n'implique pas que la vidéo sera lancée en plein écran.
- **poster**
  Une URL qui contient une vignette à afficher tant que la vidéo est en cours de téléchargement. Si cet attribut n'est pas utilisé, rien n'est affiché jusqu'à ce que la première image de la vidéo soit disponible, ensuite, c'est cette image qui est affichée comme vignette sur la vidéo.
- **preload**
  Cet attribut à valeur contrainte est une indication destinée au navigateur sur la meilleure façon de charger la vidéo. Il peut prendre l'une des valeurs suivantes :
  - `none` - la vidéo ne doit pas être préchargée
  - `metadata` - seules les métadonnées de la vidéo (sa durée par exemple) sont récupérées
  - `auto` - le fichier entier peut être téléchargé, même si l'utilisateur ne s'en sert pas
  - `""` (chaîne vide) synonyme de la valeur auto
  La valeur par défaut peut être différente selon le navigateur. La spécification conseille d'utiliser la valeur metadata.
  > **Note :** L'attribut `autoplay` a la priorité sur `preload`. Si `autoplay` est défini, le navigateur doit nécessairement télécharger la vidéo pour la lancer. Cet attribut est simplement une indication, la spécification ne force pas le navigateur à respecter la valeur de cet attribut.
- **src**
  L'URL de la vidéo à intégrer. Cet attribut est optionnel, l'élément ```<source>``` peut également être utilisé dans l'élément ```<video>``` afin d'indiquer la vidéo à intégrer.
- **width**
  La largeur de la zone où afficher la vidéo, exprimée en pixels CSS (en valeur absolue uniquement ; pas de pourcentages).

## Événements

|  Nom de l'évènement   | Condition de déclenchement                                                                                                                                                                              |
|:---------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        canplay        | Le navigateur peut lire le média mais estime que trop peu de données ont été chargées pour lire le média jusqu'à sa fin (il faudra vraisemblablement un arrêt pour un chargement en mémoire tampon).    |
|    canplaythrough     | Le navigateur estime qu'il peut lire le média jusqu'à sa fin, sans avoir à interrompre la lecture par du chargement en mémoire tampon.                                                                  |
|       complete        | Le rendu d'un OfflineAudioContext est terminé.                                                                                                                                                          |
|    durationchange     | L'attribut duration a été mis à jour.                                                                                                                                                                   |
|        emptied        | Le média est devenu vide. Cela peut par exemple se produire lorsque le média a déjà été (partiellement ou complètement) chargé et que la méthode load() est invoquée pour le recharger.                 |
|         ended         | La lecture a été interrompue, car la fin du média est atteinte.                                                                                                                                         |
|         error         | Une erreur s'est produite lors de la récupération des données, ou le type de ressource n'est pas un format pris en charge.                                                                              |
|      loadeddata       | La première *frame* du média a été chargée.                                                                                                                                                             |
|    loadedmetadata     | Les métadonnées ont été chargées.                                                                                                                                                                       |
|       loadstart       | Le navigateur a commencé à charger la ressource.                                                                                                                                                        |
|         pause         | La lecture a été mise en pause.                                                                                                                                                                         |
|         play          | La lecture a démarré.                                                                                                                                                                                   |
|        playing        | La lecture est prête à être lancée après avoir été mise en pause ou interrompue pour un chargement en mémoire de données.                                                                               |
|       progress        | Évènement déclenché périodiquement lorsque le navigateur charge une ressource.                                                                                                                          |
|      ratechange       | La vitesse de lecture a changé.                                                                                                                                                                         |
|        seeked         | Une opération de déplacement du curseur de lecture (seek) est terminée.                                                                                                                                 |
|        seeking        | Une opération de déplacement du curseur de lecture (seek) a commencé.                                                                                                                                   |
|        stalled        | L'agent utilisateur tente de récupérer les données associées au média mais les données ne parviennent pas.                                                                                              |
|        suspend        | Le chargement des données du média ont été suspendues.                                                                                                                                                  |
|      timeupdate       | Le temps décrit par l'attribut currentTime a été mis à jour.                                                                                                                                            |
|     volumechange      | Le volume a été modifié.                                                                                                                                                                                |
|        waiting        | La lecture a été interrompue en raison d'un manque temporaire de données.                                                                                                                               |

## >**Notes d'utilisation :**

Les navigateurs ne prennent pas en charge l'ensemble des formats vidéo.
Vous pouvez fournir plusieurs sources grâce à des éléments ```<source>```.
Le navigateur utilisera la première ressource dont il connaît le format :

````html
        <video controls>
            <source src="maVideo.mp4" type="video/mp4" />
## Notes d'utilisation
Les navigateurs ne prennent pas en charge l'ensemble des formats vidéo.
                Votre navigateur ne prend pas en charge les vidéos HTML5. Voici
                <a href="myVideo.mp4">un lien pour télécharger la vidéo</a>.
            </p>
        </video>
````

Lorsque vous utilisez des éléments ```<source>```, le navigateur tente de charger chaque source séquentiellement.
Si une source échoue (par exemple, en raison d'une URL non valide ou d'un format non pris en charge), la source suivante est tentée, etc.
Un événement error se déclenche sur l'élément ```<video>``` après que toutes les sources ont échoué ; Les événements error ne sont pas déclenchés sur chaque élément individuel ```<source>```.
Nous proposons un [guide des types de fichiers médias substantiels et approfondi](https://developer.mozilla.org/fr/docs/Web/Media/Guides/Formats), le [guide des codecs pris en charge pour la vidéo](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats/Video_codecs).
Il y a également un [guide disponible pour les codecs audio](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats/Audio_codecs) qui peuvent être utilisés avec eux.

#### >**Quelques notes d'utilisation :**

Si l'attribut controls n'est pas indiqué, la vidéo n'incluera pas les contrôles par défaut du navigateur.
Il est nécessaire de fournir ses propres contrôles en utilisant JavaScript et [l'API HTMLMediaElement](https://developer.mozilla.org/fr/docs/Web/API/HTMLMediaElement).
[Voir l'article créer un lecteur vidéo multi-navigateurs](https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player) pour plus de détails.
L'API HTMLMediaElement déclenche de nombreux évènements qui permettent d'avoir un contrôle précis sur l'audio et la vidéo.

### Quelques notes d'utilisation

Si l'attribut controls n'est pas indiqué, la vidéo n'incluera pas les contrôles par défaut du navigateur. (S/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video) pour plus d'informations.
Vous pouvez lire des fichiers audio à l'aide d'un élément ```<video>```.
Cela peut être utile si, par exemple, vous devez effectuer un audio avec une transcription WebVTT, puisque l'élément ```<audio>``` n'autorise pas les transcriptions à l'aide de WebVTT.
Pour tester le contenu similaire sur les navigateurs qui prennent en charge l'élément, vous pouvez remplacer <video> par un élément inexistant comme ```<notavideo>``` (pas une vidéo, en français).
Pour apprendre les bases concernant ```<video>```, nous vous conseillons de consulter [le tutoriel sur le contenu audio et video](https://developer.mozilla.org/fr/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio).
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenté l'élément ``<audio>``. Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<video>`.
