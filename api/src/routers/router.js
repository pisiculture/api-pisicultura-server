const router = require("express").Router();

const installationRouter = require("./installation");
router.use("/installation", installationRouter);

const permissionRouter = require("./permission");
router.use("/permission", permissionRouter);

const userRouter = require("./user");
router.use("/user", userRouter);

const configurationRouter = require('./configuration');
router.use("/configuration", configurationRouter);

const notification = require("./notification")

module.exports = router;


