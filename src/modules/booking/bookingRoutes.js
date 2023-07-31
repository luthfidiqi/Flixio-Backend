const express = require("express");
const bookingController = require("./bookingController");
const Router = express.Router();

Router.post("/", bookingController.createBooking);
// Router.get("/user/:id", bookingController.getBookingByUserId);
Router.get("/id/:id", bookingController.getBookingByBookingId);
Router.get("/seat", bookingController.getSeatBooking);
Router.get("/dashboard", bookingController.getDashboardBooking);
// Router.patch("/ticket/:id", bookingController.updateStatusBooking);

module.exports = Router;
