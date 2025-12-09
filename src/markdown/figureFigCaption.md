# **Les éléments `<figure>` et `<figcaption>`**

Les éléments HTML ```<figure>``` et ```<figcaption>``` sont utilisés ensemble pour regrouper du contenu multimédia (images, vidéos, diagrammes, extraits de code, etc.) avec une légende associée.
Ils améliorent la **sémantique** du document et l'**accessibilité** en créant une relation explicite entre le contenu et sa description.

## Exemple de syntaxe simple

````html
    <figure>
        <img src="/shared-assets/images/landscape.jpg" alt="Paysage de montagne">
        <figcaption>Vue panoramique des Alpes au lever du soleil</figcaption>
    </figure>

````

### Exemple avec plusieurs images

````html

    <figure>
        <img src="photo1.jpg" alt="Photo 1">
        <img src="photo2.jpg" alt="Photo 2">
        <img src="photo3.jpg" alt="Photo 3">
        <figcaption>Collection de photos de voyage - Été 2024</figcaption>
    </figure>

````

Les éléments ```<figure>``` et ```<figcaption>``` sont idéaux pour :

- Associer des images à leurs légendes
- Regrouper des diagrammes et graphiques avec leurs descriptions
- Présenter des citations avec leur attribution
- Documenter des extraits de code
- Structurer des galeries d'images

## L'élément `<figure>`

### Description

L'élément ```<figure>``` représente un contenu autonome, potentiellement accompagné d'une légende (```<figcaption>```).
Le contenu peut être déplacé ailleurs dans le document sans affecter le flux principal du texte.

### Attributs

