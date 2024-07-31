import { PrismaClient } from '@prisma/client';
import seedData from './seed.json' assert { type: 'json' };

const prisma = new PrismaClient();

async function main() {
	console.log('Clearing database');

	await prisma.info.deleteMany();
	await prisma.update.deleteMany();
	await prisma.image.deleteMany();
	await prisma.work.deleteMany();
	await prisma.series.deleteMany();

	console.log('Seeding database');

	await prisma.info.create({
		data: seedData.info
	});

	await prisma.series.create({
		data: {
			...seedData.series,
			works: {
				create: [
					{
						...seedData.works[0],
						images: {
							create: [seedData.works[0].images]
						}
					},
					{
						...seedData.works[1],
						images: {
							create: [seedData.works[1].images]
						}
					}
				]
			}
		}
	});

	for (const update of seedData.updates) {
		await prisma.update.create({
			data: update
		});
	}
}

for (const art of seedData.works) {
	if (art.type === 'ART') {
		await prisma.work.create({
			data: {
				...art,
				images: {
					create: art.images
				}
			}
		});
	}
}

main()
	.then(() => {
		console.log('Database seeded');
	})
	.catch((err) => {
		console.log('Failed to seed database: ', err);
	})
	.finally(async () => {
		await prisma.$disconnect();
	});
