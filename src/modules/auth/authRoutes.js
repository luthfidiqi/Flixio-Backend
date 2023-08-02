const express = require("express");
const authController = require("./authController");
const Router = express.Router();

Router.post("/register", authController.register);
Router.post("/login", authController.login);

module.exports = Router;
