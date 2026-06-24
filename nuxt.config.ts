export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['@nuxtjs/tailwindcss'],
  css: ['~/assets/css/main.css'],
  ssr: true,
  nitro: {
    prerender: {
      crawlLinks: false
    }
  }
})
