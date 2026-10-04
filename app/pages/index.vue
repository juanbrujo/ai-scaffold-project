<script setup lang="ts">
useHead({ title: 'Home' })

const { data: health } = await useFetch('/api/health')
</script>

<template>
  <section class="flex flex-col gap-6">
    <div>
      <h1 class="text-3xl sm:text-4xl font-bold">Project Name</h1>
      <p class="mt-2 text-muted-foreground">
        Nuxt 4 scaffold with Pinia, Tailwind 4, shadcn-vue and Vitest.
      </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2">
      <CounterCard />

      <UiCard>
        <UiCardHeader>
          <UiCardTitle>API health</UiCardTitle>
          <UiCardDescription>Response from <code>/api/health</code>.</UiCardDescription>
        </UiCardHeader>
        <UiCardContent>
          <UiAlert v-if="health">
            <UiAlertTitle>Service available</UiAlertTitle>
            <UiAlertDescription>{{ health.status }} — {{ health.timestamp }}</UiAlertDescription>
          </UiAlert>
          <UiAlert v-else>
            <UiAlertTitle>No response yet</UiAlertTitle>
            <UiAlertDescription>The health endpoint has not returned data.</UiAlertDescription>
          </UiAlert>
        </UiCardContent>
      </UiCard>
    </div>
  </section>
</template>
