const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const routers = require("./src/routers/router");
app.use("/", routers);

const conn = require('./src/db/coonDB');
conn();

const server = app.listen(process.env.PORT || 3002, () => {
  console.log(`App Express is running!`);
})

const ws = require("./src/ws/websocket");
ws.ws(server);
