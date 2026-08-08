-- 001_create_users_table.sql
-- Apply with: psql $DATABASE_URL -f migrations/001_create_users_table.sql

CREATE TABLE IF NOT EXISTS users (
  id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email      TEXT        NOT NULL UNIQUE,
  name       TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS users_created_at_idx ON users (created_at DESC);
