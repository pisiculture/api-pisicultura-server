const router = require('express').Router();

const controller = require('../controllers/configuration');

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/")
      .put((req, res) => controller.update(req, res));

module.exports = router;