const router = require("express").Router();
const auth = require("../middleware/auth");
const resourceRoutes = require("./resources/resources.routes");
const userRoutes = require("./users/users.routes");

router.use("/resource", auth, resourceRoutes);
router.use("/users", userRoutes);

module.exports = router;
