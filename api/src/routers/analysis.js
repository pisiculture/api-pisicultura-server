const router = require("express").Router();
const controller = require("../controllers/analysis");

router.route("/installation/ph/:id")
      .get((req, res) => controller.findPhByIdInstallation(req, res));

router.route("/installation/temperature/:id")
      .get((req, res) => controller.findTemperatureByIdInstallation(req, res));

module.exports = router;