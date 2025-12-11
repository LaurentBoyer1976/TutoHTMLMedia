import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://laurentboyer1976.github.io',
  base: '/TutoHTMLMedia',
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
