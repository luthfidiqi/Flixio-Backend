const helperWrapper = require("../../helpers/wrapper");
const userModel = require("./userModel");
const cloudinary = require("../../config/cloudinary");
const bcrypt = require("bcrypt");

module.exports = {
  getUserByUserId: async (req, res) => {
    try {
      const id = req.decodeToken.id;
      console.log(id);
      const result = await userModel.getUserByUserId(id);

      if (result.length <= 0) {
        return helperWrapper.res(res, 404, `Data by ${id} not found`, null);
      }

      return helperWrapper.res(res, 200, `Success get data id ${id}`, result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updateProfile: async (req, res) => {
    try {
      const id = req.decodeToken.id;

      const { firstName, lastName, noTelp } = req.body;

      const setData = {
        firstName,
        lastName,
        noTelp,
        updatedAt: new Date(Date.now()),
      };

      for (const data in setData) {
        if (!setData[data]) {
          delete setData[data];
        }
      }

      const result = await userModel.updateProfile(id, setData);

      return helperWrapper.res(res, 200, "Success update data !", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updateImage: async (req, res) => {
    try {
      const id = req.decodeToken.id;

      //   Delete Cloudinary
      const resultId = await userModel.getUserByUserId(id);
      let imageLink = resultId[0].image;
      const filename = imageLink.split(".");
      cloudinary.uploader.destroy(filename[0], function (result) {
        console.log(result);
      });

      // For cloudinary only - rename content column image
      // Get extension from mimetype
      const mimetypeParts = req.file.mimetype.split("/");
      const fileExtension = mimetypeParts[1];
      // Combine filename with fileExtension
      const newFilename = `${req.file.filename}.${fileExtension}`;

      const setData = {
        image: newFilename,
        updatedAt: new Date(Date.now()),
      };

      for (const data in setData) {
        if (!setData[data]) {
          delete setData[data];
        }
      }

      const result = await userModel.updateProfile(id, setData);

      return helperWrapper.res(res, 200, "Success update data !", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updatePassword: async (req, res) => {
    try {
      const id = req.decodeToken.id;

      const { newPassword, confirmPassword } = req.body;

      // Check confirm password
      if (newPassword !== confirmPassword) {
        return helperWrapper.res(res, 404, "Your password is not match", null);
      }

      const salt = bcrypt.genSaltSync(10);
      const setData = {
        password: await bcrypt.hashSync(newPassword, salt),
        updatedAt: new Date(Date.now()),
      };

      for (const data in setData) {
        if (!setData[data]) {
          delete setData[data];
        }
      }

      const result = await userModel.updateProfile(id, setData);

      return helperWrapper.res(res, 200, "Success update data !", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
