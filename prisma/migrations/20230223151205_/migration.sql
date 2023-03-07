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
    CONSTRAINT "Nation_surfaceId_fkey" FOREIGN KEY ("surfaceId") REFERENCES "Surface" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Nation" ("airbudget", "armybudget", "citybuildcounter", "colonialbudget", "educationbudget", "healthcarebudget", "id", "income_cash", "income_full_gp", "income_resources", "infrabudget", "name", "navybudget", "rareresources", "surfaceId", "totalpop", "treasury") SELECT "airbudget", "armybudget", "citybuildcounter", "colonialbudget", "educationbudget", "healthcarebudget", "id", "income_cash", "income_full_gp", "income_resources", "infrabudget", "name", "navybudget", "rareresources", "surfaceId", "totalpop", "treasury" FROM "Nation";
DROP TABLE "Nation";
ALTER TABLE "new_Nation" RENAME TO "Nation";
CREATE TABLE "new_Person" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "race" TEXT NOT NULL,
    "governorskill" INTEGER NOT NULL,
    "nationalleaderskill" INTEGER NOT NULL,
    "millskill" INTEGER NOT NULL,
    "powerlevel" INTEGER NOT NULL,
    "nationId" INTEGER,
    "notes" TEXT,
    CONSTRAINT "Person_nationId_fkey" FOREIGN KEY ("nationId") REFERENCES "Nation" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Person" ("age", "governorskill", "id", "millskill", "name", "nationId", "nationalleaderskill", "notes", "powerlevel", "race") SELECT "age", "governorskill", "id", "millskill", "name", "nationId", "nationalleaderskill", "notes", "powerlevel", "race" FROM "Person";
DROP TABLE "Person";
ALTER TABLE "new_Person" RENAME TO "Person";
CREATE TABLE "new_City" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nationId" INTEGER,
    "surfaceId" INTEGER NOT NULL,
    "population" BIGINT NOT NULL,
    "taxrate" REAL NOT NULL,
    "prosperityregional" REAL,
    "prosperitynational" REAL,
    "roadlevel" REAL,
    "terrain" REAL,
    "literacy" REAL,
    "warfactor_pop" REAL,
    "trade" REAL,
    "capital" REAL,
    "special_mods" REAL,
    "healthcare" REAL,
    "popmod_tax" REAL,
    "popmod_growth" REAL,
    "colonial_booster" REAL,
    "resources_tax" REAL,
    "resources_booster" REAL,
    "tax_base_industry" REAL,
    "netprosperity_mod" REAL,
    "income_bef_res_gov" BIGINT,
    "annual_growth" REAL,
    "resources" INTEGER,
    "notes" TEXT,
    CONSTRAINT "City_nationId_fkey" FOREIGN KEY ("nationId") REFERENCES "Nation" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "City_surfaceId_fkey" FOREIGN KEY ("surfaceId") REFERENCES "Surface" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_City" ("annual_growth", "capital", "colonial_booster", "healthcare", "id", "income_bef_res_gov", "literacy", "nationId", "netprosperity_mod", "notes", "popmod_growth", "popmod_tax", "population", "prosperitynational", "prosperityregional", "resources", "resources_booster", "resources_tax", "roadlevel", "special_mods", "surfaceId", "tax_base_industry", "taxrate", "terrain", "trade", "warfactor_pop") SELECT "annual_growth", "capital", "colonial_booster", "healthcare", "id", "income_bef_res_gov", "literacy", "nationId", "netprosperity_mod", "notes", "popmod_growth", "popmod_tax", "population", "prosperitynational", "prosperityregional", "resources", "resources_booster", "resources_tax", "roadlevel", "special_mods", "surfaceId", "tax_base_industry", "taxrate", "terrain", "trade", "warfactor_pop" FROM "City";
DROP TABLE "City";
ALTER TABLE "new_City" RENAME TO "City";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
