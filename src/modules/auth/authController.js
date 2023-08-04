const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

module.exports = {
  register: async (req, res) => {
    try {
      const { firstName, email, lastName, noTelp, password, confirmPassword } =
        req.body;

      const checkUser = await authModel.getUserByemail(email);

      if (checkUser.length >= 1) {
        return helperWrapper.res(res, 404, "Email already registered", null);
      }

      // Check confirm password
      if (password !== confirmPassword) {
        return helperWrapper.res(res, 404, "Your password is not match", null);
      }

      const salt = bcrypt.genSaltSync(10);
      const setData = {
        firstName,
        lastName,
        noTelp,
        email,
        password: await bcrypt.hashSync(password, salt),
        image: "",
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
      const isValid = await bcrypt.compare(password, checkUser[0].password);
      if (!isValid) {
        return helperWrapper.res(res, 400, "Wrong Password");
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
