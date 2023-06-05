const router = require("express").Router()
const controller = require('../controllers/installation')

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/")
      .put((req, res) => controller.getById(req, res));

module.exports = router;


