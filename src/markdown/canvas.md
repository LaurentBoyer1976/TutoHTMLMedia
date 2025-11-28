# L'élément `<canvas>`

L'élément HTML ```<canvas>``` est utilisé pour dessiner des graphiques, des animations et des compositions d'images à la volée via JavaScript.
Il fournit une surface de dessin programmable qui permet de créer des visualisations dynamiques, des jeux, des graphiques de données, et bien plus encore.
C'est un élément puissant pour créer du contenu graphique interactif.

## Exemple de syntaxe simple

````html
    <canvas id="myCanvas" width="800" height="600">
        Votre navigateur ne prend pas en charge l'élément canvas.
    </canvas>
````

## Exemple avec dessin basique en JavaScript

````html
    <canvas id="drawingCanvas" width="400" height="300"></canvas>
    <script>
        const canvas = document.getElementById('drawingCanvas');
        const ctx = canvas.getContext('2d');
        // Dessiner un rectangle bleu
        ctx.fillStyle = 'blue';
        ctx.fillRect(50, 50, 200, 100);
    </script>
````

L'élément ```<canvas>``` est essentiel pour :

- Créer des graphiques et visualisations de données interactives
- Développer des jeux en 2D et 3D (via WebGL)
- Générer des animations complexes
- Manipuler et traiter des images
- Créer des effets visuels en temps réel

## Les attributs

Cet élément inclut [les attributs universels](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Global_attributes).

- **width :**
  La largeur du canvas en pixels CSS.
  Par défaut : 300 pixels.
  **Important :** Cette valeur définit la résolution interne du canvas, pas sa taille d'affichage CSS.
  **Exemples :**

  ````html
  <canvas width="800"></canvas>
  <canvas width="1920"></canvas>
  ````

- **height :**
  La hauteur du canvas en pixels CSS.
  Par défaut : 150 pixels.
  **Important :** Cette valeur définit la résolution interne du canvas, pas sa taille d'affichage CSS.
  **Exemples :**

  ````html
  <canvas height="600"></canvas>
  <canvas width="1920" height="1080"></canvas>
  ````

### ⚠️ Différence importante : attributs vs CSS

````html
<!-- ✅ Bon : résolution interne = affichage -->
<canvas id="canvas1" width="800" height="600"></canvas>
<!-- ⚠️ Attention : étirement de l'image -->
<canvas id="canvas2" width="400" height="300"
        style="width: 800px; height: 600px;"></canvas>
<!-- L'image de 400x300 sera étirée pour remplir. 800x600 -->
<!-- ✅ Meilleure approche pour responsive -->
<canvas id="canvas3" width="1600" height="900"
        style="max-width: 100%; height: auto;"></canvas>
````

## Contexte de rendu

Le canvas lui-même est juste un conteneur. Pour dessiner, vous devez obtenir un **contexte de rendu** via JavaScript.

### Types de contextes disponibles

1. **`2d`** - Contexte 2D pour dessins et graphiques
2. **`webgl`** ou **`webgl2`** - Contexte 3D pour graphiques 3D accélérés
3. **`bitmaprenderer`** - Pour afficher des ImageBitmap
4. **`webgpu`** - Nouvelle API graphique (en développement)

### Obtenir le contexte 2D

````javascript
const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');Id('myCanvas');
const ctx = canvas.getContext('2d');
if (ctx) {
    // Le canvas 2D est supporté
    ctx.fillRect(0, 0, canvas.width, canvas.height);
} else {
    console.error('Canvas 2D non supporté');
}
````

### Obtenir le contexte WebGL

````javascript
const canvas = document.getElementById('myCanvas');
const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
if (gl) {
    // WebGL est supporté
    gl.clearColor(0.0, 0.0, 0.0, 1.0);
    gl.clear(gl.COLOR_BUFFER_BIT);
} else {
    console.error('WebGL non supporté');
}
````

## API Canvas 2D - Fonctions de base

