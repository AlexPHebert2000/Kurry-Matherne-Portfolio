import prisma from "$lib/prisma";
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const response = await prisma.update.findMany();
  return { feed: response };
}) satisfies PageServerLoad;