<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useCounterStore } from '~/stores/counter'

const counter = useCounterStore()
const { count, double } = storeToRefs(counter)
</script>

<template>
  <UiCard>
    <UiCardHeader>
      <UiCardTitle>Counter</UiCardTitle>
      <UiCardDescription>
        A Pinia setup store, wired through <code>@pinia/nuxt</code>.
      </UiCardDescription>
    </UiCardHeader>

    <UiCardContent>
      <div class="flex items-baseline gap-4 py-2">
        <span class="text-4xl font-bold tabular-nums" data-testid="count">{{ count }}</span>
        <span class="text-muted-foreground">double: {{ double }}</span>
      </div>
    </UiCardContent>

    <UiCardFooter class="justify-end gap-2">
      <UiButton type="button" variant="ghost" size="sm" @click="counter.reset()">
        Reset
      </UiButton>
      <UiButton type="button" size="sm" @click="counter.increment()">
        Increment
      </UiButton>
    </UiCardFooter>
  </UiCard>
</template>
