const helperWrapper = require("../../helpers/wrapper");
const bookingModel = require("./bookingModel");

module.exports = {
  createBooking: async (req, res) => {
    try {
      const {
        scheduleId,
        dateBooking,
        timeBooking,
        totalPayment,
        paymentMethod,
        seat,
      } = req.body;

      const setData = {
        scheduleId,
        dateBooking,
        timeBooking,
        totalTicket: seat.length,
        totalPayment,
        paymentMethod,
        statusPayment: "success",
        statusUsed: "active",
      };

      const result = await bookingModel.createBooking(setData);

      seat.map(async (seatNumber) => {
        setDataSeat = {
          bookingId: result.id,
          seat: seatNumber,
        };
        await bookingModel.createBookingSeat(setDataSeat);
      });

      const bookingSeat = {
        ...result,
        seat,
      };

      return helperWrapper.res(res, 200, "Success create data!", bookingSeat);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
