const WebSocket = require('ws');
let sessions = [];

function onError(session, err) {
  console.error(`onError: ${err.message}`);
}

function onMessage(session, data) {
  let json = JSON.parse(data.toString());
  switch (json.event) {
    case "REGISTER": {
      sessions = sessions.map(i => {
        if (i.session === session) {
          i.key = json.key;
          i.connection = json.connection;
        }
        return i;
      })
      break;
    }
    case 'MESSAGE': {
      analysisService.create(json.data);
      break;
    }
    default:
      {

      }
  }
}

function sendMessage(key, connection, message) {
  if (sessions && sessions !== [])
    sessions
      .filter(i => (i.key === key) && (i.connection == connection))
      .forEach(s => s.session.send(message));
}

function onClose(session) {
  sessions = sessions.filter(s => s.session !== session);
}

function onConnection(session, req) {

  console.log(session);
  sessions.push({ session: session })

  session.on('message', data => onMessage(session, data));
  session.on('error', error => onError(session, error));
  session.on('close', socket => onClose(session));
}

module.exports = {
  ws(server) {
    const wss = new WebSocket.Server({ server });

    wss.on('connection', onConnection);

    console.log(`App Web Socket Server is running!`);
    return wss;
  },
  
  getSessions() {
    return sessions;
  }

}