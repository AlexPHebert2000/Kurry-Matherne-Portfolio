-- CreateTable
CREATE TABLE "Series" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Work" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "title" TEXT,
    "description" TEXT,
    "seriesID" INTEGER,
    CONSTRAINT "Work_seriesID_fkey" FOREIGN KEY ("seriesID") REFERENCES "Series" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Work" ("description", "id", "title", "type") SELECT "description", "id", "title", "type" FROM "Work";
DROP TABLE "Work";
ALTER TABLE "new_Work" RENAME TO "Work";
CREATE UNIQUE INDEX "Work_title_key" ON "Work"("title");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
