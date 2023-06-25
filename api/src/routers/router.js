const router = require("express").Router();

const authRouter = require('./auth');
router.use("/auth", authRouter);

const installationRouter = require("./installation");
router.use("/installation", installationRouter);

const permissionRouter = require("./permission");
router.use("/permission", permissionRouter);

const configurationRouter = require('./configuration');
router.use("/configuration", configurationRouter);

const notification = require("./notification")
router.use("/notification", notification);

module.exports = router;


