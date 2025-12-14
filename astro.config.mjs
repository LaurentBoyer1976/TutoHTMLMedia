import { defineConfig } from 'astro/config';

// https://astro.build/config
// Configuration pour Always Data (hébergement traditionnel)
// URL: https://your-domain.alwaysdata.net ou votre domaine personnalisé
export default defineConfig({
  site: 'https://your-domain.alwaysdata.net', // À remplacer par votre domaine Always Data
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
