import { computed } from 'vue'
import { useColorMode } from '@vueuse/core'

/**
 * Thin wrapper over VueUse's color mode, bound to the DaisyUI `data-theme`
 * attribute so the two themes declared in `main.css` apply.
 */
export function useColorTheme() {
  const mode = useColorMode<'light' | 'dark'>({
    attribute: 'data-theme',
    modes: { light: 'light', dark: 'dark' }
  })

  const isDark = computed(() => mode.value === 'dark')

  function toggle() {
    mode.value = isDark.value ? 'light' : 'dark'
  }

  return { mode, isDark, toggle }
}
