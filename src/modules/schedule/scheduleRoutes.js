const express = require("express");
const scheduleController = require("./scheduleController");
const Router = express.Router();
const middlewareAuth = require("../../middleware/auth");

Router.get("/", scheduleController.getAllSchedule);
Router.get("/:id", scheduleController.getScheduleById);
Router.post(
  "/",
  middlewareAuth.authentication,
  middlewareAuth.isAdmin,
  scheduleController.createSchedule
); //isadmin
Router.patch(
  "/:id",
  middlewareAuth.authentication,
  middlewareAuth.isAdmin,
  scheduleController.updateSchedule
); //isadmin
Router.delete(
  "/:id",
  middlewareAuth.authentication,
  middlewareAuth.isAdmin,
  scheduleController.deleteSchedule
); //isadmin

module.exports = Router;
