const helperWrapper = require("../../helpers/wrapper");
const scheduleModel = require("./scheduleModel");

module.exports = {
  getAllSchedule: async (req, res) => {
    try {
      let { searchMovieId, searchLocation, sort, page, limit } = req.query;

      if (!searchMovieId && !searchLocation) {
        searchMovieId = "";
        searchLocation = "";
      }

      typeof sort === "string" ? (sort = sort) : (sort = "name ASC");

      if (!page || !limit) {
        page = 1;
        limit = 10;
      }

      page = Number(page);
      limit = Number(limit);

      const offset = page * limit - limit;

      const totalData = await scheduleModel.getCountSchedule();
      const totalPage = Math.ceil(totalData / limit);
      const pageInfo = {
        page,
        totalPage,
        limit,
        totalData,
      };

      const result = await scheduleModel.getAllSchedule(
        searchMovieId,
        searchLocation,
        sort,
        limit,
        offset
      );
      return helperWrapper.res(res, 200, "Success get data!", result, pageInfo);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  getScheduleById: async (req, res) => {
    try {
      // Destructuring Object (To get id property from params)
      const { id } = req.params;
      const result = await scheduleModel.getScheduleById(id);

      if (result.length <= 0) {
        return helperWrapper.res(res, 404, `Data by ${id} not found!`, null);
      }

      return helperWrapper.res(res, 200, `Success get data id ${id}!`, result);
    } catch (error) {
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  createSchedule: async (req, res) => {
    try {
      const { movieId, premiere, price, location, dateStart, dateEnd, time } =
        req.body;

      const setData = {
        movieId,
        premiere,
        price,
        location,
        dateStart,
        dateEnd,
        time,
      };

      console.log(setData);

      const result = await scheduleModel.createSchedule(setData);

      return helperWrapper.res(res, 200, "Success create data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  updateSchedule: async (req, res) => {
    try {
      const { id } = req.params;
      const checkId = await scheduleModel.getScheduleById(id);

      if (checkId.length <= 0) {
        return helperWrapper.res(res, 404, `Data by id ${id} not found!`, null);
      }

      const { movieId, premiere, price, location, dateStart, dateEnd, time } =
        req.body;

      const setData = {
        movieId,
        premiere,
        price,
        location,
        dateStart,
        dateEnd,
        time,
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

      const result = await scheduleModel.updateSchedule(id, setData);

      return helperWrapper.res(res, 200, "Success update data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
  deleteSchedule: async (req, res) => {
    try {
      const { id } = req.params;
      const checkId = await scheduleModel.getScheduleById(id);

      if (checkId.length <= 0) {
        return helperWrapper.res(res, 404, `Data by id ${id} not found!`, null);
      }

      const result = await scheduleModel.deleteSchedule(id);

      return helperWrapper.res(res, 200, "Success delete data!", result);
    } catch (error) {
      console.log(error);
      return helperWrapper.res(res, 400, "Bad Request", null);
    }
  },
};
