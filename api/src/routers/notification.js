const router = require("express").Router();
const controller = require("../controllers/notifications");

router.route("/")
      .post((req, res) => controller.create(req, res));

router.route("/user/:id")
      .get((req, res) => controller.findByIdUser(req, res));

router.route("/read/:iduser/:id")
      .put((req, res) => controller.read(req, res));

module.exports = router;