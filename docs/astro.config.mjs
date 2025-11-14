import { defineConfig } from 'astro/config';

export default defineConfig({
  outDir: './dist',
  publicDir: './public',
  server: {
    host: true,
    port: 4321
  },
  vite: {
    resolve: {
      alias: {
        '@nuke': new URL('../dist/nuke-theme', import.meta.url).pathname
      }
    },
    server: {
      watch: {
        usePolling: true,
        interval: 100
      },
      fs: {
        allow: ['..']
      },
      hmr: {
        clientPort: 4321
      }
    }
  }
});
