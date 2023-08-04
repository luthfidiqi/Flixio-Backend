// Custom middleware auth

const helperWrapper = require("../helpers/wrapper");
const jwt = require("jsonwebtoken");

module.exports = {
  authentication: (req, res, next) => {
    let token = req.headers.authorization;

    if (!token) {
      return helperWrapper.res(res, 403, "Please login first!", null);
    }

    // split bearer and only takes the token only
    token = token.split(" ")[1];

    // jtw verification
    jwt.verify(token, "SECRET", (error, result) => {
      if (error) {
        return helperWrapper.res(res, 403, error.message, null);
      }
      req.decodeToken = result;
      next();
    });
  },
  isAdmin: (req, res, next) => {
    console.log(req.decodeToken);
    try {
      console.log(req.decodeToken.role);
      if (req.decodeToken.role !== "admin") {
        return helperWrapper.res(
          res,
          403,
          "Only admin can use this feature",
          null
        );
      }
      console.log(req.decodeToken.role);
      return next();
    } catch (error) {
      if (error) {
        return helperWrapper.res(res, 404, "Bad request", null);
      }
    }
  },
};
