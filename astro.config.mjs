import { defineConfig } from 'astro/config';

// https://astro.build/config
// Configuration pour Always Data (hébergement traditionnel)
// Site : TutoHTMLMedia-LPDWCA-20-26
// Répertoire racine : /home/boyer-laurent/www/
export default defineConfig({
  site: 'https://tutohtmlmedia-lpdwca-20-26.alwaysdata.net',
  // base: '/', // Pas besoin de base path avec Always Data
  srcDir: './src',
  publicDir: './public',
  outDir: './dist',
  markdown: {
    shikiConfig: {
      theme: 'dracula',
      wrap: true
    }
  }
});
