import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import tailwind from '@astrojs/tailwind';
import partytown from '@astrojs/partytown';

export default defineConfig({
  site: 'https://rlin232.github.io',
  integrations: [
    mdx(),
    tailwind(),
    partytown({
      config: {
        forward: ["dataLayer.push"],
      },
  }),
  ],
}); 