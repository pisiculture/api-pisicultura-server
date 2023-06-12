const router = require("express").Router();
const controller = require("../controllers/communication");

router.route("/send-message/:key")
      .post((req, res) => controller.sendMessage(req, res));

module.exports = router;