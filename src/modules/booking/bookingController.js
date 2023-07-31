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
  getBookingByBookingId: async (req, res) => {
    try {
      const { id } = req.params;

      // console.log(id);

      const result = await bookingModel.getBookingByBookingId(id);

      const resultSeat = await bookingModel.getBookingByBookingIdSeat(id);

      const newResultSeat = resultSeat.map((item) => item.seat);

      const dataResult = result[0];

      const newResult = {
        id: dataResult.id,
        scheduleId: dataResult.scheduleId,
        dateBooking: dataResult.dateBooking,
        timeBooking: dataResult.timeBooking,
        totalTicket: dataResult.totalTicket,
        totalPayment: dataResult.totalPayment,
        paymentMethod: dataResult.paymentMethod,
        statusPayment: dataResult.statusPayment,
        statusUsed: dataResult.statusUsed,
        seat: newResultSeat,
        createdAt: dataResult.createdAt,
        updatedAt: dataResult.updatedAt,
        name: dataResult.name,
        category: dataResult.category,
      };

      return helperWrapper.res(
        res,
        200,
        `Success get data booking seat!`,
        newResult
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getSeatBooking: async (req, res) => {
    try {
      const { scheduleId, dateBooking, timeBooking } = req.body;

      console.log(scheduleId);

      const result = await bookingModel.getSeatBooking(
        scheduleId,
        dateBooking,
        timeBooking
      );

      const newResult = result.map((item) => item.seat);

      return helperWrapper.res(
        res,
        200,
        `Success get data booking seat!`,
        newResult
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
