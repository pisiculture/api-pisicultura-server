const WebSocket = require('ws');
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());


let sockets = [];
const server = new WebSocket.Server({ port: 3050 });

const analysisService = require('./src/services/analysis');

server.on('connection', (socket) => {
  sockets.push({ socket: socket });

  socket.on('message', (msg) => {
    let json = JSON.parse(msg.toString());
    switch (json.event) {
      case "REGISTER": {
        socket = sockets.map(i => {
          if (i.socket === socket) {
            i.key = json.key;
            i.connection = json.connection;
          }
          return i;
        })
        break;
      }
      case 'MESSAGE': {
        console.log(json)
        analysisService.create(json.data);
        break;
      }
      default:
        {

        }
    }
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
          action: "EXECUTE",
          water_pump: req.body.water_pump,
          water_lock: req.body.water_lock
        };
        s.socket.send(JSON.stringify(json));
      });
  res.status(200).json({ message: "Message send success." });
});

app.get("/ws/:key", (req, res) => {
  if (req.params.key) {
    sockets
      .filter(i => (i.key === req.params.key) && i.connection === "SOCKET")
      .forEach(s => s.socket.send(JSON.stringify({ action: "READ" })));
    res.status(200).json({ message: "Request success." });
  } else
    res.status(406).json({ message: "Not found connection for installation." });
});

app.listen(3002, () => console.info("Application websocket runner."));