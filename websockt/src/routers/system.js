const router = require("express").Router();
const service = require("../controllers/system");

router.route("/connections")
      .get((req, res) => service.sessions(req, res));

module.exports = router;