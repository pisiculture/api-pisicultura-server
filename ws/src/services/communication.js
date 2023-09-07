const ws = require("../ws/websocket");

module.exports = {

    sendMessage(json) {
        console.log(json)
        ws.sendMessage(json.key, json.connection, json.message);
    }
}