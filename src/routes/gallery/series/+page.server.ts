import prisma from "$lib/prisma";
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const series = await prisma.series.findMany({
    include: {
      works: {
        include: {
          images: true,
        },
      },
    },
  });
  return { series };
}) satisfies PageServerLoad;