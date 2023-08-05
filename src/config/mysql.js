const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  // socketPath: process.env.MYSQL_SOCKETPATH,
});

connection.connect((error) => {
  if (error) {
    throw error;
  }
  console.log("Connected to db mysql!");
});

module.exports = connection;
