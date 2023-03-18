const router = require("express").Router();
const usersController = require("../../controllers/usersController");

router.post("/login", usersController.login);
module.exports = router;
