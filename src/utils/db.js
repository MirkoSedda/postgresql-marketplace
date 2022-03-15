import pg from "pg";

const { Pool } = pg;

const { PGPORT, PGPASSWORD, PGDATABASE, PGUSER, PGHOST } = process.env;

const pool = new Pool({
  user: PGUSER,
  host: PGHOST,
  database: PGDATABASE,
  password: PGPASSWORD,
  port: PGPORT,
});

export default pool;
