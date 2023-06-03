const router = require("express").Router()
const controller = require('../controllers/installation')

router.route('/')
      .post((req, res) => controller.create(req, res));


module.exports = router;


