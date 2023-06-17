const router = require('express').Router();

const controller = require('../controllers/permission.js')

router.route('/')
      .post((req, res) => controller.create(req, res));

router.route("/user/:id")
      .get((req, res) => controller.getByIdUser(req, res));
     

module.exports = router;