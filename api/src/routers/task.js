const router = require("express").Router();

const controller = require("../controllers/task");

router.route('/:id')
      .get((req, res) => controller.getById(req, res));

router.route('/')
      .post((req, res) => controller.post(req, res));

router.route('/:id')
      .delete((req, res) => controller.delete(req, res));

router.route('/:id')
      .put((req, res) => controller.put(req, res));

module.exports = router;