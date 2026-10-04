# Tailwind + shadcn-vue Quick Reference

Components are auto-imported with the `Ui` prefix. Their source is local under
`app/components/ui`, so variants can be reviewed and customized in the project.

## Add a component

```bash
pnpm dlx shadcn-vue@latest add dialog input select
```

## Buttons

```vue
<UiButton>Primary</UiButton>
<UiButton variant="secondary">Secondary</UiButton>
<UiButton variant="outline">Outline</UiButton>
<UiButton variant="ghost">Ghost</UiButton>
<UiButton variant="destructive">Delete</UiButton>
<UiButton size="sm">Small</UiButton>
```

## Layout tokens

```vue
<div class="bg-background text-foreground">
  <p class="text-muted-foreground">Secondary text</p>
  <section class="rounded-lg border border-border bg-card p-6">Content</section>
</div>
```

## Accessibility

- Use native `button`, `a`, `label` and form elements for their intended roles.
- Add `type="button"` to buttons that are not submitting a form.
- Preserve the generated `focus-visible` styles.
- Give icon-only buttons an `aria-label`.

See [shadcn-vue](https://www.shadcn-vue.com/) for the component registry and
[Tailwind CSS](https://tailwindcss.com/docs) for utilities.