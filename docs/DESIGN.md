# Respuestas - Design System

## Mission
Create implementation-ready design guidance for Respuestas that ensures consistency, accessibility, and fast delivery using **Tailwind CSS + DaisyUI** as the single source of truth.

## ⚡ Design System Rules

### DO ✅
- **ALWAYS** use DaisyUI components (`btn`, `card`, `alert`, `modal`, `input`, etc.)
- **ALWAYS** use Tailwind utility classes for spacing, sizing, and responsive design
- Use DaisyUI themes (`light`, `dark`) for theming—never hardcode colors
- Leverage semantic tokens: `bg-base-100`, `bg-base-200`, `text-base-content`, `border-base-300`
- Define component states through Tailwind modifiers: `hover:`, `focus:`, `disabled:`, `active:`
- Use responsive prefixes: `sm:`, `md:`, `lg:`, `xl:`, `2xl:`
- Document component variants through DaisyUI's native options
- Write accessibility into every component (WCAG 2.2 AA target)

### DON'T ❌
- **NEVER** use raw hex colors (`#FF0000`)—use theme tokens instead
- **NEVER** write custom CSS unless absolutely necessary
- **NEVER** import external UI libraries (Bootstrap, Material, Chakra, etc.)
- **NEVER** add inline `<style>` tags with custom properties
- **NEVER** create custom spacing values—use Tailwind's scale (1, 2, 3, 4, etc.)
- **NEVER** override DaisyUI component behavior without clear documentation
- **NEVER** skip keyboard navigation or focus states
- **NEVER** introduce visual inconsistencies from other design systems

## Style Foundations

### Typography
- **Font Family**: System fonts (Tailwind default: Ui-sans-serif)
- **Base Size**: `text-base` (16px)
- **Scale**: `text-xs`, `text-sm`, `text-base`, `text-lg`, `text-xl`, `text-2xl`, `text-3xl`, `text-4xl`
- **Weights**: Use `font-normal`, `font-semibold`, `font-bold` (avoid custom weights)
- **Line Heights**: `leading-relaxed`, `leading-normal`, `leading-tight`

### Color Palette (via DaisyUI Tokens)
```
Text:       text-base-content, text-base-content/60, text-base-content/40
Background: bg-base-100, bg-base-200, bg-base-300
Borders:    border-base-300, border-base-content/10
Accent:     text-primary, bg-primary (for interactive elements)
Error:      text-error, bg-error/10
Success:    text-success, bg-success/10
Warning:    text-warning, bg-warning/10
Info:       text-info, bg-info/10
```

### Spacing Scale (Tailwind)
```
2px (p-0.5)  →  4px (p-1)  →  8px (p-2)  →  12px (p-3)
16px (p-4)   →  20px (p-5) →  24px (p-6) →  32px (p-8)
40px (p-10)  →  48px (p-12) → 64px (p-16) → 96px (p-24)
```

### Border Radius (DaisyUI/Tailwind)
- `rounded-none` (0px) — sharp edges
- `rounded-sm` (0.125rem) — minimal
- `rounded` (0.25rem) — default
- `rounded-md` (0.375rem) — standard
- `rounded-lg` (0.5rem) — prominent
- `rounded-full` (9999px) — circular

### Shadows (DaisyUI)
- `shadow-sm` — minimal elevation
- `shadow` — default elevation
- `shadow-md` — medium elevation
- `shadow-lg` — prominent elevation

## Component Guidelines

### Buttons
```vue
<!-- Primary action -->
<button class="btn btn-primary">Label</button>

<!-- Secondary action -->
<button class="btn btn-secondary">Label</button>

<!-- Ghost/Tertiary -->
<button class="btn btn-ghost">Label</button>

<!-- Disabled state -->
<button class="btn btn-primary" disabled>Label</button>

<!-- Sizes -->
<button class="btn btn-sm">Small</button>
<button class="btn btn-md">Medium (default)</button>
<button class="btn btn-lg">Large</button>
```

### Cards
```vue
<div class="card bg-base-100 shadow-md">
  <div class="card-body">
    <h2 class="card-title">Title</h2>
    <p>Content goes here</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>
```

