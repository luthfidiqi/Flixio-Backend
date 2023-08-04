const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const helmet = require("helmet");
const xss = require("xss-clean");
const compression = require("compression");
const bodyParser = require("body-parser");
require("dotenv").config();

const routerNav = require("./routes");
const app = express();
const port = process.env.PORT;

// MiddleWare
app.use(morgan("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.options("*", cors());
app.use(helmet());
app.use(xss());
app.use(compression());

app.use("/", routerNav);
app.use("/*", (req, res) => {
  res.status(404).send("Path Not Found!");
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
