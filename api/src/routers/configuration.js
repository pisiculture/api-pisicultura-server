const router = require('express').Router();

const controller = require('../controllers/configuration');

router.route("/")
      .post((req, res) => controller.create(req, res));

module.exports = router;