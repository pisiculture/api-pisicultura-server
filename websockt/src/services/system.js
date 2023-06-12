const ws = require("../ws/websocket");

module.exports = {
   
   async sessions(req, res) {

        await res.status(200).json(ws.sessions);

    }
}