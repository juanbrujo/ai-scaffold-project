# Tailwind + DaisyUI Quick Reference

> Always refer to [DESIGN.md](DESIGN.md) for complete guidelines. This is a quick cheatsheet.

## DaisyUI Components (Always Use These First!)

### Buttons
```vue
<button class="btn">Default</button>
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-accent">Accent</button>
<button class="btn btn-ghost">Ghost</button>
<button class="btn btn-link">Link</button>

<!-- Sizes -->
<button class="btn btn-xs">XS</button>
<button class="btn btn-sm">Small</button>
<button class="btn btn-md">Medium</button>
<button class="btn btn-lg">Large</button>

<!-- States -->
<button class="btn" disabled>Disabled</button>
<button class="btn loading">Loading</button>
<button class="btn btn-active">Active</button>
<button class="btn btn-block">Full Width</button>
```

### Cards
```vue
<div class="card bg-base-100 shadow-md">
  <div class="card-body">
    <h2 class="card-title">Card Title</h2>
    <p>Card content</p>
    <div class="card-actions justify-end">
      <button class="btn">Action</button>
    </div>
  </div>
</div>

<!-- Side-by-side image + content -->
<div class="card card-side bg-base-100 shadow-md">
  <figure><img src="image.jpg" alt="Album" /></figure>
  <div class="card-body">
    <h2 class="card-title">Title</h2>
  </div>
</div>
```

### Inputs & Selects
```vue
<!-- Text Input -->
<input type="text" placeholder="Type…" class="input input-bordered w-full" />

<!-- Textarea -->
<textarea class="textarea textarea-bordered" placeholder="Bio"></textarea>

<!-- Select -->
<select class="select select-bordered w-full">
  <option>Option 1</option>
</select>

<!-- Input with error -->
<input type="email" class="input input-bordered input-error w-full" />

<!-- Input with focus -->
<input type="text" class="input input-bordered focus:outline focus:outline-2 focus:outline-offset-2" />
```

### Alerts & Notifications
```vue
<!-- Success -->
<div class="alert alert-success">
  <svg class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4" />
  </svg>
  <span>Success message!</span>
</div>

<!-- Error -->
<div class="alert alert-error">
  <span>Error message!</span>
</div>

<!-- Warning -->
<div class="alert alert-warning">
  <span>Warning message!</span>
</div>

<!-- Info -->
<div class="alert alert-info">
  <span>Info message!</span>
</div>
```

### Modal
```vue
<!-- Trigger button -->
<button class="btn" onclick="my_modal_1.showModal()">Open Modal</button>

<!-- Modal -->
<dialog id="my_modal_1" class="modal">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Modal Title</h3>
    <p class="py-4">Modal content goes here</p>
    <div class="modal-action">
      <form method="dialog">
        <button class="btn">Cancel</button>
      </form>
      <button class="btn btn-primary">Confirm</button>
    </div>
  </div>
</dialog>
```

### Navbar
```vue
<div class="navbar bg-base-100 shadow">
  <div class="flex-1">
    <a class="btn btn-ghost text-xl">Logo</a>
  </div>
  <div class="flex-none gap-2">
    <a href="/" class="link link-hover">Home</a>
    <a href="/about" class="link link-hover">About</a>
    <button class="btn btn-primary">Sign in</button>
  </div>
</div>
```

### Badge
```vue
<div class="badge">Default</div>
<div class="badge badge-primary">Primary</div>
<div class="badge badge-lg">Large</div>
<div class="badge badge-outline">Outline</div>
```

### Divider
```vue
<div class="divider"></div>
<div class="divider">OR</div>
```

## Tailwind Utilities (For Layout & Spacing)

### Display & Layout
```vue
<!-- Flexbox -->
<div class="flex gap-4">
  <div>Item 1</div>
  <div>Item 2</div>
</div>

<!-- Grid -->
<div class="grid grid-cols-3 gap-4">
  <div>Cell 1</div>
  <div>Cell 2</div>
  <div>Cell 3</div>
</div>

<!-- Responsive Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
  <div>Responsive Cell</div>
</div>

<!-- Flex Column (Stack) -->
<div class="flex flex-col gap-2">
  <div>Stacked Item</div>
</div>
```

### Spacing (Padding & Margin)
```vue
<!-- Padding -->
<div class="p-4">All sides: 16px</div>
<div class="px-4 py-2">Horizontal 16px, Vertical 8px</div>
<div class="pt-4">Top: 16px</div>

<!-- Margin -->
<div class="mb-4">Bottom: 16px</div>
<div class="m-auto">Center (auto margin)</div>
<div class="gap-4">Gap between flex/grid items: 16px</div>
```

### Size (Width & Height)
```vue
<!-- Width -->
<div class="w-full">100%</div>
<div class="w-1/2">50%</div>
<div class="w-1/3">33%</div>
<div class="max-w-md">Max width: medium</div>

<!-- Height -->
<div class="h-screen">Full screen height</div>
<div class="h-64">Height: 256px</div>
<div class="min-h-screen">Minimum screen height</div>
```

