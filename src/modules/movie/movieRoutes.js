const express = require("express");
const movieController = require("./movieController");
const Router = express.Router();

Router.get("/", movieController.getAllMovie);
Router.get("/:id", movieController.getMovieById);
Router.post("/", movieController.createMovie);
Router.patch("/:id", movieController.updateMovie);
Router.delete("/:id", movieController.deleteMovie);

module.exports = Router;
