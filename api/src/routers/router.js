const router = require("express").Router();

const taskRouter = require("./task_router")

router.use("/", taskRouter);

module.exports = router;


