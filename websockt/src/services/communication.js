const ws = require("../ws/websocket");

module.exports = {

    sendMessage(json) {

        ws.sendMessage(json.key, json.connection, json.message);

    }
 /*app.post("/ws/send/:key", (req, res) => {
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
  });*/   
}