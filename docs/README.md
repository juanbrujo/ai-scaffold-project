# Documentation

Complete project documentation and guides for this scaffold/project.

## 📚 Documentation Files

### [DESIGN.md](DESIGN.md)
Complete design system guide using Tailwind CSS + DaisyUI.
- DO's and DON'Ts
- Component guidelines (buttons, cards, forms, alerts, modals)
- Color tokens and spacing scale
- Responsive design patterns
- Accessibility requirements (WCAG 2.2 AA)
- Anti-patterns to avoid
- Quality checklist

**Read this before building UI components.**

### [TESTING.md](TESTING.md)
Complete guide to testing with Vitest.
- Quick start commands
- Writing unit tests
- Mocking strategies
- Coverage reports (70% threshold)
- Best practices
- Troubleshooting

**Read this before writing tests.**

### [HUSKY.md](HUSKY.md)
Git hooks automation guide.
- Pre-commit hook (runs tests)
- Pre-push hook (runs build)
- Customizing hooks
- Troubleshooting
- Team setup

**Hooks run automatically. See here if they're not working.**

### [TAILWIND_DAISYUI_CHEATSHEET.md](TAILWIND_DAISYUI_CHEATSHEET.md)
Quick reference for common Tailwind + DaisyUI patterns.
- DaisyUI component examples (copy-paste ready)
- Tailwind utility classes
- Responsive design patterns
- State modifiers (hover, focus, active, disabled)
- Color tokens reference
- DO ✅ vs DON'T ❌ comparisons

**Use this for quick lookups while coding.**

### [COMPONENT_TEMPLATE.vue](COMPONENT_TEMPLATE.vue)
Example Vue component showcasing best practices.
- Proper component structure
- Tailwind + DaisyUI usage
- State management (loading, error, success)
- Accessibility patterns
- Keyboard navigation
- Comments explaining each section

**Copy this template when creating new components.**

## 🎯 How to Use These Docs

1. **New to the project?** → Start with main `CLAUDE.md` and this `README.md`
2. **Building components?** → Check [DESIGN.md](DESIGN.md) + [COMPONENT_TEMPLATE.vue](COMPONENT_TEMPLATE.vue)
3. **Need quick syntax?** → Use [TAILWIND_DAISYUI_CHEATSHEET.md](TAILWIND_DAISYUI_CHEATSHEET.md)
4. **Writing tests?** → See [TESTING.md](TESTING.md)
5. **Git hook issues?** → Check [HUSKY.md](HUSKY.md)

## 🔗 Related Files

- **[../CLAUDE.md](../CLAUDE.md)** — Project configuration and conventions
- **[../README.md](../README.md)** — Project overview
- **[../README_SCAFFOLD.md](../README_SCAFFOLD.md)** — How to use this scaffold
- **[../SCAFFOLD_CONTENTS.md](../SCAFFOLD_CONTENTS.md)** — Complete file inventory
- **[../migrations/README.md](../migrations/README.md)** — Database migrations

## 💡 Key Principles

- **Tailwind + DaisyUI only** — No other CSS frameworks
- **No raw hex colors** — Use theme tokens (`text-error`, `bg-primary`)
- **Accessibility first** — WCAG 2.2 AA compliance
- **Mobile-first responsive** — Use `sm:`, `md:`, `lg:` prefixes
- **Semantic HTML** — Proper form, button, link tags
- **Keyboard navigation** — Every interactive element accessible
- **Tests required** — 70% coverage threshold
- **Quality gates** — Husky blocks bad commits/pushes

## 📖 External Resources

- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [DaisyUI Docs](https://daisyui.com/components)
- [Nuxt Documentation](https://nuxt.com)
- [Vue 3 Guide](https://vuejs.org)
- [Vitest Docs](https://vitest.dev)
- [Zustand Docs](https://github.com/pmndrs/zustand)

## 🚀 Quick Commands

```bash
# Development
pnpm dev              # Start dev server
pnpm build            # Production build
pnpm preview          # Preview build

# Testing
pnpm test             # Run tests
pnpm test:ui          # Tests UI dashboard
pnpm test:coverage    # Coverage report

# Quality (Automatic)
# Pre-commit: tests must pass
# Pre-push: build must succeed
```

---

Keep these docs updated as your project evolves.
