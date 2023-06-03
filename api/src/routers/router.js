const router = require("express").Router();

const taskRouter = require("./task");
router.use("/task", taskRouter);

const installationRouter = require("./installation");
router.use("/installation", installationRouter);

const permissionRouter = require("./permission");
router.use("/permission", permissionRouter);

const userRouter = require("./user");
router.use("/user", userRouter);

const configurationRouter = require('./configuration');
router.use("/configuration", configurationRouter);

module.exports = router;


