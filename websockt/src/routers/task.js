const router = require("express").Router();

const controller = require("../controller/task");

router.route("/send")
      .post((req, res) => controller.send(req, res));

module.exports = router;