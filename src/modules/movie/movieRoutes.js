const express = require("express");
const movieController = require("./movieController");
const Router = express.Router();
const middlewareAuth = require("../../middleware/auth");
const middlewareUpload = require("../../middleware/uploadMovie");

Router.get("/", movieController.getAllMovie);
Router.get("/:id", movieController.getMovieById);
Router.post(
  "/",
  middlewareAuth.authentication,
  middlewareUpload,
  movieController.createMovie
);
Router.patch(
  "/:id",
  middlewareAuth.authentication,
  middlewareUpload,
  movieController.updateMovie
);
Router.delete("/:id", movieController.deleteMovie);

module.exports = Router;
