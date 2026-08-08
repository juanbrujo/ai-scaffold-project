import { beforeEach, describe, expect, it } from 'vitest'
import { createPinia, setActivePinia } from 'pinia'
import { useCounterStore } from '~/stores/counter'

describe('counter store', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('starts at zero', () => {
    const store = useCounterStore()
    expect(store.count).toBe(0)
    expect(store.double).toBe(0)
  })

  it('increments and derives double', () => {
    const store = useCounterStore()
    store.increment()
    store.increment()
    expect(store.count).toBe(2)
    expect(store.double).toBe(4)
  })

  it('resets back to zero', () => {
    const store = useCounterStore()
    store.increment()
    store.reset()
    expect(store.count).toBe(0)
  })
})
