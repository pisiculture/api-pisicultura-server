const ws = require("../ws/websocket");

module.exports = {

    sessions() {
        let sessions = [];
        ws.getSessions()
          .forEach(i => sessions.push({ 
               key: i.key, 
               connection: i.connection, 
               service: i.service || 'ALL' 
            }))
        return sessions;
    }
}