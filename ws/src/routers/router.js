const router  = require("express").Router();

const analysis = require("./analysis");
router.use("/analysis", analysis);

const system = require("./system");
router.use("/ws", system);

const communication = require("./communication");
router.use("/communication", communication);

module.exports = router;