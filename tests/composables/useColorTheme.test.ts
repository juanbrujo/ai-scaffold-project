import { beforeEach, describe, expect, it, vi } from 'vitest'
import { useColorTheme } from '~/composables/useColorTheme'

describe('useColorTheme', () => {
  beforeEach(() => {
    document.documentElement.classList.remove('dark')
    const values = new Map<string, string>()
    vi.stubGlobal('localStorage', {
      getItem: (key: string) => values.get(key) ?? null,
      setItem: (key: string, value: string) => values.set(key, value),
      removeItem: (key: string) => values.delete(key),
      clear: () => values.clear()
    })
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

  it('writes the shadcn-vue dark class', async () => {
    const theme = useColorTheme()
    theme.toggle()
    await nextTick()
    expect(document.documentElement.classList.contains('dark')).toBe(true)
  })
})
