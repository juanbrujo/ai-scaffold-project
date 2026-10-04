# Project Name - Development Guide

> This is a Nuxt 4 + Tailwind 4 + shadcn-vue + Pinia + Vitest scaffold project.
> Replace "Project Name" with your actual project name.

## ⚡ Important: Always Use RTK

For all CLI operations use `rtk` to optimize token usage:
- `rtk grep <pattern>` instead of grep
- `rtk find <path>` instead of find
- `rtk ls <path>` instead of ls
- All bash commands automatically get wrapped with rtk via Claude Code hook
- This provides 60-90% token savings on dev operations

## Tech Stack

- **Framework**: Nuxt 4 + Vue 3 + TypeScript
- **Styling**: Tailwind CSS 4 + shadcn-vue (Reka UI)
- **State**: Pinia (official Vue/Nuxt store)
- **Testing**: Vitest 4 + `@nuxt/test-utils` + Coverage (70% threshold)
- **Linting**: ESLint 9 flat config via `@nuxt/eslint`
- **Database**: NeonDB (PostgreSQL) over HTTP
- **Build**: Vite
- **Quality Gates**: Husky (pre-commit, pre-push hooks)

## Node version

`package.json` pins `engines.node` to `^22.19.0 || ^24.11.0 || >=26.0.0` — the
range Nuxt 4.5 requires. Every other dependency is a subset of it, so Nuxt is
what sets the floor.

`.nvmrc` pins **24.19.0** (current active LTS):

```bash
nvm use          # reads .nvmrc
node -v          # v24.19.0
```

Odd-numbered lines (23, 25, …) are **not** supported: they are short-lived,
never become LTS, and are excluded from the range above. Things may appear to
work on them, but you are off the tested matrix.

pnpm only **warns** on an engine mismatch. To make it a hard failure, add to
`.pnpmrc`:

```
engine-strict=true
```

## Project Commands

```bash
pnpm dev              # Start dev server (http://localhost:3000)
pnpm build            # Production build
pnpm preview          # Serve the production build
pnpm test             # Run tests (watch mode)
pnpm test:run         # Run tests once — use this in CI and hooks
pnpm test:ui          # Vitest UI dashboard
pnpm test:coverage    # Coverage report + 70% threshold gate
pnpm lint             # ESLint
pnpm lint:fix         # ESLint with --fix
pnpm typecheck        # vue-tsc via nuxt typecheck
```

## Key Directories

Nuxt 4 puts client-side code under `app/`. The `~` alias resolves to `app/`,
and `~~` resolves to the project root.

- `app/app.vue` - Root component
- `app/pages/` - Route components (auto-routed by Nuxt)
- `app/components/` - Reusable Vue components (auto-imported)
- `app/composables/` - Composition API hooks (auto-imported)
- `app/layouts/` - Layout components
- `app/stores/` - Pinia state stores (auto-imported)
- `app/assets/css/main.css` - Tailwind entry point **and** Tailwind config
- `server/api/` - Backend API routes (Nitro)
- `server/utils/db.ts` - Database connection utility (auto-imported server-side)
- `shared/` - Types and helpers usable from both client and server
- `tests/` - Vitest test files
- `migrations/` - Database schema .sql files for NeonDB
- `docs/` - Documentation (guides, design system, setup)

## Database (NeonDB/PostgreSQL)

### Connection
- Configured via `server/utils/db.ts`, exposed as `getDb()` (auto-imported in `server/`)
- Uses `@neondatabase/serverless` over **HTTP**, so it is safe on serverless/edge
  runtimes where a long-lived TCP pool would not survive between invocations
- Set `DATABASE_URL` in `.env`; it is read through `runtimeConfig.databaseUrl`

```typescript
const sql = getDb()
const users = await sql`SELECT id, email FROM users WHERE id = ${id}`
```

Interpolated values become **bound parameters**, not string concatenation —
this is not SQL-injectable. Never build queries with `+` or `${}` inside a
plain string.

### Running Migrations
```bash
psql $DATABASE_URL -f migrations/001_create_users_table.sql
```

See `migrations/README.md` for the complete guide.

### Testing server code
`server/` is intentionally excluded from the coverage threshold: those handlers
need a live `DATABASE_URL`. Cover them with integration tests
(`@nuxt/test-utils/e2e`) against a real database rather than by loosening the
threshold in `vitest.config.ts`.

## Styling Guidelines (IMPORTANT)

**ALWAYS use Tailwind + shadcn-vue. See `docs/DESIGN.md` for complete rules.**