### Inputs & Forms
```vue
<input type="text" placeholder="Type here…" class="input input-bordered w-full" />
<textarea class="textarea textarea-bordered" placeholder="Bio"></textarea>
<select class="select select-bordered w-full">
  <option>Option 1</option>
</select>
```

### Alerts & Notifications
```vue
<!-- Success -->
<div class="alert alert-success">
  <svg class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4" />
  </svg>
  <span>Your purchase has been confirmed!</span>
</div>

<!-- Error -->
<div class="alert alert-error">
  <span>Error! Task failed successfully.</span>
</div>

<!-- Warning -->
<div class="alert alert-warning">
  <span>Warning: This action cannot be undone!</span>
</div>
```

### Navigation
```vue
<div class="navbar bg-base-100 shadow">
  <div class="flex-1">
    <a class="btn btn-ghost text-xl">App Name</a>
  </div>
  <div class="flex-none gap-2">
    <a href="#" class="link link-hover">Link 1</a>
    <button class="btn btn-primary">Action</button>
  </div>
</div>
```

## Responsive Design
```vue
<!-- Mobile-first approach -->
<div class="flex flex-col gap-4">
  <!-- Single column on mobile, 2 on tablet, 3 on desktop -->
  <div class="w-full md:w-1/2 lg:w-1/3">Card</div>
</div>

<!-- Grid example -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
  <!-- Responsive grid -->
</div>
```

## Themes
DaisyUI provides built-in themes. Set via `data-theme` attribute:
```html
<html data-theme="light">  <!-- or "dark" -->
```

Available theme variables:
- `primary`, `secondary`, `accent`
- `neutral`, `base-100`, `base-200`, `base-300`
- `success`, `warning`, `error`, `info`

## Accessibility Requirements
- **Keyboard Navigation**: All interactive elements must be keyboard accessible
- **Focus Visible**: Use `focus:outline focus:outline-2 focus:outline-offset-2`
- **ARIA Labels**: `aria-label`, `aria-describedby` for screen readers
- **Color Contrast**: Minimum 4.5:1 for text (DaisyUI ensures this)
- **Semantic HTML**: Use `<button>`, `<a>`, `<input>`, `<label>` properly
- **Focus Management**: Trap focus in modals, manage tab order

## State Management in Components
```vue
<!-- Loading state -->
<button class="btn loading">Loading</button>

<!-- Disabled state -->
<button class="btn" disabled>Disabled</button>

<!-- Active state (for selected items) -->
<button class="btn btn-active">Active</button>
```

## Writing Tone
- Concise and clear
- Action-oriented
- Use imperative verbs: "Save", "Delete", "Create"
- Avoid jargon
- Be helpful in error messages

## Anti-Patterns ❌
- ❌ `style="color: #FF0000"` → Use `text-error` instead
- ❌ `<div class="custom-button">Click</div>` → Use DaisyUI `btn` class
- ❌ `<div class="card" style="padding: 50px">` → Use DaisyUI spacing classes
- ❌ Mixing Bootstrap/Material classes with Tailwind
- ❌ Creating new color variables—use DaisyUI theme tokens
- ❌ Using `!important` to override Tailwind classes

## Migration Guide: Adding New Components
1. Check if DaisyUI has the component → Use it
2. If DaisyUI lacks it, build with Tailwind utilities + semantic tokens
3. Document the component with example usage
4. Test keyboard navigation and focus states
5. Add to component library in `components/`

## Quality Checklist
- [ ] Uses only Tailwind utilities and DaisyUI components
- [ ] No raw hex colors or inline styles
- [ ] Responsive design tested on mobile/tablet/desktop
- [ ] Keyboard navigation works (Tab, Enter, Escape)
- [ ] Focus states are visible (not hidden)
- [ ] Color contrast meets WCAG AA (4.5:1 minimum)
- [ ] Loading, disabled, error states defined
- [ ] Accessibility tested with screen reader
- [ ] Component matches design intent
- [ ] Code is documented and maintainable