### 1. Dessiner des rectangles

````javascript
const ctx = canvas.getContext('2d');
// Rectangle rempli
ctx.fillStyle = '#3498db';
ctx.fillRect(50, 50, 200, 100); // x, y, largeur, hauteur
// Rectangle avec contour
ctx.strokeStyle = '#e74c3c';
ctx.lineWidth = 3;
ctx.strokeRect(300, 50, 200, 100);
// Effacer une zone rectangulaire
ctx.clearRect(60, 60, 180, 80);
````

### 2. Dessiner des chemins (paths)

````javascript
// Commencer un nouveau chemin
ctx.beginPath();
// Déplacer le "crayon" sans dessiner
ctx.moveTo(100, 100);
// Dessiner une ligne
ctx.lineTo(200, 200);
ctx.lineTo(300, 100);
// Fermer le chemin
ctx.closePath();
// Appliquer le tracé
ctx.stroke(); // Contour
// ou
ctx.fill(); // Remplissage
````

### 3. Dessiner des cercles et arcs

````javascript
// Arc / Cercle
ctx.beginPath();
ctx.arc(200, 200, 50, 0, Math.PI * 2); // x, y, rayon, angle début, angle fin
ctx.fillStyle = '#2ecc71';
ctx.fill();
// Arc de cercle
ctx.beginPath();
ctx.arc(400, 200, 50, 0, Math.PI); // Demi-cercle
ctx.strokeStyle = '#9b59b6';
ctx.lineWidth = 3;
ctx.stroke();
````

### 4. Texte

````javascript
// Texte rempli
ctx.font = '30px Arial';
ctx.fillStyle = '#34495e';
ctx.fillText('Hello Canvas!', 100, 100);
// Texte avec contour
ctx.strokeStyle = '#e74c3c';
ctx.lineWidth = 2;
ctx.strokeText('Outlined Text', 100, 150);
// Mesurer le texte
const metrics = ctx.measureText('Hello Canvas!');
console.log('Largeur du texte:', metrics.width);
````

### 5. Images

````javascript
const img = new Image();
img.onload = function() {
    // Dessiner l'image complète
    ctx.drawImage(img, 0, 0);
    // Dessiner avec dimensions spécifiées
    ctx.drawImage(img, 0, 0, 200, 150);
    // Découper et redimensionner
    // drawImage(img, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
    ctx.drawImage(img, 50, 50, 100, 100, 250, 0, 200, 200);
};
img.src = 'photo.jpg';
````

### 6. Dégradés

````javascript
// Dégradé linéaire
const linearGradient = ctx.createLinearGradient(0, 0, 200, 0);
linearGradient.addColorStop(0, '#e74c3c');
linearGradient.addColorStop(0.5, '#f39c12');
linearGradient.addColorStop(1, '#f1c40f');
ctx.fillStyle = linearGradient;
ctx.fillRect(0, 0, 200, 200);
// Dégradé radial
const radialGradient = ctx.createRadialGradient(300, 100, 10, 300, 100, 100);
radialGradient.addColorStop(0, '#fff');
radialGradient.addColorStop(1, '#3498db');
ctx.fillStyle = radialGradient;
ctx.fillRect(200, 0, 200, 200);
````

### 7. Motifs (Patterns)

````javascript
const patternImg = new Image();
patternImg.onload = function() {
    const pattern = ctx.createPattern(patternImg, 'repeat');
    ctx.fillStyle = pattern;
    ctx.fillRect(0, 0, 400, 300);
};
patternImg.src = 'pattern.png';
````

### 8. Transformations

````javascript
// Sauvegar l'état actuel
ctx.save();
// Translation (déplacement de l'origine)
ctx.translate(100, 100);
// Rotation (en radians)
ctx.rotate(Math.PI / 4); // 45 degrés
// Mise à l'échelle
ctx.scale(2, 2);
// Dessiner
ctx.fillRect(0, 0, 50, 50);
// Restaurer l'état
ctx.restore();
````
## Exemples pratiques
### Exemple 1 : Horloge analogique

