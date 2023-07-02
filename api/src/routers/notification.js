const router = require("express").Router();
const controller = require("../controllers/notifications");

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/user/:id")
      .get((req, res) => controller.findByIdUser(req, res));

module.exports = router;