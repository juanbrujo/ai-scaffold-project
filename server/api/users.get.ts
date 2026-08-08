import type { User } from '~~/shared/types/user'

/**
 * Example query endpoint. Requires migrations/001_create_users_table.sql
 * to have been applied against DATABASE_URL.
 */
export default defineEventHandler(async (): Promise<User[]> => {
  const sql = getDb()
  return (await sql`
    SELECT id, email, name, created_at
    FROM users
    ORDER BY created_at DESC
    LIMIT 50
  `) as User[]
})
