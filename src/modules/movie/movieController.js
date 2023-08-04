const helperWrapper = require("../../helpers/wrapper");
const movieModel = require("./movieModel");
const cloudinary = require("../../config/cloudinary");

/* 
Note :
1. Buat CRUD untuk schedule
2. Buat fitur search & sort get all 
    - Masukanrequest untuk searchName dan sort
    - cari query sql untuk search by name dan sort 
*/

module.exports = {
  getAllMovie: async (req, res) => {
    try {
      let { searchName, sort, page, limit } = req.query;

      // Ternary Operator
      typeof searchName === "string"
        ? (searchName = searchName)
        : (searchName = "");

      typeof sort === "string" ? (sort = sort) : (sort = "name ASC");

      if (!page || !limit) {
        page = 1;
        limit = 10;
      }

      page = Number(page);
      limit = Number(limit);

      const offset = page * limit - limit;

      const totalData = await movieModel.getCountMovie();
      const totalPage = Math.ceil(totalData / limit);
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
      };

      const result = await movieModel.getAllMovie(
        searchName,
        sort,
        limit,
        offset
      );
      return helperWrapper.res(res, 200, "Success get data!", result, pageInfo);
    } catch (error) {
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getMovieById: async (req, res) => {
    try {
      // Destructuring Object (To get id property from params)
      const { id } = req.params;
      const result = await movieModel.getMovieById(id);

      if (result.length <= 0) {
        return helperWrapper.res(res, 404, `Data by ${id} not found`, null);
      }

      return helperWrapper.res(res, 200, `Success get data id ${id}`, result);
    } catch (error) {
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  createMovie: async (req, res) => {
    try {
      const {
        name,
        category,
        releaseDate,
        cast,
        director,
        duration,
        synopsis,
      } = req.body;

      // For cloudinary only
      // Get extension from mimetype
      const mimetypeParts = req.file.mimetype.split("/");
      const fileExtension = mimetypeParts[1];
      // Combine filename with fileExtension
      const newFilename = `${req.file.filename}.${fileExtension}`;

      const setData = {
        name,
        category,
        image: newFilename,
        releaseDate,
        cast,
        director,
        duration,
        synopsis,
      };

      const result = await movieModel.createMovie(setData);

      return helperWrapper.res(res, 200, "Success create data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updateMovie: async (req, res) => {
    try {
      console.log(req.file);
      const { id } = req.params;
      const checkId = await movieModel.getMovieById(id);

      if (checkId.length <= 0) {
        return helperWrapper.res(res, 404, `Data by id ${id} not found`, null);
      }

      const {
        name,
        category,
        releaseDate,
        cast,
        director,
        duration,
        synopsis,
      } = req.body;

      // For cloudinary only
      // Get extension from mimetype
      const mimetypeParts = req.file.mimetype.split("/");
      const fileExtension = mimetypeParts[1];
      // Combine filename with fileExtension
      const newFilename = `${req.file.filename}.${fileExtension}`;

      const setData = {
        name,
        category,
        image: newFilename,
        releaseDate,
        cast,
        director,
        duration,
        synopsis,
        updatedAt: new Date(Date.now()),
      };

      // Pass the empty value
      for (const data in setData) {
        // console.log(data); // property
        // console.log(setData[data]); // value
        if (!setData[data]) {
          delete setData[data];
        }
      }

      const result = await movieModel.updateMovie(id, setData);

      return helperWrapper.res(res, 200, "Success update data !", result);
    } catch (error) {
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  deleteMovie: async (req, res) => {
    try {
      const { id } = req.params;
      const checkId = await movieModel.getMovieById(id);

      if (checkId.length <= 0) {
        return helperWrapper.res(res, 404, `Data by id ${id} not found`, null);
      }

      const resultId = await movieModel.getMovieById(id);

      let imageLink = resultId[0].image;
      const filename = imageLink.split(".");

      cloudinary.uploader.destroy(filename[0], function (result) {
        console.log(result);
      });

      const result = await movieModel.deleteMovie(id);

      return helperWrapper.res(res, 200, "Success delete data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
