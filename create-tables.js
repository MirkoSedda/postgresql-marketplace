import { join } from "path";

import fs from "fs/promises";

import pool from "./src/utils/db.js";

const sqlFilePath = join(process.cwd(), "create-tables.sql");

const createTables = async () => {
  try {
    const fileContent = await fs.readFile(sqlFilePath, "utf-8");
    await pool.query(fileContent);
    console.log("Tables are created");
    process.exit(0);
  } catch (error) {
    console.log("Tables are created error" + error);
  }
};

createTables();
