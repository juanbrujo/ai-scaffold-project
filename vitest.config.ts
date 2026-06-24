import { defineConfig } from 'vitest/config'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'

export default defineConfig({
  plugins: [vue()],
  test: {
    globals: true,
    environment: 'happy-dom',
    include: ['tests/**/*.test.ts', 'tests/**/*.test.tsx'],
    exclude: ['node_modules', 'dist', '.idea', '.git', '.cache'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'text-summary', 'json', 'html', 'lcov'],
      exclude: [
        'node_modules/',
        'tests/',
        '.nuxt/',
        'dist/',
        '**/*.config.ts',
        '**/types/**',
        '**/mockData/**'
      ],
      lines: 70,
      functions: 70,
      branches: 70,
      statements: 70,
      all: true,
      cleanOnRerun: true
    }
  },
  resolve: {
    alias: {
      '~': resolve(__dirname, './'),
      '#app': resolve(__dirname, './node_modules/nuxt/dist/app')
    }
  }
})
