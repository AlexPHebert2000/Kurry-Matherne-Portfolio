import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';

export const load = (async ({ params }: { params: { id: string } } ) => {
  const book = await prisma.book.findUnique({where: {id :+params.id}})
  return {book}
}) satisfies PageServerLoad