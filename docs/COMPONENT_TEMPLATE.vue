<!--
  COMPONENT TEMPLATE

  Use this template when creating new components.
  Ensures consistency with Tailwind + DaisyUI design system.

  ✅ DO: Use Tailwind utilities and DaisyUI classes
  ❌ DON'T: Use raw hex colors, custom CSS, or other UI libraries
-->

<template>
  <div class="component-wrapper">
    <!-- Example: DaisyUI card component -->
    <div class="card bg-base-100 shadow-md">
      <div class="card-body">
        <!-- Example: Responsive heading with Tailwind -->
        <h2 class="card-title text-lg md:text-xl lg:text-2xl">{{ title }}</h2>

        <!-- Example: Descriptive text with semantic tokens -->
        <p class="text-base-content/60 text-sm">{{ description }}</p>

        <!-- Example: Input with focus states -->
        <input
          type="text"
          placeholder="Type here…"
          class="input input-bordered w-full focus:outline focus:outline-2 focus:outline-offset-2"
          :disabled="isDisabled"
        />

        <!-- Example: Button states (default, hover, disabled, loading) -->
        <div class="card-actions justify-end gap-2 mt-4">
          <button
            class="btn btn-ghost"
            @click="handleCancel"
          >
            Cancel
          </button>
          <button
            class="btn btn-primary"
            :disabled="isLoading || isDisabled"
            :class="{ 'loading': isLoading }"
            @click="handleSubmit"
          >
            {{ isLoading ? 'Processing...' : 'Submit' }}
          </button>
        </div>

        <!-- Example: Error state with semantic color -->
        <div v-if="error" class="alert alert-error mt-4">
          <svg class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l-2-2m0 0l-2-2m2 2l2-2m-2 2l-2 2" />
          </svg>
          <span>{{ error }}</span>
        </div>

        <!-- Example: Success state -->
        <div v-if="success" class="alert alert-success mt-4">
          <svg class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4" />
          </svg>
          <span>{{ success }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

interface Props {
  title?: string
  description?: string
  disabled?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  title: 'Component Title',
  description: 'Component description goes here',
  disabled: false
})

const isLoading = ref(false)
const isDisabled = ref(props.disabled)
const error = ref('')
const success = ref('')

const handleCancel = () => {
  error.value = ''
  success.value = ''
}

const handleSubmit = async () => {
  isLoading.value = true
  error.value = ''
  success.value = ''

  try {
    // Your logic here
    success.value = 'Operation completed successfully!'
  } catch (err) {
    error.value = 'An error occurred. Please try again.'
  } finally {
    isLoading.value = false
  }
}
</script>

<!--
  STYLING RULES:

  ✅ GOOD: Use Tailwind classes and DaisyUI components
  - Spacing: p-4, gap-2, mt-4 (not custom pixel values)
  - Colors: bg-base-100, text-error, border-base-300 (not #FF0000)
  - States: focus:outline, disabled:, loading: (not custom :hover styles)
  - Responsive: md:text-xl, lg:grid-cols-3 (mobile-first)

  ❌ BAD: Avoid these patterns
  - <style scoped> with custom CSS
  - Inline style="color: #FF0000"
  - Custom padding like style="padding: 23px"
  - Importing Bootstrap, Material, or other UI libraries
  - Using !important to override Tailwind

  FOR MORE: See DESIGN.md for:
  - Complete DaisyUI component examples
  - Accessibility requirements
  - Color token reference
  - Spacing scale
  - Anti-patterns guide
-->

<style scoped>
/*
  OPTIONAL: Only add scoped styles if truly necessary.
  Prefer Tailwind utilities. Document WHY custom CSS is needed.

  Example of when custom CSS might be needed:
  - Complex animations (transition: transform 300ms ease-in-out)
  - Custom gradients (not available in Tailwind)
  - Specific layout techniques (CSS Grid edge cases)

  Even then, prefer Tailwind solutions first.
*/
.component-wrapper {
  /* Use Tailwind instead: <div class="flex flex-col gap-4"> */
}
</style>
