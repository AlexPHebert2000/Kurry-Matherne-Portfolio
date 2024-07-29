/*
  Warnings:

  - You are about to drop the `Book` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `bookID` on the `Image` table. All the data in the column will be lost.
  - Added the required column `workID` to the `Image` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Book_title_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Book";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Work" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "title" TEXT,
    "description" TEXT
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "position" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "workID" INTEGER NOT NULL,
    CONSTRAINT "Image_workID_fkey" FOREIGN KEY ("workID") REFERENCES "Work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Image" ("id", "position", "url") SELECT "id", "position", "url" FROM "Image";
DROP TABLE "Image";
ALTER TABLE "new_Image" RENAME TO "Image";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Work_title_key" ON "Work"("title");
