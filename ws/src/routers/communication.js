const router = require("express").Router();
const controller = require("../controllers/communication");

router.route("/send-message-read/:key")
      .post((req, res) => controller.sendExecRead(req, res));

router.route("/send-message/:key")
      .post((req, res) => controller.sendMessage(req, res));

module.exports = router;