````html
<canvas id="clock" width="400" height="400"></canvas>
<script>
function drawClock() {
    const canvas = document.getElementById('clock');
    const ctx = canvas.getContext('2d');
    const now = new Date();
    // Effacer le canvas
    ctx.clearRect(0, 0, 400, 400);
    // Centrer
    ctx.save();
    ctx.translate(200, 200);
    ctx.rotate(-Math.PI / 2);
    // Cadran
    ctx.strokeStyle = '#333';
    ctx.lineWidth = 8;
    ctx.beginPath();
    ctx.arc(0, 0, 150, 0, Math.PI * 2);
    ctx.stroke();
    // Aiguille des heures
    ctx.save();
    const hours = now.getHours() % 12;
    const minutes = now.getMinutes();
    ctx.rotate(hours * (Math.PI / 6) + minutes * (Math.PI / 360));
    ctx.strokeStyle = '#333';
    ctx.lineWidth = 8;
    ctx.beginPath();
    ctx.moveTo(0, 0);
    ctx.lineTo(60, 0);
    ctx.stroke();
    ctx.restore();
    // Aiguille des minutes
    ctx.save();
    ctx.rotate((Math.PI / 30) * minutes);
    ctx.strokeStyle = '#666';
    ctx.lineWidth = 5;
    ctx.beginPath();
    ctx.moveTo(0, 0);
    ctx.lineTo(90, 0);
    ctx.stroke();
    ctx.restore();
    // Aiguille des secondes
    ctx.save();
    const seconds = now.getSeconds();
    ctx.rotate((Math.PI / 30) * seconds);
    ctx.strokeStyle = '#e74c3c';
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.moveTo(0, 0);
    ctx.lineTo(100, 0);
    ctx.stroke();
    ctx.restore();
    ctx.restore();
}
// Mettre à jour toutes les secondes
setInterval(drawClock, 1000);
drawClock();
</script>
### Exemple 2 : Graphique à barres
````html
<canvas id="barChart" width="600" height="400"></canvas>
<script>
function drawBarChart(data, labels) {
    const canvas = document.getElementById('barChart');
    const ctx = canvas.getContext('2d');
    const barWidth = 80;
    const spacing = 20;
    const maxValue = Math.max(...data);
    const chartHeight = 300;
    // Couleurs
    const colors = ['#3498db', '#2ecc71', '#f39c12', '#e74c3c', '#9b59b6'];
    // Dessiner les barres
    data.forEach((value, index) => {
        const barHeight = (value / maxValue) * chartHeight;
        const x = index * (barWidth + spacing) + 50;
        const y = 350 - barHeight;
        // Barre
        ctx.fillStyle = colors[index % colors.length];
        ctx.fillRect(x, y, barWidth, barHeight);
        // Valeur
        ctx.fillStyle = '#333';
        ctx.font = '14px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(value, x + barWidth / 2, y - 10);
        // Label
        ctx.fillText(labels[index], x + barWidth / 2, 380);
    });
}
drawBarChart([65, 59, 80, 81, 56], ['Jan', 'Fév', 'Mar', 'Avr', 'Mai']);
</script>

### Exemple 3 : Animation de particules


