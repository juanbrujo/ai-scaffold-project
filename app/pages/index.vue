<script setup lang="ts">
useHead({ title: 'Home' })

const { data: health } = await useFetch('/api/health')
</script>

<template>
  <section class="flex flex-col gap-6">
    <div>
      <h1 class="text-3xl sm:text-4xl font-bold">Project Name</h1>
      <p class="text-base-content/70 mt-2">
        Nuxt 4 scaffold with Pinia, Tailwind 4, DaisyUI 5 and Vitest.
      </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2">
      <CounterCard />

      <div class="card bg-base-200 shadow-sm">
        <div class="card-body">
          <h2 class="card-title">API health</h2>
          <p class="text-base-content/70">Response from <code>/api/health</code>.</p>
          <div v-if="health" class="alert alert-success mt-2">
            <span>{{ health.status }} — {{ health.timestamp }}</span>
          </div>
          <div v-else class="alert alert-warning mt-2">
            <span>No response yet.</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
