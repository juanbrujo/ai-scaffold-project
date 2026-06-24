# Nuxt3 + Tailwind + DaisyUI + Zustand + Vitest Scaffold

Production-ready scaffold for starting new Nuxt3 projects with complete tooling, testing, quality gates, and documentation.

## What's Included

### ⚡ Framework & Tools
- **Nuxt3** + Vue3 + TypeScript
- **Tailwind CSS 3** + **DaisyUI** (design system)
- **Zustand** (state management)
- **Vitest** (testing + 70% coverage threshold)
- **Vite** (build tool)
- **NeonDB/PostgreSQL** (database)
- **Husky** (Git hooks for quality)

### 📚 Documentation
- Complete design system guide
- Testing and coverage guide
- Git hooks automation guide
- Quick reference cheatsheet
- Component template example

### 🔒 Quality Automation
- Pre-commit hooks (run tests)
- Pre-push hooks (run build)
- 70% code coverage threshold
- TypeScript strict mode

### 🗄️ Database
- NeonDB/PostgreSQL migrations
- Database connection utilities
- Example migration files

## How to Use This Scaffold

### Option 1: Clone and Customize (Recommended)

```bash
# Clone or download this scaffold
git clone <scaffold-repo-url> my-project
cd my-project

# Remove scaffold marker
rm README_SCAFFOLD.md

# Update project name and description
sed -i '' 's/Project Name/Your Project Name/g' CLAUDE.md README.md package.json

# Initialize git
git init
git add .
git commit -m "Initial commit from scaffold"

# Install dependencies
pnpm install

# Start developing
pnpm dev
```

### Option 2: Create Project from Scratch Using Files

Copy individual files from this scaffold to your new project:

**Essential files to copy:**
- `package.json` — Dependencies and scripts
- `nuxt.config.ts` — Nuxt configuration
- `tailwind.config.ts` — Tailwind setup
- `tsconfig.json` — TypeScript config
- `vitest.config.ts` — Test configuration
- `postcss.config.ts` — PostCSS setup
- `.pnpmrc` — pnpm settings
- `.gitignore` — Git ignore rules
- `.eslintignore` — ESLint ignore
- `.husky/` — Git hooks
- `docs/` — All documentation
- `CLAUDE.md` — Development guide
- `README.md` — Project readme template
- `.env.example` — Environment template

## File Structure in Scaffold

```
scaffold/
├── package.json                        # Dependencies (update name, version)
├── nuxt.config.ts                      # Nuxt configuration
├── tailwind.config.ts                  # Tailwind + DaisyUI config
├── tsconfig.json                       # TypeScript config
├── vitest.config.ts                    # Test configuration
├── postcss.config.ts                   # PostCSS setup
├── .pnpmrc                             # pnpm configuration
├── .gitignore                          # Git ignore rules
├── .eslintignore                       # ESLint ignore rules
├── .env.example                        # Environment template
├── .husky/                             # Git hooks
│   ├── pre-commit                      # Run tests before commit
│   └── pre-push                        # Run build before push
├── docs/                               # Complete documentation
│   ├── DESIGN.md                       # Design system
│   ├── TESTING.md                      # Testing guide
│   ├── HUSKY.md                        # Git hooks guide
│   ├── TAILWIND_DAISYUI_CHEATSHEET.md  # Quick reference
│   └── COMPONENT_TEMPLATE.vue          # Example component
├── CLAUDE.md                           # Development conventions
└── README.md                           # Project readme template
```

## Quick Setup for New Project

```bash
# 1. Copy scaffold contents to your new project
mkdir my-new-project
cp -r scaffold/* my-new-project/
cd my-new-project

# 2. Edit package.json with your project details
# - Change "name" from "project-name" to your actual project name
# - Update version if needed
# - Update any other project-specific settings

# 3. Edit README.md
# - Replace "Project Name" with actual name
# - Update description
# - Add any project-specific sections

# 4. Edit CLAUDE.md (optional)
# - Add project-specific notes in the "Project-Specific Notes" section
# - Customize any conventions

# 5. Install dependencies
pnpm install

# 6. Initialize git and Husky
git init
git add .
git commit -m "Initial commit"
pnpm exec husky install

# 7. Setup environment
cp .env.example .env.local
# Edit .env.local with your actual values

# 8. Run database migrations (if needed)
psql $DATABASE_URL < migrations/001_create_users_table.sql

# 9. Start developing
pnpm dev
```

## What Each File Does

