# Testing Guide

Complete testing setup with Vitest, code coverage reporting, and best practices.

## Quick Start

```bash
# Run all tests
pnpm test

# Run tests in watch mode (rerun on file changes)
pnpm test --watch

# Run tests with UI dashboard
pnpm test:ui

# Generate coverage report
pnpm test:coverage
```

## Test Coverage

Coverage is configured with **70% threshold** for:
- Lines
- Functions
- Branches
- Statements

### Viewing Coverage Reports

After running `pnpm test:coverage`, open the HTML report:

```bash
open coverage/index.html  # macOS
xdg-open coverage/index.html  # Linux
start coverage/index.html  # Windows
```

### Coverage Output

Running tests generates:
- **Console output** — Summary in terminal
- **HTML report** — Detailed interactive report (`coverage/index.html`)
- **JSON report** — Machine-readable format (`coverage/coverage-final.json`)
- **LCOV report** — For CI/CD integration (`coverage/lcov.info`)

## Project Structure

```
tests/
├── unit/
│   ├── utils/
│   │   └── helpers.test.ts          # Tests for helper functions
│   ├── stores/
│   │   └── app.test.ts              # Tests for Zustand stores
│   ├── composables/
│   │   └── useApi.test.ts           # Tests for composables
│   └── example.test.ts              # Basic example tests
└── integration/                      # (Add integration tests here)
```

## Writing Tests

### Basic Test Structure

```typescript
import { describe, it, expect } from 'vitest'

describe('Feature Name', () => {
  it('should do something', () => {
    const result = someFunction()
    expect(result).toBe(expectedValue)
  })
})
```

### Example: Testing a Function

```typescript
// utils/helpers.ts
export function classNames(...classes: (string | boolean | undefined | null)[]): string {
  return classes.filter(Boolean).join(' ')
}

// tests/unit/utils/helpers.test.ts
import { describe, it, expect } from 'vitest'
import { classNames } from '~/utils/helpers'

describe('classNames', () => {
  it('should combine class strings', () => {
    const result = classNames('btn', 'btn-primary', 'btn-lg')
    expect(result).toBe('btn btn-primary btn-lg')
  })

  it('should filter out falsy values', () => {
    const result = classNames('btn', false, 'btn-primary', null, undefined)
    expect(result).toBe('btn btn-primary')
  })
})
```

### Example: Testing a Store

```typescript
// stores/app.ts
import { create } from 'zustand'

export const useAppStore = create<AppState>((set) => ({
  theme: 'light',
  setTheme: (theme) => set({ theme })
}))

// tests/unit/stores/app.test.ts
import { describe, it, expect, beforeEach } from 'vitest'
import { useAppStore } from '~/stores/app'

describe('App Store', () => {
  beforeEach(() => {
    useAppStore().setTheme('light') // Reset state
  })

  it('should initialize with light theme', () => {
    const store = useAppStore()
    expect(store.theme).toBe('light')
  })

  it('should change theme to dark', () => {
    const store = useAppStore()
    store.setTheme('dark')
    expect(store.theme).toBe('dark')
  })
})
```

### Example: Testing a Component

```typescript
// tests/unit/components/Button.test.ts
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Button from '~/components/Button.vue'

describe('Button Component', () => {
  it('renders correctly', () => {
    const wrapper = mount(Button, {
      props: {
        variant: 'primary'
      },
      slots: {
        default: 'Click me'
      }
    })
    expect(wrapper.text()).toContain('Click me')
  })

  it('applies variant class', () => {
    const wrapper = mount(Button, {
      props: { variant: 'primary' }
    })
    expect(wrapper.classes()).toContain('btn-primary')
  })
})
```

## Vitest Matchers

Common assertions you can use:

```typescript
// Equality
expect(value).toBe(5)                      // Strict equality (===)
expect(value).toEqual({ a: 1 })           // Deep equality
expect(value).toStrictEqual({ a: 1 })     // Strict deep equality

// Truthiness
expect(value).toBeTruthy()                 // Truthy value
expect(value).toBeFalsy()                  // Falsy value
expect(value).toBeNull()                   // null
expect(value).toBeUndefined()              // undefined
expect(value).toBeDefined()                // not undefined

// Numbers
expect(value).toBeGreaterThan(3)           // > 3
expect(value).toBeGreaterThanOrEqual(3.5)  // >= 3.5
expect(value).toBeLessThan(5)              // < 5
expect(value).toBeLessThanOrEqual(4.8)     // <= 4.8
expect(Math.sqrt(4)).toBeCloseTo(2)        // Floating point

// Strings
expect(value).toMatch(/pattern/)           // Regex match
expect(value).toContain('substring')       // Contains substring

// Arrays/Objects
expect(array).toContain(item)              // Array contains item
expect(array).toHaveLength(3)              // Array length
expect(obj).toHaveProperty('key')          // Object has property
expect(obj).toHaveProperty('key', 'value') // With value

// Functions
expect(fn).toThrow()                       // Function throws
expect(fn).toThrow(ErrorType)              // Throws specific error
expect(fn).toThrowError(/pattern/)         // Error matches pattern
```

