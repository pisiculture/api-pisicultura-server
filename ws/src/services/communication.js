const ws = require("../ws/websocket");

module.exports = {

    sendMessage(json) {
        ws.sendMessage(json.key, json.connection, json.message);
    }
}