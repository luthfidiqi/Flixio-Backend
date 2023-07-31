const connection = require("../../config/mysql");

module.exports = {
  createBooking: (data) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        "INSERT INTO booking SET ?",
        data,
        (error, result) => {
          if (!error) {
            const newResult = {
              id: result.insertId,
              ...data,
            };
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
  createBookingSeat: (dataSeat) =>
    new Promise((resolve, reject) => {
      const query = connection.query(
        "INSERT INTO bookingSeat SET ?",
        dataSeat,
        (error, result) => {
          if (!error) {
            const newResult = {
              id: result.insertId,
              ...dataSeat,
            };
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
  getBookingByBookingId: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT b.id, b.scheduleId, b.dateBooking, b.timeBooking, b.totalTicket, b.totalPayment, b.paymentMethod, b.statusPayment, b.statusUsed, b.createdAt, b.updatedAt, m.name, m.category FROM booking AS b JOIN schedule AS s ON b.scheduleId = s.id JOIN movie AS m ON s.movieId = m.id WHERE b.id = ?",
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
  getBookingByBookingIdSeat: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT seat FROM bookingSeat WHERE bookingId = ?",
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
  getSeatBooking: (scheduleId, dateBooking, timeBooking) =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT bs.seat 
        FROM bookingSeat AS bs 
        JOIN booking AS b ON bs.bookingId = b.id 
        WHERE b.scheduleId = '${scheduleId}' OR b.dateBooking = '${dateBooking}' OR b.timeBooking = '${timeBooking}';`,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
  getDashboardBooking: (premiere, movieId, location) =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT MONTH(b.createdAt) AS month, SUM(b.totalPayment) AS total
        FROM booking AS b
        JOIN schedule AS s 
        ON b.scheduleId = s.id
        WHERE s.premiere LIKE '%${premiere}%' OR s.movieId = ${movieId} OR s.location LIKE '%${location}%'
        GROUP BY MONTH(b.createdAt);`,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
      //   console.log(connection);
    }),
  updateStatusBooking: (id, data) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE booking SET ? WHERE id = ?",
        [data, id],
        (error) => {
          if (!error) {
            const newResult = {
              id,
              ...data,
            };
            resolve(newResult);
          } else {
            reject(new Error(error.sqlMessage));
          }
        }
      );
    }),
};
