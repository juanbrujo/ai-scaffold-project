# Project Name

> Replace "Project Name" with your actual project name.

Brief description of what this project does.

## Tech Stack

- **Frontend**: Nuxt3, Vue3, TypeScript
- **Styling**: Tailwind CSS 3, DaisyUI
- **State Management**: Zustand
- **Testing**: Vitest (70% coverage threshold)
- **Database**: NeonDB (PostgreSQL)
- **Build Tool**: Vite
- **Quality Gates**: Husky (Git hooks)

## Quick Start

### Installation

```bash
pnpm install
```

> This project uses **pnpm** as package manager. Install it: `npm i -g pnpm`

### Environment Setup

```bash
cp .env.example .env.local
```

Edit `.env.local` and add your NeonDB connection string:
```
DATABASE_URL=postgresql://user:password@host:5432/database
```

### Run Development Server

```bash
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000)

## Available Scripts

```bash
# Development
pnpm dev              # Start dev server

# Build & Preview
pnpm build            # Production build
pnpm preview          # Preview production build
pnpm generate         # Generate static site

# Testing
pnpm test             # Run tests
pnpm test:ui          # Tests with UI dashboard
pnpm test:coverage    # Generate coverage report (70% threshold)

# Quality
pnpm lint             # Lint code

# Git Hooks (Automatic)
# - Pre-commit: Tests must pass
# - Pre-push: Build must succeed
```

## Project Structure

```
.
├── docs/              # 📚 Documentation (guides, design system)
│   ├── DESIGN.md      # Tailwind + DaisyUI design system
│   ├── TESTING.md     # Testing guide
│   ├── HUSKY.md       # Git hooks guide
│   └── ...
├── migrations/        # 🗄️ Database migrations (.sql files)
├── pages/             # Routes (auto-routed by Nuxt)
├── components/        # Reusable Vue components
├── composables/       # Composition API hooks
├── stores/            # Zustand state stores
├── server/
│   ├── api/           # Backend API routes
│   └── utils/         # Server utilities (db connection)
├── tests/             # Tests with Vitest
├── assets/            # CSS and static assets
└── layouts/           # Page layouts
```

## Documentation

- **[CLAUDE.md](CLAUDE.md)** — Development guide and conventions
- **[docs/DESIGN.md](docs/DESIGN.md)** — Design system (Tailwind + DaisyUI)
- **[docs/TESTING.md](docs/TESTING.md)** — Testing guide (Vitest)
- **[docs/HUSKY.md](docs/HUSKY.md)** — Git hooks automation
- **[docs/TAILWIND_DAISYUI_CHEATSHEET.md](docs/TAILWIND_DAISYUI_CHEATSHEET.md)** — Quick reference
- **[migrations/README.md](migrations/README.md)** — Database migrations

## Development Workflow

### 1. Create a Feature Branch
```bash
git checkout -b feature/my-feature
```

### 2. Make Changes
- Create components in `components/`
- Add pages in `pages/`
- Write tests in `tests/`
- Use Tailwind + DaisyUI for styling

### 3. Before Committing
```bash
# Tests run automatically (Husky pre-commit hook)
git add .
git commit -m "Add my feature"
# → Tests run automatically

# If tests pass ✅ → Commit created
# If tests fail ❌ → Commit blocked, fix and try again
```

### 4. Before Pushing
```bash
git push
# → Build runs automatically (Husky pre-push hook)
# → If build passes ✅ → Push succeeds
# → If build fails ❌ → Push blocked, fix and try again
```

## Testing

```bash
# Run tests
pnpm test

# View coverage
pnpm test:coverage
open coverage/index.html

# Tests with UI
pnpm test:ui

# Watch mode (default)
pnpm test --watch

# Run specific test file
pnpm test tests/unit/stores/app.test.ts
```

**Coverage Threshold**: 70% (lines, functions, branches, statements)

See `docs/TESTING.md` for complete testing guide.

## Database

### Running Migrations
```bash
psql $DATABASE_URL < migrations/001_create_users_table.sql
```

### Connecting in Code
```typescript
import { getDb } from '~/server/utils/db'

export default defineEventHandler(async () => {
  const sql = getDb()
  const result = await sql`SELECT * FROM users LIMIT 10`
  return result
})
```

See `migrations/README.md` for complete migration guide.

## Styling

Uses **Tailwind CSS 3** + **DaisyUI** for all styling.

- ✅ Use DaisyUI components: `btn`, `card`, `alert`, `modal`, etc.
- ✅ Use Tailwind utilities: `flex`, `gap-4`, `p-6`, `text-lg`
- ✅ Use theme tokens: `text-base-content`, `bg-base-100`, `border-base-300`
- ❌ No raw hex colors
- ❌ No custom CSS (unless absolutely necessary)
- ❌ No other UI libraries (Bootstrap, Material, etc.)

See `docs/DESIGN.md` for complete design system.

## Automated Quality Gates

**Husky** automatically enforces quality:

- **Pre-commit**: Tests must pass before creating a commit
- **Pre-push**: Build must succeed before pushing to remote

If checks fail, the action is blocked. Fix the issue and try again.

See `docs/HUSKY.md` for details and how to customize.

## Contributing

1. Follow the [design system](docs/DESIGN.md) guidelines
2. Write tests for new features
3. Ensure tests pass: `pnpm test`
4. Ensure build works: `pnpm build`
5. Use meaningful commit messages

## Deployment

```bash
# Build for production
pnpm build

# Preview the build
pnpm preview

# Or deploy the .output directory to your hosting
```

## Resources

- [Nuxt Documentation](https://nuxt.com)
- [Vue 3 Guide](https://vuejs.org)
- [Tailwind CSS](https://tailwindcss.com)
- [DaisyUI Components](https://daisyui.com)
- [Zustand](https://github.com/pmndrs/zustand)
- [Vitest](https://vitest.dev)

## License

[Your License Here]