Cet élément inclut uniquement [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

### Types de contenu appropriés

````html
<!-- Images -->
<figure>
    <img src="diagram.png" alt="Diagramme">
    <figcaption>Architecture du système</figcaption>
</figure>
<!-- Vidéos -->
<figure>
    <video controls width="640">
        <source src="demo.mp4" type="video/mp4">
    </video>
    <figcaption>Démonstration du produit</figcaption>
</figure>
<!-- Audio -->
<figure>
    <audio controls>
        <source src="podcast.mp3" type="audio/mpeg">
    </audio>
    <figcaption>Épisode 12 : Les bases du HTML</figcaption>
</figure>
<!-- Code -->
<figure>
    <pre><code>function hello() {
    console.log("Hello, World!");
}</code></pre>
    <figcaption>Exemple de fonction JavaScript simple</figcaption>
</figure>
<!-- Citations -->
<figure>
    <blockquote>
        <p>Le web est plus une création sociale que technique.</p>
    </blockquote>
    <figcaption>— Tim Berners-Lee, inventeur du Web</figcaption>
</figure>
<!-- Tableaux -->
<figure>
    <table>
        <tr><th>Année</th><th>Ventes</th></tr>
        <tr><td>2022</td><td>150K</td></tr>
        <tr><td>2023</td><td>180K</td></tr>
    </table>
    <figcaption>Évolution des ventes annuelles</figcaption>
</figure>
````

## L'élément `<figcaption>`

### Description de `<figcaption>`

L'élément ```<figcaption>``` représente la légende ou la description associée au contenu de son parent ```<figure>```.
Il doit être le **premier** ou le **dernier** enfant de l'élément ```<figure>```.

### Attributs de `<figcaption>`

Cet élément inclut uniquement [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

### Position de la légende

````html
<!-- Légende avant le contenu -->
<figure>
    <figcaption>Figure 1 : Architecture du système</figcaption>
    <img src="architecture.png" alt="Diagramme d'architecture">
</figure>
<!-- Légende après le contenu (plus courant) -->
<figure>
    <img src="architecture.png" alt="Diagramme d'architecture">
    <figcaption>Figure 1 : Architecture du système</figcaption>
</figure>
````

## Cas d'usage détaillés

### 1. Image simple avec légende

````html

<figure>
    <img src="sunset.jpg"
         alt="Coucher de soleil sur l'océan"
         width="800"
         height="600">
    <figcaption>
        Coucher de soleil sur la côte bretonne, juillet 2024.
        Photo par Jean Dupont.
    </figcaption>
</figure>
````

### 2. Image responsive avec légende

````html
<figure>
    <picture>
        <source srcset="landscape-large.webp"
                type="image/webp"
                media="(min-width: 1200px)">
        <source srcset="landscape-medium.webp"
                type="image/webp"
                media="(min-width: 768px)">
        <img src="landscape-small.jpg"
             alt="Paysage de montagne"
             loading="lazy">
    </picture>
    <figcaption>
        Les sommets enneigés des Pyrénées vus depuis le col du Tourmalet
    </figcaption>
</figure>
````

### 3. Galerie d'images

````html
<figure>
    <div class="gallery">
        <img src="photo1.jpg" alt="Photo 1 de la série">
        <img src="photo2.jpg" alt="Photo 2 de la série">
        <img src="photo3.jpg" alt="Photo 3 de la série">
        <img src="photo4.jpg" alt="Photo 4 de la série">
    </div>
    <figcaption>
        Série photographique "Saisons" : Automne en forêt
    </figcaption>
</figure>
<style>
.gallery {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 10px;
}
.gallery img {
    width: 100%;
    height: auto;
    object-fit: cover;
}
</style>
````

### 4. Vidéo avec légende et description

````html
<figure>
    <video controls width="800" poster="thumbnail.jpg">
        <source src="tutorial.mp4" type="video/mp4">
        <source src="tutorial.webm" type="video/webm">
        <track kind="subtitles"
               src="subtitles-fr.vtt"
               srclang="fr"
               label="Français">
    </video>
    <figcaption>
        <strong>Tutoriel HTML5 - Partie 3</strong><br>
        Introduction aux éléments multimédia (durée : 12:34)
    </figcaption>
</figure>
````

### 5. Audio avec métadonnées

````html
<figure>
    <audio controls>
        <source src="episode-42.opus" type="audio/opus">
        <source src="episode-42.mp3" type="audio/mpeg">
    </audio>
    <figcaption>
        <strong>Podcast Tech - Épisode 42</strong><br>
        "L'avenir du développement web"<br>
        <time datetime="2024-11-27">27 novembre 2024</time> - 45 minutes
    </figcaption>
</figure>
````

### 6. Diagramme SVG

````html
<figure>
    <svg width="400" height="300" viewBox="0 0 400 300">
        <!-- Contenu SVG du diagramme -->
        <rect x="50" y="50" width="100" height="60" fill="#3498db" />
        <text x="100" y="85" text-anchor="middle" fill="white">Étape 1</text>
        <line x1="150" y1="80" x2="200" y2="80" stroke="#333" stroke-width="2" />
        <rect x="200" y="50" width="100" height="60" fill="#2ecc71" />
        <text x="250" y="85" text-anchor="middle" fill="white">Étape 2</text>
    </svg>
    <figcaption>
        Figure 2 : Processus de validation en deux étapes
    </figcaption>
</figure>
````

### 7. Canvas avec légende

````html
<figure>
    <canvas id="chart" width="600" height="400"></canvas>
    <figcaption>
        Graphique 1 : Évolution des ventes par trimestre (2024)
    </figcaption>
</figure>
<script>
const canvas = document.getElementById('chart');
const ctx = canvas.getContext('2d');
// Code de dessin du graphique...
</script>
````

### 8. Extrait de code

````html
<figure>
    <pre><code class="language-javascript">
// Fonction pour calculer la somme
function sum(a, b) {
    return a + b;
}
// Utilisation
const result = sum(5, 3);
console.log(result); // Affiche: 8
    </code></pre>
    <figcaption>
        Exemple 1 : Fonction d'addition en JavaScript
    </figcaption>
</figure>
````

### 9. Citation avec attribution

````html
<figure>
    <blockquote cite="https://www.example.com/source">
        <p>
            « L'innovation distingue un leader d'un suiveur. »
        </p>
    </blockquote>
    <figcaption>
        — <cite>Steve Jobs</cite>, co-fondateur d'Apple
    </figcaption>
</figure>
````

### 10. Poème ou texte littéraire

````html
<figure>
    <p style="font-style: italic; line-height: 1.6;">
        Demain, dès l'aube, à l'heure où blanchit la campagne,<br>
        Je partirai. Vois-tu, je sais que tu m'attends.<br>
        J'irai par la forêt, j'irai par la montagne.<br>
        Je ne puis demeurer loin de toi plus longtemps.
    </p>
    <figcaption>
        <cite>Demain, dès l'aube</cite> - Victor Hugo, 1847
    </figcaption>
</figure>
````

## Figures imbriquées

Vous pouvez imbriquer des figures pour créer des structures complexes :

````html
<figure>
    <figcaption>Comparaison des architectures logicielles</figcaption>
    <figure>
        <img src="monolithic.png" alt="Architecture monolithique">
        <figcaption>A) Architecture monolithique traditionnelle</figcaption>
    </figure>
    <figure>
        <img src="microservices.png" alt="Architecture microservices">
        <figcaption>B) Architecture microservices moderne</figcaption>
    </figure>
