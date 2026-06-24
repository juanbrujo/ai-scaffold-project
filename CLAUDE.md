# Project Name - Development Guide

> This is a Nuxt3 + Tailwind + DaisyUI + Zustand + Vitest scaffold project.
> Replace "Project Name" with your actual project name.

## ⚡ Important: Always Use RTK

For all CLI operations use `rtk` to optimize token usage:
- `rtk grep <pattern>` instead of grep
- `rtk find <path>` instead of find
- `rtk ls <path>` instead of ls
- All bash commands automatically get wrapped with rtk via Claude Code hook
- This provides 60-90% token savings on dev operations

## Tech Stack

- **Framework**: Nuxt3 + Vue3 + TypeScript
- **Styling**: Tailwind CSS 3 + DaisyUI
- **State**: Zustand
- **Testing**: Vitest + Coverage (70% threshold)
- **Database**: NeonDB (PostgreSQL)
- **Build**: Vite
- **Quality Gates**: Husky (pre-commit, pre-push hooks)

## Project Commands

```bash
pnpm dev              # Start dev server (http://localhost:3000)
pnpm build            # Production build
pnpm test             # Run tests (watch mode)
pnpm test:ui          # Vitest UI dashboard
pnpm test:coverage    # Generate coverage report
```

## Key Directories

- `pages/` - Route components (auto-routed by Nuxt)
- `components/` - Reusable Vue components
- `composables/` - Composition API hooks
- `stores/` - Zustand state stores
- `server/api/` - Backend API routes
- `server/utils/db.ts` - Database connection utility
- `tests/` - Vitest test files
- `docs/` - Documentation (guides, design system, setup)
- `migrations/` - Database schema .sql files for NeonDB

## Database (NeonDB/PostgreSQL)

### Connection
- Configured via `server/utils/db.ts`
- Use `getDb()` function to get postgres client
- Set `DATABASE_URL` in `.env.local`

### Running Migrations
```bash
psql $DATABASE_URL < migrations/001_create_users_table.sql
```

See `migrations/README.md` for complete guide.

## Styling Guidelines (IMPORTANT)

**ALWAYS use Tailwind + DaisyUI. See `docs/DESIGN.md` for complete rules.**

### DO ✅
- Use DaisyUI components: `btn`, `card`, `alert`, `modal`, `input`, `navbar`, etc.
- Use Tailwind utilities: `flex`, `gap-4`, `p-6`, `text-lg`, `bg-base-100`
- Use theme tokens: `text-base-content`, `bg-base-200`, `border-base-300`
- Use responsive prefixes: `md:w-1/2`, `lg:grid-cols-3`, `sm:p-4`
- Leverage DaisyUI themes (`light`, `dark`)

### DON'T ❌
- Use raw hex colors (`#FF0000`) → Use `text-error`, `bg-primary` instead
- Write custom CSS unless absolutely necessary
- Import other UI libraries (Bootstrap, Material, Chakra)
- Add inline `<style>` with custom properties
- Create custom spacing values

→ See `docs/DESIGN.md` for complete component examples, accessibility rules, and patterns

## State Management

- Use Zustand stores in `stores/` directory
- Import stores with `useStore()` pattern
- Stores are defined with `create<StoreType>()` factory

Example:
```typescript
// stores/app.ts
import { create } from 'zustand'

interface AppState {
  count: number
  increment: () => void
}

export const useAppStore = create<AppState>((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 }))
}))
```

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
- ✅ No raw hex colors (#FF0000) — use theme tokens (text-error, bg-primary)
- ✅ No inline `<style>` with custom CSS — use Tailwind only
- ✅ DaisyUI components used where available
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
- **`docs/TAILWIND_DAISYUI_CHEATSHEET.md`** — Quick lookup for common patterns
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
