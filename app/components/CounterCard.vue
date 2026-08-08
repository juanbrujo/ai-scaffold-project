<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useCounterStore } from '~/stores/counter'

const counter = useCounterStore()
const { count, double } = storeToRefs(counter)
</script>

<template>
  <div class="card bg-base-200 shadow-sm">
    <div class="card-body">
      <h2 class="card-title">Counter</h2>
      <p class="text-base-content/70">
        A Pinia setup store, wired through <code>@pinia/nuxt</code>.
      </p>

      <div class="flex items-baseline gap-4 py-2">
        <span class="text-4xl font-bold tabular-nums" data-testid="count">{{ count }}</span>
        <span class="text-base-content/60">double: {{ double }}</span>
      </div>

      <div class="card-actions justify-end gap-2">
        <button type="button" class="btn btn-ghost btn-sm" @click="counter.reset()">
          Reset
        </button>
        <button type="button" class="btn btn-primary btn-sm" @click="counter.increment()">
          Increment
        </button>
      </div>
    </div>
  </div>
</template>
