import { computed } from 'vue'
import { useColorMode } from '@vueuse/core'

/**
 * Thin wrapper over VueUse's color mode. The `.dark` class selects the
 * shadcn-vue dark design tokens declared in `main.css`.
 */
export function useColorTheme() {
  const mode = useColorMode<'light' | 'dark'>({
    attribute: 'class',
    modes: { light: '', dark: 'dark' }
  })

  const isDark = computed(() => mode.value === 'dark')

  function toggle() {
    mode.value = isDark.value ? 'light' : 'dark'
  }

  return { mode, isDark, toggle }
}