### Typography
```vue
<!-- Font Size -->
<div class="text-xs">Extra small: 12px</div>
<div class="text-sm">Small: 14px</div>
<div class="text-base">Base: 16px</div>
<div class="text-lg">Large: 18px</div>
<div class="text-xl">X-Large: 20px</div>
<div class="text-2xl">2X-Large: 24px</div>

<!-- Font Weight -->
<div class="font-normal">Normal: 400</div>
<div class="font-semibold">Semibold: 600</div>
<div class="font-bold">Bold: 700</div>

<!-- Text Align & Color -->
<div class="text-center">Centered</div>
<div class="text-base-content">Primary text color</div>
<div class="text-base-content/60">Secondary (60% opacity)</div>
<div class="text-error">Error color</div>
<div class="text-success">Success color</div>
```

### Background & Borders
```vue
<!-- Background Colors (use theme tokens) -->
<div class="bg-base-100">Primary background</div>
<div class="bg-base-200">Secondary background</div>
<div class="bg-primary">Primary accent</div>
<div class="bg-error">Error background</div>
<div class="bg-success">Success background</div>

<!-- Borders -->
<div class="border border-base-300">1px solid border</div>
<div class="border-t-2 border-primary">Top border</div>
<div class="rounded-lg">Border radius</div>
```

### Shadow & Effects
```vue
<!-- Shadows -->
<div class="shadow-sm">Small shadow</div>
<div class="shadow-md">Medium shadow (default card)</div>
<div class="shadow-lg">Large shadow</div>

<!-- Opacity -->
<div class="opacity-50">50% opacity</div>
<div class="opacity-0">Hidden (0%)</div>
```

## Responsive Design (Mobile-First)

```vue
<!-- Base size on mobile, changes at breakpoints -->
<div class="text-sm md:text-base lg:text-lg">
  Responsive text size
</div>

<!-- Hide on mobile, show on md and above -->
<div class="hidden md:block">Desktop only</div>

<!-- Grid: 1 col mobile, 2 tablet, 3 desktop -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
  <div>Responsive</div>
</div>
```

### Breakpoints
- `sm:` → 640px (tablets)
- `md:` → 768px (tablets/small laptops)
- `lg:` → 1024px (laptops)
- `xl:` → 1280px (large screens)
- `2xl:` → 1536px (extra large)

## State Modifiers

```vue
<!-- Hover -->
<button class="btn hover:shadow-lg">Hover effect</button>

<!-- Focus (keyboard/click) -->
<input class="input focus:outline focus:outline-2 focus:outline-offset-2" />

<!-- Active -->
<button class="btn btn-active">Active</button>

<!-- Disabled -->
<button class="btn" disabled>Disabled</button>

<!-- Group hover (hover parent = style child) -->
<div class="group hover:bg-base-200">
  <div class="group-hover:text-primary">Child text changes</div>
</div>
```

## Color Tokens (Never Use Hex!)

```vue
<!-- Text Colors -->
<div class="text-base-content">Primary text</div>
<div class="text-base-content/60">Secondary (muted)</div>
<div class="text-base-content/40">Tertiary (more muted)</div>

<!-- Background Colors -->
<div class="bg-base-100">Primary</div>
<div class="bg-base-200">Secondary</div>
<div class="bg-base-300">Tertiary</div>

<!-- Semantic Colors -->
<div class="text-success">Success message</div>
<div class="text-warning">Warning message</div>
<div class="text-error">Error message</div>
<div class="text-info">Info message</div>

<!-- Accent Colors -->
<div class="text-primary">Primary accent</div>
<div class="text-secondary">Secondary accent</div>
<div class="text-accent">Tertiary accent</div>
```

## DO ✅ vs DON'T ❌

### Text Colors
```vue
<!-- ✅ GOOD -->
<p class="text-error">Error message</p>
<p class="text-success">Success</p>
<p class="text-base-content/60">Secondary text</p>

<!-- ❌ BAD -->
<p style="color: #FF0000">Error message</p>
<p style="color: #00AA00">Success</p>
<p class="text-gray-500">Secondary</p> <!-- not a theme token -->
```

### Spacing
```vue
<!-- ✅ GOOD -->
<div class="flex gap-4">
  <div class="p-4">Item</div>
</div>

<!-- ❌ BAD -->
<div style="display: flex; gap: 20px">
  <div style="padding: 23px">Item</div>
</div>
```

### Buttons
```vue
<!-- ✅ GOOD -->
<button class="btn btn-primary">Submit</button>

<!-- ❌ BAD -->
<div class="rounded-md bg-blue-500 text-white px-4 py-2 cursor-pointer">
  Submit
</div>
```

## More Resources
- [Tailwind Docs](https://tailwindcss.com/docs)
- [DaisyUI Components](https://daisyui.com/components)
- [DESIGN.md](DESIGN.md) - Full design system guide
- [COMPONENT_TEMPLATE.vue](COMPONENT_TEMPLATE.vue) - Component example
