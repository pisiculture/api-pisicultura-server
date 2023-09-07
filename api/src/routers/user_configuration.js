const router = require("express").Router();
const controller = require("../controllers/user_configuration");

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/user/:key")
      .get((req, res) => controller.findByKey(req, res));

router.route("/:key")
      .put((req, res) => controller.update(req, res));

module.exports = router;