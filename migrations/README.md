# Database Migrations

Plain `.sql` files applied in filename order against NeonDB.

## Applying

```bash
# Single migration
psql $DATABASE_URL -f migrations/001_create_users_table.sql

# All of them, in order
for f in migrations/*.sql; do psql "$DATABASE_URL" -f "$f"; done
```

`DATABASE_URL` comes from `.env` (copy `.env.example`). Never commit `.env` —
it is already in `.gitignore`.

## Conventions

- Sequential zero-padded prefix: `001_`, `002_`, `003_`
- One logical change per file; describe it in the filename
- Write them **idempotent** (`IF NOT EXISTS`, `IF EXISTS`) so re-running is safe
- Never edit a migration that has already been applied to an environment —
  add a new one that alters the schema forward
- Migrations are forward-only here; if you need a rollback, add an explicit
  `00N_revert_*.sql`

## Example

```sql
-- 002_add_users_last_login.sql
ALTER TABLE users
  ADD COLUMN IF NOT EXISTS last_login_at TIMESTAMPTZ;
```

## Current schema

| File | Purpose |
|---|---|
| `001_create_users_table.sql` | `users` table + `created_at` index |
