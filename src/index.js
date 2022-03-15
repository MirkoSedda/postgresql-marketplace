import express from "express";
import pool from "./utils/db.js";
import cors from "cors";
import productsRouter from "./services/product.js";

const server = express();

server.use(express.json());

server.use(cors());

server.use("/products", productsRouter);

const { PORT = 3001 } = process.env;

const initialize = async () => {
  try {
    await pool.query("SELECT 1+1;");
    server.listen(PORT, async () => {
      console.log("server is running on port =" + PORT);
    });

    server.on("error", (error) => {
      console.log("server is not running");
    });
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

initialize();
