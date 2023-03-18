const validator = require("../utils/validator");
const { sendResponse, sendResponseWithData } = require("../utils/sendResponse");
const db = require("../database/connection");
const Users = db.users;
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

module.exports.login = async (req, res) => {
  try {
    const { email, password } = req.body ? req.body : {};

    const errorMessages = validator.validateFields({
      email,
      password,
    });

    if (errorMessages.length) {
      throw new Error(errorMessages);
    }

    const checkUserExists = await Users.findOne({
      raw: true,
      where: {
        email,
      },
    });

    if (!checkUserExists) {
      throw new Error("Invalid Credentials!");
    } else if (!(await bcrypt.compare(password, checkUserExists.password))) {
      throw new Error("Invalid Credentials!");
    }

    const signedToken = jwt.sign(
      {
        ...checkUserExists,
      },
      "secret",
      { expiresIn: "5h" }
    );

    return sendResponseWithData(
      "Login succefully.",
      "failed",
      200,
      { ...checkUserExists, token: signedToken },
      res
    );
  } catch (err) {
    return sendResponse(
      err && err.message ? err.message : "Something went wrong!",
      "failed",
      400,
      res
    );
  }
};
