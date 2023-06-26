const router = require("express").Router();

const controller = require("../controllers/auth");

router.route("/register")
    .post((req, res) => controller.create(req, res));

router.route("/")
    .post((req, res) => controller.auth(req, res));

module.exports = router;