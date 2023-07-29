const express = require("express");
const scheduleController = require("./scheduleController");
const Router = express.Router();

Router.get("/", scheduleController.getAllSchedule);
Router.get("/:id", scheduleController.getScheduleById);
Router.post("/", scheduleController.createSchedule);
Router.patch("/:id", scheduleController.updateSchedule);
Router.delete("/:id", scheduleController.deleteSchedule);

module.exports = Router;
