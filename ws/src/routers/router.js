const router  = require("express").Router();

const system = require("./system");
router.use("/", system);

const communication = require("./communication");
router.use("/communication", communication);

module.exports = router;