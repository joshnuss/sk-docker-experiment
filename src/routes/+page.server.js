import { db } from '$lib/server/db'

export async function load() {
  const products = await db.product.findMany({})

  return { products }
}
