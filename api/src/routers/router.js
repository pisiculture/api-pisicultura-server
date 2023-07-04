const router = require("express").Router();

const installationRouter = require("./installation");
router.use("/installation", installationRouter);

const permissionRouter = require("./permission");
router.use("/permission", permissionRouter);

const configurationRouter = require('./configuration');
router.use("/configuration", configurationRouter);

const notification = require("./notification")
router.use("/notification", notification);

const analysis = require("./analysis");
router.use("/analysis", analysis);

module.exports = router;


