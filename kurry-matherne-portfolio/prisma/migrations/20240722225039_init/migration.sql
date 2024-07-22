-- CreateTable
CREATE TABLE "Book" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "coverImage" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "position" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "bookID" INTEGER NOT NULL,
    CONSTRAINT "Image_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES "Book" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Update" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Info" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT DEFAULT 0,
    "aboutMe" TEXT NOT NULL,
    "headShotUrl" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Book_title_key" ON "Book"("title");
