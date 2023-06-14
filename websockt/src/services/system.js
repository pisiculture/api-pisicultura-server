const ws = require("../ws/websocket");

module.exports = {

    sessions() {
        let sessions = [];
        ws.getSessions().forEach(i => sessions.push({ key: i.key, connection: i.connection}))
        return sessions;
    }
}