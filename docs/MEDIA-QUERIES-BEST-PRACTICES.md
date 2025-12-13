# Media Queries - Bonnes Pratiques

## Détection des écrans haute résolution (Retina)

### ❌ Syntaxe obsolète à NE PAS utiliser

```css
/* OBSOLÈTE - Ne pas utiliser */
@media (-webkit-min-device-pixel-ratio: 2),
       (-o-min-device-pixel-ratio: 2/1),
       (min-device-pixel-ratio: 2) {
  /* styles pour écrans retina */
}
```

**Problèmes** :
- `-webkit-min-device-pixel-ratio` : Préfixe vendeur webkit (obsolète)
- `-o-min-device-pixel-ratio` : Préfixe Opera (très obsolète)
- `min-device-pixel-ratio` : Syntaxe non-standard et dépréciée

### ✅ Syntaxe moderne recommandée

```css
/* MODERNE - À utiliser */
@media (min-resolution: 2dppx),
       (min-resolution: 192dpi) {
  /* styles pour écrans retina */
}
```

**Avantages** :
- Syntaxe standardisée par le W3C
- Supportée par tous les navigateurs modernes
- Plus maintenable et pérenne
- `dppx` = dots per px unit (recommandé)
- `dpi` = dots per inch (équivalent : 192dpi = 2dppx)

## Audit du repository

**Date** : 13 décembre 2024

**Résultat** : ✅ Aucune syntaxe obsolète détectée

Le repository a été entièrement audité et ne contient aucune instance de syntaxe obsolète pour les media queries liées à la résolution d'écran.

### Fichiers vérifiés :
- Tous les fichiers `.css`
- Tous les fichiers `.astro` (avec balises `<style>`)
- Tous les fichiers `.html`
- Tous les fichiers markdown `.md`

### Exemple d'utilisation correcte trouvée :

Dans `src/markdown/picture.md` (ligne 115) :
```html
<source media="(min-resolution: 2dppx)" srcset="high-res.jpg">
```

## Références

- [MDN - Using Media Queries](https://developer.mozilla.org/fr/docs/Web/CSS/Media_Queries/Using_media_queries)
- [W3C - Media Queries Level 4](https://www.w3.org/TR/mediaqueries-4/#resolution)
- [Can I Use - resolution media query](https://caniuse.com/css-media-resolution)

## Recommandations pour le futur

1. Toujours utiliser `min-resolution` avec `dppx` ou `dpi`
2. Éviter tous les préfixes vendeurs (`-webkit-`, `-moz-`, `-o-`, etc.)
3. Tester la compatibilité sur [Can I Use](https://caniuse.com) avant d'ajouter de nouvelles media queries
