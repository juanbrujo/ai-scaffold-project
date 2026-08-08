import { defineVitestConfig } from '@nuxt/test-utils/config'

// defineVitestConfig wires Nuxt's aliases, auto-imports and the `nuxt`
// environment, so tests can import from `~/...` exactly like app code.
export default defineVitestConfig({
  test: {
    globals: true,
    environment: 'nuxt',
    include: ['tests/**/*.test.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'text-summary', 'json', 'html', 'lcov'],
      // Only measure unit-testable app source. Two reasons for the explicit
      // list: without it `all: true` walks the whole repo (docs/, scripts, …)
      // and tanks the thresholds; and `server/` is deliberately out of scope
      // because those handlers need a live DATABASE_URL. Cover them with
      // integration tests (@nuxt/test-utils/e2e) against a real database
      // rather than by loosening this threshold.
      include: [
        'app/components/**/*.{ts,vue}',
        'app/composables/**/*.ts',
        'app/stores/**/*.ts',
        'shared/**/*.ts'
      ],
      exclude: ['**/*.config.ts', '**/types/**', '**/mockData/**'],
      thresholds: {
        lines: 70,
        functions: 70,
        branches: 70,
        statements: 70
      },
      all: true,
      cleanOnRerun: true
    }
  }
})
