const express = require("express");
const authController = require("./authController");
const Router = express.Router();

Router.post("/register", authController.register);
Router.post("/login", authController.login);
Router.post("/refresh", authController.refreshToken);
Router.post("/activateAccount/:id", authController.updateStatusAccount);
Router.post("/logout", authController.logout);

module.exports = Router;