<canvas id="particles" width="800" height="600"></canvas>
<script>
const canvas = document.getElementById('particles');
const ctx = canvas.getContext('2d');
class Particle {
    constructor() {
        this.x = Math.random() * canvas.width;
        this.y = Math.random() * canvas.height;
        this.vx = (Math.random() - 0.5) * 2;
        this.vy = (Math.random() - 0.5) * 2;
        this.radius = Math.random() * 3 + 1;
        this.color = `hsl(${Math.random() * 360}, 100%, 50%)`;
    }
    update() {
        this.x += this.vx;
        this.y += this.vy;
        // Rebondir sur les bords
        if (this.x < 0 || this.x > canvas.width) this.vx *= -1;
        if (this.y < 0 || this.y > canvas.height) this.vy *= -1;
    }
    draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
        ctx.fillStyle = this.color;
        ctx.fill();
    }
}
// Créer les particules
const particles = [];
for (let i = 0; i < 100; i++) {
    particles.push(new Particle());
}
// Boucle d'animation
function animate() {
    ctx.fillStyle = 'rgba(0, 0, 0, 0.1)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    particles.forEach(particle => {
        particle.update();
        particle.draw();
    });
    requestAnimationFrame(animate);
}
animate();
</script>

### Exemple 4 : Filtrage et manipulation d'image


<canvas id="imageFilter" width="400" height="300"></canvas>
<script>
const canvas = document.getElementById('imageFilter');
const ctx = canvas.getContext('2d');
const img = new Image();
img.onload = function() {
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    // Obtenir les données de pixels
    const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
    const data = imageData.data;
    // Appliquer un filtre (exemple : noir et blanc)
    for (let i = 0; i < data.length; i += 4) {
        const avg = (data[i] + data[i + 1] + data[i + 2]) / 3;
        data[i] = avg;     // Rouge
        data[i + 1] = avg; // Vert
        data[i + 2] = avg; // Bleu
        // data[i + 3] est alpha (transparence)
    }
    // Remettre les données modifiées
    ctx.putImageData(imageData, 0, 0);
};
img.src = 'photo.jpg';
</script>
````

### Méthode 1 : Avec resize listener

````javascript
function resizeCanvas() {
    const canvas = document.getElementById('myCanvas');
    const container = canvas.parentElement;
    // Adapter au conteneur
    canvas.width = container.clientWidth;
    canvas.height = container.clientHeight;
    // Redessiner le contenu
    draw();
}
window.addEventListener('resize', resizeCanvas);
resizeCanvas();
````
### Méthode 2 : Avec devicePixelRatio (haute résolution)

````javascript
function setupHiDPICanvas(canvas) {
    const dpr = window.devicePixelRatio || 1;
    const rect = canvas.getBoundingClientRect();
    // Définir la résolution interne
    canvas.width = rect.width * dpr;
    canvas.height = rect.height * dpr;
    // Définir la taille d'affichage
    canvas.style.width = rect.width + 'px';
    canvas.style.height = rect.height + 'px';
    // Mettre à l'échelle le contexte
    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);
    return ctx;
}
const ctx = setupHiDPICanvas(document.getElementById('myCanvas'));
````

## Performance et optimisation

### 1. Redessiner uniquement ce qui change

````javascript
// ❌ Mauvais : redessine tout
function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBackground();
    drawAllObjects();
    requestAnimationFrame(animate);
}
// ✅ Bon : redessine uniquement les zones modifiées
function animate() {
    dirtyRegions.forEach(region => {
        ctx.clearRect(region.x, region.y, region.width, region.height);
        redrawRegion(region);
    });
    requestAnimationFrame(animate);
}
````

### 2. Utiliser plusieurs canvas superposés

````html
<div style="position: relative;">
    <!-- Canvas de fond statique -->
    <canvas id="background" width="800" height="600"
            style="position: absolute;"></canvas>
    <!-- Canvas d'objets dynamiques -->
    <canvas id="foreground" width="800" height="600"
            style="position: absolute;"></canvas>
</div>
````

### 3. Utiliser OffscreenCanvas (moderne)

````javascript
// Dans un Web Worker
const offscreen = new OffscreenCanvas(800, 600);
const ctx = offscreen.getContext('2d');
// Dessiner
ctx.fillRect(0, 0, 800, 600);
// Transférer au canvas principal
const bitmap = offscreen.transferToImageBitmap();
self.postMessage({ bitmap }, [bitmap]);
````

### 4. Réduire les appels de rendu

