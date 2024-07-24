import { PrismaClient } from "@prisma/client";
import seedData from "./seed.json" assert { type: "json" };

const prisma = new PrismaClient();

async function main () {
  console.log('Seeding database');

  await prisma.info.create({
    data: seedData.info,
  });

  for (const book of seedData.books) {
    await prisma.book.create({
      data: {
        title: book.title,
        description: book.description,
        coverImage: book.coverImage,
        images: {
          create: book.images
        }
      }
    });
  }

  for (const update of seedData.updates) {
    await prisma.update.create({
      data: update,
    })
  }
}

main()
  .then(() => { console.log("Database seeded"); })
  .catch((err) => { console.log("Failed to seed database: ", err); })
  .finally(async() => { await prisma.$disconnect(); });