const ApiResponse = require("./ApiResponse");

module.exports = {
  sendResponse: (message, status, httpCode, res) => {
    const apiResponse = new ApiResponse();
    apiResponse.messages = message;
    apiResponse.status = status;
    apiResponse.code = String(httpCode);
    return res.status(httpCode).json(apiResponse);
  },

  sendResponseWithData: (message, status, httpCode, data, res) => {
    const apiResponse = new ApiResponse();
    apiResponse.code = String(httpCode);
    apiResponse.status = status;
    apiResponse.messages = message;
    apiResponse.data = data;
    return res.status(httpCode).json(apiResponse);
  },
};
