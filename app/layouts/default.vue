<script setup lang="ts">
const theme = useColorTheme()
</script>

<template>
  <div class="flex min-h-screen flex-col bg-background text-foreground">
    <header class="border-b bg-card px-4">
      <nav class="container mx-auto flex h-14 items-center justify-between">
        <NuxtLink to="/" class="rounded-md text-xl font-semibold focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring">
          Project Name
        </NuxtLink>
        <UiButton
          type="button"
          variant="ghost"
          size="sm"
          :aria-pressed="theme.isDark.value"
          aria-label="Toggle color theme"
          @click="theme.toggle()"
        >
          {{ theme.isDark.value ? 'Light' : 'Dark' }}
        </UiButton>
      </nav>
    </header>

    <main class="container mx-auto flex-1 p-4 sm:p-6 lg:p-8">
      <slot />
    </main>

    <footer class="border-t bg-muted/40 p-4 text-center text-sm text-muted-foreground">
      <p>Built with Nuxt 4 · Tailwind 4 · shadcn-vue</p>
    </footer>
  </div>
</template>
