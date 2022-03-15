import { Router } from "express";
import pool from "../utils/db.js";

const reviewsRouter = Router();

reviewsRouter.get("/", async (req, res, next) => {
  try {
    const data = await pool.query("SELECT * FROM review;");
    res.send(data.rows);
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
});

reviewsRouter.post("/", async (req, res, next) => {
  try {
    const data = await pool.query(
      "INSERT INTO review(comment,rate) VALUES($1,$2) RETURNING *;",
      Object.values(req.body)
    );
    const review = data.rows[0];
    res.status(201).send(review);
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
});

reviewsRouter.delete("/:id", async (req, res, next) => {
  try {
    const data = await pool.query("DELETE FROM review WHERE comment_id=$1;", [
      req.params.id,
    ]);

    const isDeleted = data.rowCount > 0;
    if (isDeleted) {
      res.status(204).send();
    } else {
      res.status(404).send({
        message: "Product not found therefore there is nothing to done.",
      });
    }
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
});

reviewsRouter.put("/:id", async (req, res, next) => {
  try {
    const data = await pool.query(
      "UPDATE review SET comment=$1, rate=$2 WHERE comment_id=$3 RETURNING *;",
      [req.body.comment, req.body.rate, req.params.id]
    );

    const isUpdated = data.rowCount > 0;
    if (isUpdated) {
      res.status(200).send(data.rows[0]);
    } else {
      res.status(404).send({
        message: "Product not found therefore there is nothing to done.",
      });
    }
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
});

export default reviewsRouter;
