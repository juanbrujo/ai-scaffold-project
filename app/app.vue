<script setup lang="ts">
useHead({
  titleTemplate: (title?: string) => (title ? `${title} · Project Name` : 'Project Name')
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
