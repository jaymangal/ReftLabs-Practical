const jwt = require("jsonwebtoken");
const ApiResponse = require("../utils/ApiResponse");
const { sendResponse } = require("../utils/sendResponse");

module.exports = (req, res, next) => {
  const apiResponse = new ApiResponse();
  try {
    if (!req.headers.authorization) {
      return sendResponse(["Authorization is missing."], "failed", 401, res);
    }
    const token = req.headers.authorization.split(" ")[1];
    const decodedToken = jwt.verify(token, "secret");
    req.user = decodedToken;
    next();
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      apiResponse.messages.push("Token expired.");
      apiResponse.status = "failed";
      apiResponse.code = "401";
    } else {
      apiResponse.messages.push("Invalid Authorization Token.");
      apiResponse.status = "failed";
      apiResponse.code = "401";
    }
    return res.status(401).json(apiResponse);
  }
};
