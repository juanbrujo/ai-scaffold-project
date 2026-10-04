# Design System

This project uses **Tailwind CSS 4** and **shadcn-vue** (Reka UI) for its interface.
The editable component source lives in `app/components/ui/`; add official components
with `pnpm dlx shadcn-vue@latest add <component>`.

## Rules

- Prefer shadcn-vue components for common controls: `UiButton`, `UiCard`, `UiAlert`,
  forms, dialogs and menus.
- Compose layout, spacing and responsive behavior with Tailwind utilities.
- Use semantic tokens: `bg-background`, `bg-card`, `text-foreground`,
  `text-muted-foreground`, `border-border`, `bg-primary` and `text-destructive`.
- Do not introduce raw hex colors, inline styles or another UI library.
- Extend components through their `variant`, `size` and `class` props before creating
  a one-off control.
- Keep keyboard behavior, visible focus rings, labels and WCAG AA contrast intact.

## Theme

Tokens are defined in `app/assets/css/main.css`. Light mode uses `:root`; dark mode
uses the `.dark` class. `useColorTheme()` owns that class, so components must use
semantic tokens rather than hard-coded light or dark colors.

## Common patterns

```vue
<UiButton type="button">Save</UiButton>
<UiButton type="button" variant="secondary">Cancel</UiButton>
<UiButton type="button" variant="ghost" size="sm">More</UiButton>
```

```vue
<UiCard>
  <UiCardHeader>
    <UiCardTitle>Title</UiCardTitle>
    <UiCardDescription>Supporting context.</UiCardDescription>
  </UiCardHeader>
  <UiCardContent>Content</UiCardContent>
  <UiCardFooter class="justify-end gap-2">
    <UiButton type="button">Continue</UiButton>
  </UiCardFooter>
</UiCard>
```

```vue
<UiAlert>
  <UiAlertTitle>Saved</UiAlertTitle>
  <UiAlertDescription>Your changes are available.</UiAlertDescription>
</UiAlert>

<UiAlert variant="destructive">
  <UiAlertTitle>Could not save</UiAlertTitle>
  <UiAlertDescription>Try again in a moment.</UiAlertDescription>
</UiAlert>
```

## Checklist

- [ ] Uses existing shadcn-vue components or adds one through the CLI.
- [ ] Uses semantic design tokens and Tailwind’s spacing scale.
- [ ] Handles disabled, loading and error states.
- [ ] Works with keyboard navigation and has a visible focus state.
- [ ] Is responsive from mobile upwards.