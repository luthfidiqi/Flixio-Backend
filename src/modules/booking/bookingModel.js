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
      //   console.log(connection);
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
      //   console.log(connection);
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
      //   console.log(connection);
    }),
};
