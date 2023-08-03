const express = require("express");
const movieController = require("./movieController");
const Router = express.Router();
const middlewareAuth = require("../../middleware/auth");

Router.get("/", movieController.getAllMovie);
Router.get("/:id", movieController.getMovieById);
Router.post("/", middlewareAuth.authentication, movieController.createMovie);
Router.patch("/:id", movieController.updateMovie);
Router.delete("/:id", movieController.deleteMovie);

module.exports = Router;
