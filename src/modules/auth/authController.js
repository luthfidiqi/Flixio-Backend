const helperWrapper = require("../../helpers/wrapper");
const authModel = require("./authModel");

module.exports = {
  register: async (req, res) => {
    try {
      const { firstName, email, password } = req.body;

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
      console.log(req.body);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
