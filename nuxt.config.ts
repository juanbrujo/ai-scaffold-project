import tailwindcss from '@tailwindcss/vite'

export default defineNuxtConfig({
  compatibilityDate: '2025-08-07',
  devtools: { enabled: true },

  modules: ['@pinia/nuxt', '@nuxt/eslint'],

  css: ['~/assets/css/main.css'],

  // Tailwind 4 integrates as a Vite plugin — @nuxtjs/tailwindcss is not used.
  vite: {
    plugins: [tailwindcss()]
  },

  ssr: true,

  runtimeConfig: {
    databaseUrl: process.env.DATABASE_URL,
    public: {
      apiBase: process.env.NUXT_PUBLIC_API_BASE || '/api'
    }
  },

  nitro: {
    prerender: {
      crawlLinks: false
    }
  }
})
