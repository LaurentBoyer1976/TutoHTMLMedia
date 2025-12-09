import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
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
