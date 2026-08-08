import { beforeEach, describe, expect, it } from 'vitest'
import { useColorTheme } from '~/composables/useColorTheme'

describe('useColorTheme', () => {
  beforeEach(() => {
    document.documentElement.removeAttribute('data-theme')
    // The `nuxt` test environment only partially implements localStorage.
    globalThis.localStorage?.clear?.()
  })

  it('defaults to light', () => {
    const { mode, isDark } = useColorTheme()
    expect(mode.value).toBe('light')
    expect(isDark.value).toBe(false)
  })

  it('toggles to dark and back', () => {
    const theme = useColorTheme()

    theme.toggle()
    expect(theme.mode.value).toBe('dark')
    expect(theme.isDark.value).toBe(true)

    theme.toggle()
    expect(theme.mode.value).toBe('light')
    expect(theme.isDark.value).toBe(false)
  })

  it('writes the DaisyUI data-theme attribute', async () => {
    const theme = useColorTheme()
    theme.toggle()
    await nextTick()
    expect(document.documentElement.getAttribute('data-theme')).toBe('dark')
  })
})
