const router = require("express").Router();
const controller =require("../controllers/notification");

router.route("/")
      ,post((req, res) => controller.create(req, res));

router.route("/state/:state")
      .get((req, res) => controller.findByState(req, res));

module.exports = router;