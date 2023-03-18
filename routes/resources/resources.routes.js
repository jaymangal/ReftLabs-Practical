const router = require("express").Router();
const resourcesController = require("../../controllers/resourceController");

router.post("/", resourcesController.addResources);
router.get("/", resourcesController.getAllResources);
router.post("/update", resourcesController.updateResources);
router.delete("/", resourcesController.deleteResources);
module.exports = router;
