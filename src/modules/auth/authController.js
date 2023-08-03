const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");
const jwt = require("jsonwebtoken");

module.exports = {
  register: async (req, res) => {
    try {
      const { firstName, email, password } = req.body;

      //   1. encrypt password
      //   2. kondisi pengecekan apakah email sudah terdaftar atau belum
      //   3. Password terdiri dari beberapa ketentuan

      const setData = {
        firstName,
        email,
        password,
      };

      const result = await authModel.register(setData);

      return helperWrapper.res(res, 200, "Success register user!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  login: async (req, res) => {
    try {
      const { email, password } = req.body;

      const checkUser = await authModel.getUserByemail(email);

      // Check data user in database
      if (checkUser.length < 1) {
        return helperWrapper.res(res, 404, "Email not registed", null);
      }

      // Check password
      if (password !== checkUser[0].password) {
        return helperWrapper.res(res, 400, "Wrong password", null);
      }

      // JWT Process
      const payload = checkUser[0];
      delete payload.password;
      delete payload.createdAt;
      delete payload.updatedAt;

      const token = jwt.sign({ ...payload }, "SECRET", { expiresIn: "24h" });

      return helperWrapper.res(res, 200, "Success Login", {
        id: payload.id,
        token,
      });
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
