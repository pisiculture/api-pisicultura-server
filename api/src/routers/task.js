const router = require("express").Router();

const controller = require("../controllers/task_controller");

router.route('/task/:id')
      .get((req, res) => controller.getById(req, res));

router.route('/task')
      .post((req, res) => controller.post(req, res));

router.route('/task/:id')
      .delete((req, res) => controller.delete(req, res));

router.route('/task/:id')
      .put((req, res) => controller.put(req, res));

module.exports = router;