import { beforeEach, describe, expect, it } from 'vitest'
import { createPinia, setActivePinia } from 'pinia'
import { mountSuspended } from '@nuxt/test-utils/runtime'
import CounterCard from '~/components/CounterCard.vue'

describe('CounterCard', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('renders the initial count', async () => {
    const wrapper = await mountSuspended(CounterCard)
    expect(wrapper.get('[data-testid="count"]').text()).toBe('0')
  })

  it('increments when the button is clicked', async () => {
    const wrapper = await mountSuspended(CounterCard)
    const buttons = wrapper.findAll('button')
    const increment = buttons[buttons.length - 1]!

    await increment.trigger('click')

    expect(wrapper.get('[data-testid="count"]').text()).toBe('1')
    expect(wrapper.text()).toContain('double: 2')
  })
})