### Configuration Files
- **package.json** — NPM/pnpm dependencies and scripts
- **nuxt.config.ts** — Nuxt3 configuration, Tailwind integration
- **tailwind.config.ts** — Tailwind + DaisyUI theme setup
- **tsconfig.json** — TypeScript strict mode configuration
- **vitest.config.ts** — Vitest testing setup with coverage (70% threshold)
- **postcss.config.ts** — PostCSS plugin configuration
- **.pnpmrc** — pnpm-specific settings

### Git & Quality
- **.gitignore** — Files to exclude from version control
- **.eslintignore** — Files to exclude from linting
- **.husky/pre-commit** — Auto-runs tests before commits
- **.husky/pre-push** — Auto-runs build before pushes

### Documentation
- **CLAUDE.md** — Development guide with conventions and commands
- **README.md** — Template for project documentation
- **docs/DESIGN.md** — Complete design system (Tailwind + DaisyUI)
- **docs/TESTING.md** — Testing guide with examples
- **docs/HUSKY.md** — Git hooks automation guide
- **docs/TAILWIND_DAISYUI_CHEATSHEET.md** — Quick reference for common patterns
- **docs/COMPONENT_TEMPLATE.vue** — Example component following best practices

### Environment
- **.env.example** — Template for environment variables

## Default NPM Scripts

All projects created from this scaffold include:

```bash
pnpm dev              # Development server
pnpm build            # Production build
pnpm preview          # Preview production build
pnpm generate         # Generate static site
pnpm lint             # Lint code
pnpm test             # Run tests
pnpm test:ui          # Tests UI dashboard
pnpm test:coverage    # Coverage report
```

## Technologies Explained

### Nuxt3 + Vue3
- Modern full-stack meta-framework
- File-based routing (pages/)
- Server-side rendering ready
- TypeScript support built-in

### Tailwind CSS 3 + DaisyUI
- Utility-first CSS framework
- Pre-built component library (DaisyUI)
- Zero runtime CSS-in-JS
- Full design system support

### Zustand
- Lightweight state management
- Minimal boilerplate
- Great TypeScript support
- Perfect for medium-sized apps

### Vitest
- Lightning-fast unit testing
- Drop-in Jest replacement
- Built for Vite
- 70% coverage threshold enforced

### Husky + Git Hooks
- Prevent bad commits (tests must pass)
- Prevent failed builds from pushing
- Customizable for each project

### NeonDB/PostgreSQL
- Serverless PostgreSQL database
- Full SQL support
- Easy migrations
- Connection pooling included

## Customization Guide

### Change Design System
Edit `docs/DESIGN.md` to reflect your brand colors, typography, spacing.

### Adjust Coverage Threshold
Edit `vitest.config.ts` coverage settings (currently 70%).

### Customize Git Hooks
Edit `.husky/pre-commit` and `.husky/pre-push` to add/remove checks.

### Add Database Tables
Create new files in `migrations/` following the naming pattern: `003_*.sql`

### Extend Documentation
Add sections to `CLAUDE.md` and `docs/` as your project grows.

## Troubleshooting

### "pnpm not found"
```bash
npm install -g pnpm
```

### Tests failing after setup
Ensure you've run `pnpm install` and have Node 18+.

### Husky hooks not running
```bash
# Reinstall Husky
pnpm exec husky install

# Make hooks executable
chmod +x .husky/pre-commit
chmod +x .husky/pre-push
```

### Coverage not generating
Run `pnpm test:coverage` explicitly (not just `pnpm test`).

## Next Steps After Setup

1. ✅ Update `package.json` with your project name
2. ✅ Update `README.md` with project description
3. ✅ Setup `.env.local` with actual values
4. ✅ Create your first page in `pages/`
5. ✅ Write tests in `tests/`
6. ✅ Use components from `docs/COMPONENT_TEMPLATE.vue` as examples
7. ✅ Review `docs/DESIGN.md` before building UI
8. ✅ Make a test commit to verify Husky hooks work

## Repository Maintenance

### Updating Scaffold
To keep projects up-to-date with scaffold improvements:

1. Keep scaffold in its own repository
2. Add upstream remote: `git remote add scaffold <scaffold-url>`
3. Pull updates: `git pull scaffold main`
4. Resolve conflicts
5. Test thoroughly before merging

### Contributing Back
If you improve the scaffold, consider:
1. Opening a PR against the scaffold repository
2. Sharing improvements with team
3. Documenting any new patterns

## Support & Resources

- [Nuxt Docs](https://nuxt.com)
- [Vue 3 Docs](https://vuejs.org)
- [Tailwind Docs](https://tailwindcss.com)
- [DaisyUI Docs](https://daisyui.com)
- [Zustand Repo](https://github.com/pmndrs/zustand)
- [Vitest Docs](https://vitest.dev)

## License

Use this scaffold freely for your projects.

---

**Happy building! 🚀**
