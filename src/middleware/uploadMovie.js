const multer = require("multer");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const cloudinary = require("../config/cloudinary");
const helperWrapper = require("../helpers/wrapper");

// Cloudinary Upload
const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "Flixio/movie",
  },
});

// Local Upload
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, "public/uploads/movie");
//   },
//   filename: function (req, file, cb) {
//     cb(null, new Date().toISOString().replace(/:/g, "-") + file.originalname);
//   },
// });

// File filter process
const fileFilter = (req, file, cb) => {
  // Tentukan tipe file yang diizinkan di sini
  if (file.mimetype === "image/jpeg" || file.mimetype === "image/png") {
    cb(null, true); // Izinkan
  } else {
    cb(new Error("File type not allowed."), false); // Tolak
  }
};

const upload = multer({ storage, fileFilter, fileSize: 1024 * 1024 }).single(
  "imageMovie"
);

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
