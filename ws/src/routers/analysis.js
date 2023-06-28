const router = require("express").Router();
const analysisService = require("../services/analysis");

router.route("/:key").get((req, res) => analysisService.findByIdInstallation(req, res));

module.exports = router;