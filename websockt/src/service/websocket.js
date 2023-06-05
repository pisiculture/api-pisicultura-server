const WebSocket = require('ws');
const server = new WebSocket.Server({ port: 3001 });
let sockets = [];

server.on('connection', function (socket) {

    sockets.push({ key: "", socket: socket });

    socket.on('message', function (msg) {
        sockets.forEach(s => s.send(msg));
    });
    
    socket.on('close', function () {
        sockets = sockets.filter(s => s.socket !== socket);
    });
});

module.exports = {
    send: async (key, message) => {
        for (i in sockets) {
            if (i.key == key) {
              i.socket.send(message);
            }
        }
    }
}
