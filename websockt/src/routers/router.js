const router  = require("express").Router();

const analysis = require("./analysis");
router.use("/analysis", analysis);

const system = require("./system");
router.use("/ws", system);

module.exports = router;