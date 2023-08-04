const multer = require("multer");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const cloudinary = require("../config/cloudinary");
const helperWrapper = require("../helpers/wrapper");

// Cloudinary Upload
const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "Flixio/user",
  },
});

const upload = multer({ storage }).single("imageUser");

const handlingUpload = (req, res, next) => {
  upload(req, res, (err) => {
    if (err instanceof multer.MulterError) {
      return helperWrapper.res(res, 401, err.message, null);
    } else if (err) {
      return helperWrapper.res(res, 401, err.message, null);
    }
    return next();
  });
};

module.exports = upload;