## Mocking

### Mock Functions

```typescript
import { vi } from 'vitest'

// Create a mock function
const mockFn = vi.fn()

// Mock with return value
const mockFn = vi.fn().mockReturnValue(42)

// Mock with implementation
const mockFn = vi.fn((x) => x * 2)

// Check if called
expect(mockFn).toHaveBeenCalled()
expect(mockFn).toHaveBeenCalledTimes(3)
expect(mockFn).toHaveBeenCalledWith('arg1', 'arg2')
```

### Mock Modules

```typescript
import { vi } from 'vitest'

// Mock an entire module
vi.mock('~/server/utils/db', () => ({
  getDb: vi.fn().mockReturnValue({ query: vi.fn() })
}))

// Mock specific functions
vi.mock('~/utils/helpers', async () => {
  const actual = await vi.importActual('~/utils/helpers')
  return {
    ...actual,
    someFunction: vi.fn().mockReturnValue('mocked')
  }
})
```

## Hooks

### Setup and Teardown

```typescript
import { describe, it, beforeEach, afterEach, beforeAll, afterAll } from 'vitest'

describe('Test Suite', () => {
  beforeAll(() => {
    // Runs once before all tests
  })

  beforeEach(() => {
    // Runs before each test
  })

  afterEach(() => {
    // Runs after each test
  })

  afterAll(() => {
    // Runs once after all tests
  })

  it('test 1', () => {
    // Test code
  })
})
```

## Best Practices

### ✅ DO

- **Test behavior, not implementation** — Test what users see, not how it works
- **Keep tests focused** — One concept per test
- **Use descriptive names** — Test names should explain what they test
- **Arrange, Act, Assert** — Organize tests in three parts
- **Mock external dependencies** — Database, API calls, file system
- **Test edge cases** — Empty arrays, null values, errors
- **Keep tests fast** — Unit tests should be quick

### ❌ DON'T

- **Don't test implementation details** — Private functions, internal state
- **Don't create dependencies between tests** — Each test should be independent
- **Don't skip tests** — Remove them or fix them
- **Don't use hardcoded values** — Use variables or test data
- **Don't test framework code** — Trust Vue, Nuxt, Zustand
- **Don't write too many assertions** — One or few per test

## Test Organization Pattern

```typescript
import { describe, it, expect, beforeEach, vi } from 'vitest'

describe('Feature Module', () => {
  // Setup
  let testData: TestType

  beforeEach(() => {
    testData = createTestData()
  })

  // Group related tests
  describe('Successful cases', () => {
    it('should handle case 1', () => {
      const result = doSomething(testData)
      expect(result).toEqual(expectedValue)
    })

    it('should handle case 2', () => {
      // Test code
    })
  })

  // Group edge cases
  describe('Edge cases', () => {
    it('should handle empty input', () => {
      const result = doSomething(null)
      expect(result).toEqual(defaultValue)
    })

    it('should handle errors', () => {
      expect(() => doSomething(invalidData)).toThrow()
    })
  })
})
```

## Coverage Thresholds

Current thresholds in `vitest.config.ts`:
- **Lines**: 70%
- **Functions**: 70%
- **Branches**: 70%
- **Statements**: 70%

To increase coverage:
1. Write more tests
2. Test edge cases
3. Mock external dependencies
4. Test error scenarios

### Coverage Exclusions

These files/folders are excluded from coverage:
- `node_modules/`
- `tests/`
- `.nuxt/`
- `dist/`
- Configuration files (`*.config.ts`)
- Type definitions (`types/`)

## Running Tests in CI/CD

Add to your CI pipeline:

```bash
# Run tests
pnpm test

# Generate coverage
pnpm test:coverage

# Check coverage meets threshold (70%)
# (Vitest automatically checks this)
```

## Troubleshooting

### Tests not running
- Check file extension: must be `.test.ts` or `.test.tsx`
- Verify file is in `tests/` directory
- Run `pnpm test` instead of `npm test`

### Coverage not generated
- Run `pnpm test:coverage` specifically
- Check `coverage/` folder exists after running
- Ensure `@vitest/coverage-v8` is installed: `pnpm list @vitest/coverage-v8`

### Components not rendering in tests
- Install `@vue/test-utils`: `pnpm list @vue/test-utils`
- Use `mount()` from `@vue/test-utils`
- Mock Nuxt auto-imports if needed

### Mocks not working
- Clear mocks between tests: `vi.clearAllMocks()`
- Use `vi.mock()` at top level (not inside tests)
- Import mocked module after mock definition

## Resources

- [Vitest Docs](https://vitest.dev)
- [Vue Test Utils Docs](https://test-utils.vuejs.org)
- [Testing Library Best Practices](https://testing-library.com/docs)
- [Jest Matchers Reference](https://vitest.dev/api/expect.html)

## Next Steps

1. ✅ Run `pnpm test` to verify setup
2. ✅ View coverage: `pnpm test:coverage` → `open coverage/index.html`
3. ✅ Write tests for new features
4. ✅ Maintain 70%+ coverage threshold
5. ✅ Use `pnpm test:ui` for interactive testing
