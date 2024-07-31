import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';

export const load = (async ({ params }: { params: { id: string } }) => {
	const book = await prisma.work.findUnique({
		where: {
			id: +params.id
		},
		include: {
			images: true
		}
	});
	return { book };
}) satisfies PageServerLoad;
