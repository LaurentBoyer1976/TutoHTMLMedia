import { defineConfig } from 'astro/config';


export default defineConfig({
  site: 'https://tutohtmlmedia-lpdwca-20-26.alwaysdata.net',
  base: '/', //
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
