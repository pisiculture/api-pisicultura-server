const router = require('express').Router();
const controller = require('../controllers/user');

router.route('/')
      .post((req, res) => controller.create(req, res));

router.route("/auth-user")
      .post((req, res) => controller.findByEmailAndPassword(req, res));

module.exports = router;