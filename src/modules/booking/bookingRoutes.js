const express = require("express");
const bookingController = require("./bookingController");
const Router = express.Router();
const middlewareAuth = require("../../middleware/auth");

Router.post(
  "/",
  middlewareAuth.authentication,
  bookingController.createBooking
);
// Router.get("/user/:id", bookingController.getBookingByUserId);
Router.get(
  "/id/:id",
  middlewareAuth.authentication,
  bookingController.getBookingByBookingId
);
Router.get(
  "/seat",
  middlewareAuth.authentication,
  bookingController.getSeatBooking
);
Router.get(
  "/dashboard",
  middlewareAuth.authentication,
  middlewareAuth.isAdmin,
  bookingController.getDashboardBooking
);
Router.patch(
  "/ticket/:id",
  middlewareAuth.authentication,
  bookingController.updateStatusBooking
);

module.exports = Router;
