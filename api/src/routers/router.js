const router = require("express").Router();

const userConfigurationRouter = require('./user_configuration');
router.use("/user/configuration", userConfigurationRouter);

const permissionRouter = require("./permission");
router.use("/permission", permissionRouter);

const installationRouter = require("./installation");
router.use("/installation", installationRouter);

const installationConfigurationRouter = require('./intallation_configuration');
router.use("/installation/configuration", installationConfigurationRouter);

const notification = require("./notification")
router.use("/notification", notification);

const analysis = require("./analysis");
router.use("/analysis", analysis);

module.exports = router;


