const router = require("express").Router();
const controller = require("../controllers/notifications");

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/find")
      .post((req, res) => controller.find(req, res));

module.exports = router;