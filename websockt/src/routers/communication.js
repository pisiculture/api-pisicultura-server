const router = require("express").Router();
const controller = require("../controllers/communication");

router.route("/send-message-read/:key")
      .get((req, res) => controller.sendExecRead(req, res));

module.exports = router;