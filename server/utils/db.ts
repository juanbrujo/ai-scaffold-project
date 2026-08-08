import { neon } from '@neondatabase/serverless'

type NeonClient = ReturnType<typeof neon>

let client: NeonClient | undefined

/**
 * Returns a lazily-created NeonDB client.
 *
 * `neon()` speaks HTTP, so it is safe on serverless/edge runtimes where a
 * long-lived TCP pool would not survive between invocations.
 *
 * Usage:
 *   const sql = getDb()
 *   const users = await sql`SELECT id, email FROM users WHERE id = ${id}`
 *
 * Values interpolated into the template literal are sent as bound parameters,
 * so this is not string concatenation and is not SQL-injectable.
 */
export function getDb(): NeonClient {
  if (client) return client

  const url = useRuntimeConfig().databaseUrl
  if (!url) {
    throw createError({
      statusCode: 500,
      statusMessage: 'DATABASE_URL is not set. Copy .env.example to .env and fill it in.'
    })
  }

  client = neon(url)
  return client
}
