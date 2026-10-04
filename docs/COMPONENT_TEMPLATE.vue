<!-- Copy this for a small stateful component. shadcn-vue UI pieces are auto-imported as Ui*. -->
<template>
  <UiCard>
    <UiCardHeader>
      <UiCardTitle>{{ title }}</UiCardTitle>
      <UiCardDescription>{{ description }}</UiCardDescription>
    </UiCardHeader>

    <UiCardContent class="space-y-4">
      <input
        v-model="value"
        class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-xs outline-none transition-colors placeholder:text-muted-foreground focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 disabled:cursor-not-allowed disabled:opacity-50"
        type="text"
        placeholder="Type here…"
        :disabled="disabled"
      >

      <UiAlert v-if="error" variant="destructive">
        <UiAlertTitle>Something went wrong</UiAlertTitle>
        <UiAlertDescription>{{ error }}</UiAlertDescription>
      </UiAlert>
    </UiCardContent>

    <UiCardFooter class="justify-end gap-2">
      <UiButton type="button" variant="ghost" @click="reset">Cancel</UiButton>
      <UiButton type="button" :disabled="disabled || isLoading" @click="submit">
        {{ isLoading ? 'Processing…' : 'Submit' }}
      </UiButton>
    </UiCardFooter>
  </UiCard>
</template>

<script setup lang="ts">
import { ref } from 'vue'

withDefaults(defineProps<{
  title?: string
  description?: string
  disabled?: boolean
}>(), {
  title: 'Component title',
  description: 'Component description',
  disabled: false
})

const value = ref('')
const error = ref('')
const isLoading = ref(false)

function reset() {
  value.value = ''
  error.value = ''
}

async function submit() {
  isLoading.value = true
  error.value = ''

  try {
    // Add feature-specific work here.
  } catch {
    error.value = 'Please try again.'
  } finally {
    isLoading.value = false
  }
}
</script>