````javascript
// ❌ Lent : changements multiples
ctx.fillStyle = 'red';
ctx.fillRect(0, 0, 10, 10);
ctx.fillStyle = 'blue';
ctx.fillRect(20, 0, 10, 10);
// ✅ Rapide : grouper par style
ctx.fillStyle = 'red';
ctx.fillRect(0, 0, 10, 10);
ctx.fillRect(40, 0, 10, 10);
ctx.fillStyle = 'blue';
ctx.fillRect(20, 0, 10, 10);
ctx.fillRect(60, 0, 10, 10);
````

## Accessibilité

Le canvas pose des défis d'accessibilité, car c'est essentiellement une image bitmap. Voici comment améliorer l'accessibilité :

### 1. Contenu de fallback

````html
<canvas id="chart" width="600" height="400">
    <h3>Graphique des ventes 2024</h3>
    <table>
        <tr><th>Mois</th><th>Ventes</th></tr>
        <tr><td>Janvier</td><td>65</td></tr>
        <tr><td>Février</td><td>59</td></tr>
        <tr><td>Mars</td><td>80</td></tr>
    </table>
</canvas>
````

### 2. ARIA attributes

````html
<canvas id="game"
        width="800"
        height="600"
        role="img"
        aria-label="Jeu de puzzle interactif">
</canvas>
````

### 3. Alternative textuelle dynamique

````javascript
const canvas = document.getElementById('myCanvas');
canvas.setAttribute('aria-label', 'Graphique montrant une tendance à la hausse de 30%');
````

### 4. Focus et interactions clavier

````html
<canvas id="interactive"
        width="400"
        height="300"
        tabindex="0"
        role="application"
        aria-label="Application de dessin interactive">
</canvas>
<script>
const canvas = document.getElementById('interactive');
canvas.addEventListener('keydown', (e) => {
    switch(e.key) {
        case 'ArrowUp':
            // Action
            break;
        case 'ArrowDown':
            // Action
            break;
    }
});
</script>
````

## Export et sauvegarde

### Exporter en image

````javascript
const canvas = document.getElementById('myCanvas');
// En tant que Data URL
const dataURL = canvas.toDataURL('image/png');
console.log(dataURL);
// En tant que Blob
canvas.toBlob((blob) => {
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.download = 'canvas-export.png';
    link.href = url;
    link.click();
}, 'image/png');
````

### Exporter en différents formats

````javascript
// PNG (par défaut, sans perte)
const pngURL = canvas.toDataURL('image/png');
// JPEG (avec compression)
const jpegURL = canvas.toDataURL('image/jpeg', 0.8); // 0.8 = 80% qualité
// WebP (moderne, bonne compression)
const webpURL = canvas.toDataURL('image/webp', 0.9);
````

## Sécurité

### Tainted Canvas (canvas contaminé)

Lorsque vous dessinez une image d'une origine différente sur un canvas sans CORS, le canvas devient "contaminé" et vous ne pouvez plus en extraire les données.

````javascript
const img = new Image();
img.crossOrigin = 'anonymous'; // Important !
img.onload = function() {
    ctx.drawImage(img, 0, 0);
    // Maintenant on peut extraire les données
    const dataURL = canvas.toDataURL();
};
img.src = 'https://autre-domaine.com/image.jpg';
````

## Ressources complémentaires

- [Canvas API](https://developer.mozilla.org/fr/docs/Web/API/Canvas_API)
- [CanvasRenderingContext2D](https://developer.mozilla.org/fr/docs/Web/API/CanvasRenderingContext2D)
- [WebGL API](https://developer.mozilla.org/fr/docs/Web/API/WebGL_API)
- [Tutoriel Canvas](https://developer.mozilla.org/fr/docs/Web/API/Canvas_API/Tutorial)
Lien vers [Le bac à sable](sandbox.html). Ici, vous pouvez visualiser, tester et expérimenter l'élément `<canvas>`.