> **Tailwind 4 is CSS-first — there is no `tailwind.config.ts`.** Theme tokens,
> plugins and content sources live in `app/assets/css/main.css`. shadcn-vue
> configuration lives in `components.json`; add generated components with
> `pnpm dlx shadcn-vue@latest add <component>`.

### DO ✅
- Use shadcn-vue components: `UiButton`, `UiCard`, `UiAlert`, `UiDialog`, etc.
- Use Tailwind utilities: `flex`, `gap-4`, `p-6`, `text-lg`, `bg-background`
- Use theme tokens: `text-foreground`, `bg-card`, `border-border`
- Use responsive prefixes: `md:w-1/2`, `lg:grid-cols-3`, `sm:p-4`
- Use the `.dark` class and semantic tokens for dark mode

### DON'T ❌
- Use raw hex colors (`#FF0000`) → Use `text-error`, `bg-primary` instead
- Write custom CSS unless absolutely necessary
- Import other UI libraries (Bootstrap, Material, Chakra)
- Add inline `<style>` with custom properties
- Create custom spacing values

→ See `docs/DESIGN.md` for complete component examples, accessibility rules, and patterns

## State Management

- Use Pinia stores in `stores/` directory (auto-imported by `@pinia/nuxt`)
- Prefer the **setup store** syntax: `defineStore('id', () => { ... })`
- Import `ref`/`computed` explicitly from `vue` so stores also work under plain Vitest
- Consume in components with `const store = useCounterStore()`
- Destructure reactive state with `storeToRefs(store)` (actions destructure directly)

Example:
```typescript
// stores/counter.ts
import { computed, ref } from 'vue'
import { defineStore } from 'pinia'

export const useCounterStore = defineStore('counter', () => {
  const count = ref(0)
  const double = computed(() => count.value * 2)

  function increment() {
    count.value++
  }

  return { count, double, increment }
})
```

In a component:
```vue
<script setup lang="ts">
import { storeToRefs } from 'pinia'

const counter = useCounterStore()
const { count, double } = storeToRefs(counter)
</script>
```

In tests, activate a fresh Pinia per test:
```typescript
beforeEach(() => setActivePinia(createPinia()))
```

> Do **not** use Zustand here — it is a React-oriented library. Pinia is the
> official Vue/Nuxt store and integrates with SSR, devtools, and auto-imports.

## Testing & Quality Gates

### Vitest Configuration
- Write tests in `tests/` directory
- Use `.test.ts` extension for unit tests
- Coverage threshold: **70%** (lines, functions, branches, statements)
- See `docs/TESTING.md` for complete guide

### Husky Git Hooks (Automated)
- **Pre-commit**: Runs `pnpm test` before commit
  - Prevents committing broken code
  - If tests fail, commit is blocked
- **Pre-push**: Runs `pnpm build` before push
  - Ensures production build works
  - If build fails, push is blocked

Bypass with: `git commit --no-verify` or `git push --no-verify` (not recommended!)

See `docs/HUSKY.md` for details.

## Design System Review Checklist

When reviewing or creating components, verify:
- ✅ No raw hex colors (#FF0000) — use semantic theme tokens
- ✅ No inline `<style>` with custom CSS — use Tailwind only
- ✅ shadcn-vue components used where available
- ✅ Responsive design: `sm:`, `md:`, `lg:` prefixes present
- ✅ Keyboard navigation works: Tab, Enter, Escape
- ✅ Focus states visible (not hidden)
- ✅ Disabled, loading, error states handled
- ✅ WCAG AA color contrast met
- ✅ No external UI libraries imported (Bootstrap, Material, etc.)

→ Full checklist in `docs/DESIGN.md` → Quality Checklist section

## Documentation & References

### In `/docs/` folder:
- **`docs/DESIGN.md`** — Complete design system (rules, components, accessibility)
- **`docs/TESTING.md`** — Vitest guide (unit tests, mocking, coverage)
- **`docs/HUSKY.md`** — Git hooks automation (pre-commit, pre-push)
- **`docs/TAILWIND_SHADCN_CHEATSHEET.md`** — Quick lookup for common patterns
- **`docs/COMPONENT_TEMPLATE.vue`** — Example component with best practices

### In `/migrations/` folder:
- **`migrations/README.md`** — Database migration guide and best practices
- Add new migrations sequentially: `001_*.sql`, `002_*.sql`, etc.

## Environment Setup

1. Copy `.env.example` to `.env.local`
2. Add your NeonDB connection string to `DATABASE_URL`
3. Install dependencies: `pnpm install`
4. Start dev server: `pnpm dev`

## Project-Specific Notes

<!-- Add project-specific guidelines here -->

---

**Keep this guide updated as project conventions evolve.**
