# **API MediaDevices.getUserMedia() - Accès à la Webcam et au Micro**

> ⚠️ **Note importante** : Cette API est une **API JavaScript Web**, pas une balise HTML5. Elle fait partie des fonctionnalités optionnelles et avancées pour enrichir vos applications multimédia.

## Introduction

L'API `MediaDevices.getUserMedia()` permet d'accéder aux périphériques multimédia de l'utilisateur (webcam, microphone) depuis le navigateur. C'est une API moderne et puissante pour créer des applications de visioconférence, de capture photo/vidéo, d'enregistrement audio, etc.

## Qu'est-ce que MediaDevices ?

`MediaDevices` est une interface qui donne accès aux périphériques média connectés comme :

- **Caméras** (webcams intégrées ou externes)
- **Microphones** (intégrés ou externes)
- **Partage d'écran** (avec `getDisplayMedia()`)

## Prérequis

### 1. Contexte HTTPS obligatoire

Pour des raisons de sécurité, `getUserMedia()` ne fonctionne que sur :

- ✅ **HTTPS** (en production)
- ✅ **localhost** (en développement)
- ❌ **HTTP** (bloqué par les navigateurs)

### 2. Permission utilisateur requise

Le navigateur demande **toujours** l'autorisation à l'utilisateur avant d'accéder à la caméra ou au micro.

### 3. Compatibilité navigateur

| Navigateur | Support |
|------------|---------|
| Chrome/Edge | ✅ Depuis v53 |
| Firefox | ✅ Depuis v36 |
| Safari | ✅ Depuis v11 |
| Opera | ✅ Depuis v40 |
| Mobile | ✅ iOS Safari 11+, Chrome Android |

## Syntaxe de base

```javascript
navigator.mediaDevices.getUserMedia(constraints)
  .then(function(stream) {
    // Succès : utiliser le flux média
  })
  .catch(function(error) {
    // Erreur : gérer le refus ou l'absence de périphérique
  });
```

### Avec async/await (moderne)

```javascript
async function demarrerWebcam() {
  try {
    const stream = await navigator.mediaDevices.getUserMedia({ video: true });
    // Utiliser le flux
  } catch (error) {
    console.error('Erreur:', error);
  }
}
```

## Paramètres (Constraints)

L'objet `constraints` définit les médias demandés :

### Contraintes simples

```javascript
// Vidéo uniquement
{ video: true }

// Audio uniquement
{ audio: true }

// Vidéo ET audio
{ video: true, audio: true }
```

### Contraintes avancées

```javascript
{
  video: {
    width: { min: 640, ideal: 1920, max: 1920 },
    height: { min: 480, ideal: 1080, max: 1080 },
    facingMode: "user", // "user" (face) ou "environment" (arrière)
    frameRate: { ideal: 30, max: 60 }
  },
  audio: {
    echoCancellation: true,
    noiseSuppression: true,
    sampleRate: 44100
  }
}
```

## Exemple 1 : Afficher la webcam dans une vidéo

### HTML

```html
<div class="webcam-container">
    <video id="webcam" autoplay playsinline></video>
    <div class="controls">
        <button id="btn-start">Démarrer la caméra</button>
        <button id="btn-stop" disabled>Arrêter la caméra</button>
    </div>
</div>
```

### JavaScript

```javascript
const video = document.getElementById('webcam');
const btnStart = document.getElementById('btn-start');
const btnStop = document.getElementById('btn-stop');
let stream = null;

// Démarrer la webcam
btnStart.addEventListener('click', async () => {
    try {
        stream = await navigator.mediaDevices.getUserMedia({ 
            video: true 
        });
        
        // Attacher le flux au lecteur vidéo
        video.srcObject = stream;
        
        // Mettre à jour l'interface
        btnStart.disabled = true;
        btnStop.disabled = false;
        
    } catch (error) {
        console.error('Erreur lors de l\'accès à la webcam:', error);
        alert('Impossible d\'accéder à la webcam. Vérifiez les permissions.');
    }
});

// Arrêter la webcam
btnStop.addEventListener('click', () => {
    if (stream) {
        // Arrêter toutes les pistes du flux
        stream.getTracks().forEach(track => track.stop());
        video.srcObject = null;
        
        // Mettre à jour l'interface
        btnStart.disabled = false;
        btnStop.disabled = true;
    }
});
```

### CSS

```css
.webcam-container {
    max-width: 800px;
    margin: 2rem auto;
    text-align: center;
}

#webcam {
    width: 100%;
    max-width: 640px;
    height: auto;
    background: #000;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}

.controls {
    margin-top: 1rem;
    display: flex;
    gap: 1rem;
    justify-content: center;
}

.controls button {
    padding: 0.75rem 1.5rem;
    font-size: 1rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#btn-start {
    background-color: #28a745;
    color: white;
}

#btn-start:hover:not(:disabled) {
    background-color: #218838;
}

#btn-stop {
    background-color: #dc3545;
    color: white;
}

#btn-stop:hover:not(:disabled) {
    background-color: #c82333;
}

button:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}
```

