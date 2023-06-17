const router = require('express').Router();

const controller = require('../controllers/permission.js')

router.route('/:user/:installation')
      .get((req, res) => controller.getByUserAndInstallation(req, res));

router.route('/')
      .post((req, res) => controller.create(req, res));

router.route("/user/:id")
      .get((req, res) => controller.getIdUser(req, res));
     

module.exports = router;