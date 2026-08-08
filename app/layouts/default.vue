<script setup lang="ts">
const theme = useColorTheme()
</script>

<template>
  <div class="min-h-screen bg-base-100 text-base-content flex flex-col">
    <header class="navbar bg-base-200 px-4">
      <div class="flex-1">
        <NuxtLink to="/" class="btn btn-ghost text-xl">Project Name</NuxtLink>
      </div>
      <div class="flex-none">
        <button
          type="button"
          class="btn btn-ghost btn-sm"
          :aria-pressed="theme.isDark.value"
          aria-label="Toggle color theme"
          @click="theme.toggle()"
        >
          {{ theme.isDark.value ? 'Light' : 'Dark' }}
        </button>
      </div>
    </header>

    <main class="flex-1 container mx-auto p-4 sm:p-6 lg:p-8">
      <slot />
    </main>

    <footer class="footer footer-center bg-base-200 text-base-content p-4">
      <aside>
        <p>Built with Nuxt 4 · Tailwind 4 · DaisyUI 5</p>
      </aside>
    </footer>
  </div>
</template>
