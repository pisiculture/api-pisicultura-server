const router = require("express").Router()
const controller = require('../controllers/installation_configuration')

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/:key")
      .put((req, res) => controller.update(req, res));

router.route("/:key")
      .get((req, res) => controller.getByKey(req, res));

module.exports = router;


