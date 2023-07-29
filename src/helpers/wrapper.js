module.exports = {
  res: (res, status, msg, data, pagination) => {
    const result = {
      status: status || 200,
      msg: msg,
      data: data,
      pagination: pagination,
    };
    return res.status(result.status).json(result);
  },
};