## Exemple 2 : Capturer une photo depuis la webcam

### HTML pour la capture photo

```html
<div class="photo-booth">
    <video id="video-preview" autoplay playsinline></video>
    <canvas id="photo-canvas" style="display: none;"></canvas>
    
    <div class="controls">
        <button id="btn-init">Activer la caméra</button>
        <button id="btn-capture" disabled>📸 Capturer</button>
    </div>
    
    <div id="photos-gallery"></div>
</div>
```

### JavaScript pour la capture photo

```javascript
const videoPreview = document.getElementById('video-preview');
const photoCanvas = document.getElementById('photo-canvas');
const btnInit = document.getElementById('btn-init');
const btnCapture = document.getElementById('btn-capture');
const photosGallery = document.getElementById('photos-gallery');
let currentStream = null;

// Initialiser la caméra
btnInit.addEventListener('click', async () => {
    try {
        currentStream = await navigator.mediaDevices.getUserMedia({
            video: { 
                width: { ideal: 1280 },
                height: { ideal: 720 }
            }
        });
        
        videoPreview.srcObject = currentStream;
        btnInit.disabled = true;
        btnCapture.disabled = false;
        
    } catch (error) {
        console.error('Erreur:', error);
        alert('Impossible d\'accéder à la caméra');
    }
});

// Capturer une photo
btnCapture.addEventListener('click', () => {
    // Configurer le canvas aux dimensions de la vidéo
    photoCanvas.width = videoPreview.videoWidth;
    photoCanvas.height = videoPreview.videoHeight;
    
    // Dessiner l'image actuelle de la vidéo sur le canvas
    const ctx = photoCanvas.getContext('2d');
    ctx.drawImage(videoPreview, 0, 0);
    
    // Convertir le canvas en image
    const imageUrl = photoCanvas.toDataURL('image/png');
    
    // Créer une miniature
    const imgElement = document.createElement('img');
    imgElement.src = imageUrl;
    imgElement.alt = 'Photo capturée';
    
    // Ajouter un bouton de téléchargement
    const downloadLink = document.createElement('a');
    downloadLink.href = imageUrl;
    downloadLink.download = `photo_${Date.now()}.png`;
    downloadLink.textContent = '⬇️ Télécharger';
    
    const photoContainer = document.createElement('div');
    photoContainer.className = 'photo-item';
    photoContainer.appendChild(imgElement);
    photoContainer.appendChild(downloadLink);
    
    photosGallery.prepend(photoContainer);
});
```

### CSS pour la capture photo

```css
.photo-booth {
    max-width: 900px;
    margin: 2rem auto;
    padding: 1rem;
}

#video-preview {
    width: 100%;
    max-width: 640px;
    height: auto;
    border-radius: 8px;
    background: #000;
    display: block;
    margin: 0 auto 1rem;
}

#photos-gallery {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 1rem;
    margin-top: 2rem;
}

.photo-item {
    border: 2px solid #ddd;
    border-radius: 8px;
    padding: 0.5rem;
    background: #f8f9fa;
}

.photo-item img {
    width: 100%;
    height: auto;
    border-radius: 4px;
    margin-bottom: 0.5rem;
}

.photo-item a {
    display: block;
    text-align: center;
    padding: 0.5rem;
    background: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 0.9rem;
}

.photo-item a:hover {
    background: #0056b3;
}
```

## Exemple 3 : Enregistrement audio

### HTML pour l'enregistrement audio

```html
<div class="audio-recorder">
    <button id="btn-record">🎤 Démarrer l'enregistrement</button>
    <button id="btn-stop-record" disabled>⏹️ Arrêter</button>
    
    <div id="recordings"></div>
</div>
```

### JavaScript pour l'enregistrement audio

