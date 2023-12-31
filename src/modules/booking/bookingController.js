const helperWrapper = require("../../helpers/wrapper");
const bookingModel = require("./bookingModel");
const { v4: uuidv4 } = require("uuid");

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
        id: uuidv4(),
        userId: req.decodeToken.id,
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
          id: uuidv4(),
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
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getBookingByUserId: async (req, res) => {
    try {
      const { id } = req.params;

      const result = await bookingModel.getBookingByUserId(id);

      const resultSeat = await bookingModel.getBookingByBookingIdSeat(id);

      const newResultSeat = resultSeat.map((item) => item.seat);

      const dataResult = result[0];

      const newResult = {
        id: dataResult.id,
        firstName: dataResult.firstName,
        lastName: dataResult.lastName,
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
  getBookingByBookingId: async (req, res) => {
    try {
      const { id } = req.params;

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
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getSeatBooking: async (req, res) => {
    try {
      const { scheduleId, dateBooking, timeBooking } = req.query;

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
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getDashboardBooking: async (req, res) => {
    try {
      let { premiere, movieId, location } = req.query;

      const result = await bookingModel.getDashboardBooking(
        premiere,
        movieId,
        location
      );

      return helperWrapper.res(
        res,
        200,
        `Success get data booking seat!`,
        result
      );
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updateStatusBooking: async (req, res) => {
    try {
      const { id } = req.params;

      const setData = {
        statusUsed: "notActive",
        updatedAt: new Date(Date.now()),
      };

      const result = await bookingModel.updateStatusBooking(id, setData);

      return helperWrapper.res(res, 200, "Success update data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
