import prisma from '$lib/prisma';
import type { PageServerLoad } from './$types';

export const load = (async () => {
	const art = await prisma.work.findMany({
		where: {
			type: 'ART'
		},
		orderBy: {
			id: 'desc'
		},
		include: {
			images: true
		}
	});
	return { art };
}) satisfies PageServerLoad;