```javascript
let mediaRecorder;
let audioChunks = [];

const btnRecord = document.getElementById('btn-record');
const btnStopRecord = document.getElementById('btn-stop-record');
const recordingsDiv = document.getElementById('recordings');

btnRecord.addEventListener('click', async () => {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({ 
            audio: true 
        });
        
        mediaRecorder = new MediaRecorder(stream);
        audioChunks = [];
        
        mediaRecorder.ondataavailable = (event) => {
            audioChunks.push(event.data);
        };
        
        mediaRecorder.onstop = () => {
            const audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
            const audioUrl = URL.createObjectURL(audioBlob);
            
            const audioPlayer = document.createElement('audio');
            audioPlayer.src = audioUrl;
            audioPlayer.controls = true;
            
            const downloadLink = document.createElement('a');
            downloadLink.href = audioUrl;
            downloadLink.download = `enregistrement_${Date.now()}.webm`;
            downloadLink.textContent = '⬇️ Télécharger';
            
            const container = document.createElement('div');
            container.className = 'recording-item';
            container.appendChild(audioPlayer);
            container.appendChild(downloadLink);
            
            recordingsDiv.prepend(container);
            
            // Arrêter le flux audio
            stream.getTracks().forEach(track => track.stop());
        };
        
        mediaRecorder.start();
        btnRecord.disabled = true;
        btnStopRecord.disabled = false;
        
    } catch (error) {
        console.error('Erreur:', error);
        alert('Impossible d\'accéder au microphone');
    }
});

btnStopRecord.addEventListener('click', () => {
    mediaRecorder.stop();
    btnRecord.disabled = false;
    btnStopRecord.disabled = true;
});
```

## Gestion des erreurs

### Types d'erreurs courantes

```javascript
try {
    const stream = await navigator.mediaDevices.getUserMedia({ video: true });
} catch (error) {
    switch(error.name) {
        case 'NotAllowedError':
            console.error('Permission refusée par l\'utilisateur');
            break;
        case 'NotFoundError':
            console.error('Aucune caméra trouvée');
            break;
        case 'NotReadableError':
            console.error('Caméra déjà utilisée par une autre application');
            break;
        case 'OverconstrainedError':
            console.error('Contraintes impossibles à satisfaire');
            break;
        case 'SecurityError':
            console.error('Problème de sécurité (HTTPS requis)');
            break;
        default:
            console.error('Erreur inconnue:', error);
    }
}
```

## Bonnes pratiques

### 1. Toujours arrêter les flux

```javascript
function stopAllTracks(stream) {
    if (stream) {
        stream.getTracks().forEach(track => {
            track.stop();
            console.log(`Piste ${track.kind} arrêtée`);
        });
    }
}
```

### 2. Vérifier la disponibilité de l'API

```javascript
if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
    alert('Votre navigateur ne supporte pas getUserMedia');
} else {
    // Utiliser l'API
}
```

### 3. Informer l'utilisateur

```javascript
async function demanderAccesCamera() {
    const message = "Cette application a besoin d'accéder à votre caméra. " +
                   "Cliquez sur 'Autoriser' dans la popup du navigateur.";
    
    if (confirm(message)) {
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: true });
            return stream;
        } catch (error) {
            console.error('Accès refusé:', error);
            return null;
        }
    }
}
```

### 4. Libérer les ressources

```javascript
// Lors de la fermeture de la page ou du composant
window.addEventListener('beforeunload', () => {
    if (stream) {
        stream.getTracks().forEach(track => track.stop());
    }
});
```

## Lister les périphériques disponibles

```javascript
async function listerPeripheriques() {
    try {
        const devices = await navigator.mediaDevices.enumerateDevices();
        
        const cameras = devices.filter(device => device.kind === 'videoinput');
        const microphones = devices.filter(device => device.kind === 'audioinput');
        
        console.log('Caméras disponibles:');
        cameras.forEach((camera, index) => {
            console.log(`${index + 1}. ${camera.label || 'Caméra inconnue'}`);
        });
        
        console.log('\nMicrophones disponibles:');
        microphones.forEach((mic, index) => {
            console.log(`${index + 1}. ${mic.label || 'Microphone inconnu'}`);
        });
        
    } catch (error) {
        console.error('Erreur:', error);
    }
}
```

## Sélectionner un périphérique spécifique

```javascript
async function utiliserCameraSpecifique(deviceId) {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({
            video: { deviceId: { exact: deviceId } }
        });
        return stream;
    } catch (error) {
        console.error('Impossible d\'utiliser cette caméra:', error);
        return null;
    }
}
```

## Ressources et documentation

- [MDN - MediaDevices.getUserMedia()](https://developer.mozilla.org/fr/docs/Web/API/MediaDevices/getUserMedia)
- [MDN - MediaStream API](https://developer.mozilla.org/fr/docs/Web/API/MediaStream_API)
- [Can I Use - getUserMedia](https://caniuse.com/stream)
- [WebRTC samples](https://webrtc.github.io/samples/)

## Conclusion

L'API `getUserMedia()` est un outil puissant pour créer des applications multimédia interactives. Bien qu'elle ne fasse pas partie d'HTML5 pur, elle s'intègre parfaitement avec les éléments `<video>` et `<audio>` pour créer des expériences utilisateur riches.

**Points clés à retenir** :

- ✅ HTTPS obligatoire (sauf localhost)
- ✅ Permission utilisateur requise
- ✅ Toujours arrêter les flux après utilisation
- ✅ Gérer correctement les erreurs
- ✅ Tester sur différents navigateurs et appareils
