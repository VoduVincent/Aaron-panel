-- CreateTable
CREATE TABLE "Year" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Surface" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "yearId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "Surface_yearId_fkey" FOREIGN KEY ("yearId") REFERENCES "Year" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Nation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "surfaceId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "citybuildcounter" INTEGER NOT NULL,
    "rareresources" TEXT NOT NULL,
    "treasury" BIGINT NOT NULL,
    "totalpop" BIGINT NOT NULL,
    "income_cash" BIGINT NOT NULL,
    "income_resources" BIGINT NOT NULL,
    "income_full_gp" BIGINT NOT NULL,
    "healthcarebudget" REAL NOT NULL,
    "educationbudget" REAL NOT NULL,
    "colonialbudget" REAL NOT NULL,
    "armybudget" BIGINT NOT NULL,
    "navybudget" BIGINT NOT NULL,
    "airbudget" BIGINT NOT NULL,
    "infrabudget" BIGINT NOT NULL,
    CONSTRAINT "Nation_surfaceId_fkey" FOREIGN KEY ("surfaceId") REFERENCES "Surface" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Person" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "race" TEXT NOT NULL,
    "governorskill" INTEGER NOT NULL,
    "nationalleaderskill" INTEGER NOT NULL,
    "millskill" INTEGER NOT NULL,
    "powerlevel" INTEGER NOT NULL,
    "nationId" INTEGER,
    "notes" TEXT NOT NULL,
    CONSTRAINT "Person_nationId_fkey" FOREIGN KEY ("nationId") REFERENCES "Nation" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "City" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nationId" INTEGER,
    "surfaceId" INTEGER NOT NULL,
    "population" BIGINT NOT NULL,
    "taxrate" REAL NOT NULL,
    "prosperityregional" REAL NOT NULL,
    "prosperitynational" REAL NOT NULL,
    "roadlevel" REAL NOT NULL,
    "terrain" REAL NOT NULL,
    "literacy" REAL NOT NULL,
    "warfactor_pop" REAL NOT NULL,
    "trade" REAL NOT NULL,
    "capital" REAL NOT NULL,
    "special_mods" REAL NOT NULL,
    "healthcare" REAL NOT NULL,
    "popmod_tax" REAL NOT NULL,
    "popmod_growth" REAL NOT NULL,
    "colonial_booster" REAL NOT NULL,
    "resources_tax" REAL NOT NULL,
    "resources_booster" REAL NOT NULL,
    "tax_base_industry" REAL NOT NULL,
    "netprosperity_mod" REAL NOT NULL,
    "income_bef_res_gov" BIGINT NOT NULL,
    "annual_growth" REAL NOT NULL,
    "resources" INTEGER NOT NULL,
    "notes" TEXT NOT NULL,
    CONSTRAINT "City_nationId_fkey" FOREIGN KEY ("nationId") REFERENCES "Nation" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "City_surfaceId_fkey" FOREIGN KEY ("surfaceId") REFERENCES "Surface" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Year_date_key" ON "Year"("date");
