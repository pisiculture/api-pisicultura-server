const WebSocket = require('ws');
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());


let sockets = [];
const server = new WebSocket.Server({ port: 3050 });

server.on('connection', (socket) => {
  sockets.push({ key: "dGVzdGVJbmQ", connection: 'CLIENTE', socket: socket });

  socket.on('message', (msg) => {
    console.log(msg)
    sockets.forEach(s => s.socket.send(msg));
  });

  socket.on('close', () => {
    sockets = sockets.filter(s => s.socket !== socket);
  });
});

app.post("/ws/send/:key", (req, res) => {
  if (sockets && sockets !== [])
    sockets
      .filter(i => i.key === req.params.key)
      .forEach(s => {
        const json = {
          action: "READ",
          water_pump: req.body.water_pump,
          water_lock: req.body.water_lock
        };
        s.socket.send(JSON.stringify(json));
      });
  res.status(200).json({ message: "Message send success." });
});

app.listen(3002, () => console.info("Application websocket runner."));