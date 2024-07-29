import prisma from "$lib/prisma";
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const updates = await prisma.update.findMany({
    orderBy: {
      createdAt: "desc"
    }
  });
  const info = await prisma.info.findFirstOrThrow();
  const books = await prisma.work.findMany({
    where: {
      type: "BOOK",
    },
    include: {
      images: true,
    },
  });
  return { updates, info, books };
}) satisfies PageServerLoad;