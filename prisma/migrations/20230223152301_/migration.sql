/*
  Warnings:

  - Added the required column `dead` to the `Nation` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Nation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "surfaceId" INTEGER NOT NULL,
    "name" TEXT,
    "citybuildcounter" INTEGER,
    "rareresources" TEXT,
    "treasury" BIGINT,
    "totalpop" BIGINT,
    "income_cash" BIGINT,
    "income_resources" BIGINT,
    "income_full_gp" BIGINT,
    "healthcarebudget" REAL,
    "educationbudget" REAL,
    "colonialbudget" REAL,
    "armybudget" BIGINT,
    "navybudget" BIGINT,
    "airbudget" BIGINT,
    "infrabudget" BIGINT,
    "dead" BOOLEAN NOT NULL,
    CONSTRAINT "Nation_surfaceId_fkey" FOREIGN KEY ("surfaceId") REFERENCES "Surface" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Nation" ("airbudget", "armybudget", "citybuildcounter", "colonialbudget", "educationbudget", "healthcarebudget", "id", "income_cash", "income_full_gp", "income_resources", "infrabudget", "name", "navybudget", "rareresources", "surfaceId", "totalpop", "treasury") SELECT "airbudget", "armybudget", "citybuildcounter", "colonialbudget", "educationbudget", "healthcarebudget", "id", "income_cash", "income_full_gp", "income_resources", "infrabudget", "name", "navybudget", "rareresources", "surfaceId", "totalpop", "treasury" FROM "Nation";
DROP TABLE "Nation";
ALTER TABLE "new_Nation" RENAME TO "Nation";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
