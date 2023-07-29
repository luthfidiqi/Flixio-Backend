const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "tickitz",
  socketPath: "/Applications/MAMP/tmp/mysql/mysql.sock",
});

connection.connect((error) => {
  if (error) {
    throw error;
  }
  console.log("Connected to db mysql!");
});

module.exports = connection;
