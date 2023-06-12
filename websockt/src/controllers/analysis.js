module.exports = {
    
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
}