</figure>
````

## Styling CSS

### Style de base

````css
figure {
    margin: 2rem 0;
    padding: 1rem;
    background-color: #f8f9fa;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
figure img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto;
}
figcaption {
    margin-top: 1rem;
    padding: 0.5rem;
    font-size: 0.9rem;
    color: #666;
    text-align: center;
    font-style: italic;
}
````

### Style avec bordure

````css
figure {
    border: 2px solid #ddd;
    padding: 1.5rem;
    margin: 2rem auto;
    max-width: 800px;
}
figcaption {
    margin-top: 1rem;
    padding-top: 1rem;
    border-top: 1px solid #ddd;
    font-weight: 600;
    color: #333;
}
````

### Style moderne avec dégradé

````css
figure {
    position: relative;
    margin: 2rem 0;
    padding: 0;
    overflow: hidden;
    border-radius: 12px;
}
figure img {
    display: block;
    width: 100%;
    height: auto;
}
figcaption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 1.5rem;
    background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
    color: white;
    font-size: 1rem;
    transform: translateY(100%);
    transition: transform 0.3s ease;
}
figure:hover figcaption {
    transform: translateY(0);
}
````

### Galerie avec grid

````css
.figure-gallery {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1rem;
    margin: 2rem 0;
}
.figure-gallery figure {
    margin: 0;
    background: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}
.figure-gallery figure:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0,0,0,0.15);
}
.figure-gallery img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}
.figure-gallery figcaption {
    padding: 1rem;
    text-align: center;
    font-size: 0.9rem;
}
````

## Accessibilité

### Bonnes pratiques

````html
<!-- ✅ Bon : Image avec alt ET légende -->
<figure>
    <img src="chart.png"
         alt="Graphique en barres montrant une croissance de 30%">
    <figcaption>
        Figure 1 : Croissance des ventes par trimestre
    </figcaption>
</figure>
<!-- ✅ Bon : Utilisation de aria-labelledby -->
<figure aria-labelledby="fig-caption-1">
    <img src="diagram.png" alt="Diagramme du processus">
    <figcaption id="fig-caption-1">
        Diagramme du processus de développement logiciel
    </figcaption>
</figure>
<!-- ✅ Bon : Description détaillée pour contenu complexe -->
<figure aria-describedby="detailed-desc">
    <img src="complex-chart.png" alt="Graphique complexe">
    <figcaption>
        Analyse comparative des performances
    </figcaption>
    <div id="detailed-desc" class="visually-hidden">
        Ce graphique compare les performances de trois systèmes :
        Système A affiche 85% de réussite, Système B 72%, et Système C 91%.
        L'axe vertical représente le taux de réussite en pourcentage,
        l'axe horizontal représente les différents systèmes testés.
    </div>
</figure>
````

### Classe CSS pour contenu accessible, mais visuellement caché

````css
.visually-hidden {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
}
````

### Points importants

1. **L'attribut `alt` sur l'image est toujours nécessaire**, même avec `<figcaption>`
2. **`<figcaption>` complète `alt`**, il ne le remplace pas
3. **`alt`** décrit ce que montre l'image
4. **`<figcaption>`** fournit le contexte, la source, ou des informations supplémentaires

## Comparaison entre alt et figcaption

````html

<!-- Exemple montrant la différence -->
<figure>
    <img src="eiffel-tower.jpg"
         alt="La Tour Eiffel illuminée de nuit avec des reflets dans la Seine">
    <figcaption>
        La Tour Eiffel lors du spectacle son et lumière du 14 juillet 2024.
        Photo : Marie Martin pour Le Journal du Tourisme.
    </figcaption>
</figure>
````

## Sémantique et SEO

### Avantages sémantiques

L'utilisation de ```<figure>``` et ```<figcaption>``` :

- Améliore la **structure sémantique** du document
- Aide les **moteurs de recherche** à comprendre le contexte des images
- Facilite la **navigation** avec les technologies d'assistance
- Permet un **meilleur référencement** des images

### Exemple optimisé pour SEO

````html
<article>
    <h1>Guide complet du HTML5</h1>
    <p>Le HTML5 a introduit de nombreux nouveaux éléments...</p>
    <figure>
        <img src="html5-structure.png"
             alt="Schéma montrant la structure d'un document HTML5 avec header, nav, main, article, aside et footer"
             width="800"
             height="600"
             loading="lazy">
        <figcaption>
            <strong>Figure 1 :</strong> Structure sémantique d'un document HTML5.
            Ce schéma illustre l'organisation typique des éléments HTML5
            dans une page web moderne.
        </figcaption>
    </figure>
    <p>Comme le montre la Figure 1, la structure HTML5...</p>
</figure>
````

## JavaScript et interactions

### Lightbox simple

````html
<figure class="lightbox-figure">
    <img src="photo-small.jpg"
         alt="Photo de paysage"
         data-full-src="photo-large.jpg">
    <figcaption>Cliquez pour agrandir</figcaption>
</figure>
<script>
document.querySelectorAll('.lightbox-figure img').forEach(img => {
    img.style.cursor = 'pointer';
    img.addEventListener('click', function() {
        const modal = document.createElement('div');
        modal.className = 'lightbox-modal';
        modal.innerHTML = `
            <div class="lightbox-content">
                <span class="lightbox-close">&times;</span>
                <img src="${this.dataset.fullSrc}" alt="${this.alt}">
            </div>
        `;
        document.body.appendChild(modal);
        modal.querySelector('.lightbox-close').addEventListener('click', () => {
            modal.remove();
        });
        modal.addEventListener('click', (e) => {
            if (e.target === modal) modal.remove();
        });
    });
});
</script>
<style>
.lightbox-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
}
.lightbox-content {
    position: relative;
    max-width: 90%;
    max-height: 90%;
}
.lightbox-content img {
    max-width: 100%;
    max-height: 90vh;
}
.lightbox-close {
    position: absolute;
    top: -40px;
    right: 0;
    color: white;
    font-size: 40px;
    cursor: pointer;
}
</style>
````

### Numérotation automatique des figures

````html

<script>
document.addEventListener('DOMContentLoaded', function() {
    const figures = document.querySelectorAll('article figure');
    figures.forEach((figure, index) => {
        const caption = figure.querySelector('figcaption');
        if (caption) {
            const figNumber = document.createElement('strong');
            figNumber.textContent = `Figure ${index + 1} : `;
            caption.insertBefore(figNumber, caption.firstChild);
        }
    });
});
</script>

````

## Erreurs courantes à éviter

### ❌ Mauvaises pratiques

````html
<!-- ❌ figcaption en dehors de figure -->
<img src="photo.jpg" alt="Photo">
<figcaption>Légende de la photo</figcaption>
<!-- ❌ figure sans contenu -->
<figure>
    <figcaption>Une légende sans contenu</figcaption>
</figure>
<!-- ❌ Plusieurs figcaption dans une figure -->
<figure>
    <img src="photo.jpg" alt="Photo">
    <figcaption>Première légende</figcaption>
    <figcaption>Deuxième légende</figcaption>
</figure>
<!-- ❌ figcaption au milieu -->
<figure>
    <img src="photo1.jpg" alt="Photo 1">
    <figcaption>Légende</figcaption>
    <img src="photo2.jpg" alt="Photo 2">
</figure>
<!-- ❌ Utiliser figure juste pour centrer une image -->
<figure>
    <img src="decorative.png" alt="">
</figure>
````

### ✅ Bonnes pratiques

````html
<!-- ✅ Structure correcte -->
<figure>
    <img src="photo.jpg" alt="Description de la photo">
    <figcaption>Légende contextuelle de la photo</figcaption>
</figure>
<!-- ✅ Plusieurs images avec une légende -->
<figure>
    <img src="photo1.jpg" alt="Photo 1">
    <img src="photo2.jpg" alt="Photo 2">
    <img src="photo3.jpg" alt="Photo 3">
    <figcaption>Collection de photos de voyage</figcaption>
</figure>
<!-- ✅ Image purement décorative : ne pas utiliser figure -->
<img src="decorative.png" alt="" role="presentation">
````

## Compatibilité navigateur

Les éléments ```<figure>``` et ```<figcaption>``` sont supportés par tous les navigateurs modernes :

- ✅ Chrome/Edge (depuis toujours)
- ✅ Firefox (depuis toujours)
- ✅ Safari (depuis toujours)
- ✅ Opera (depuis toujours)
Pas besoin de polyfills ou de fallbacks pour ces éléments.

## Ressources complémentaires

- [Élément `<figure>` sur MDN](https://developer.mozilla.org/fr/docs/Web/HTML/Element/figure)
- [Élément `<figcaption>` sur MDN](https://developer.mozilla.org/fr/docs/Web/HTML/Element/figcaption)
- [Guide d'accessibilité des images](https://www.w3.org/WAI/tutorials/images/)
- [HTML Living Standard](https://html.spec.whatwg.org/multipage/grouping-content.html#the-figure-element)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter les éléments `<figure>` et `<figcaption>`.
