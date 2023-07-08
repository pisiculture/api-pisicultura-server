const WebSocket = require('ws');
let sessions = [];
const analysisService = require("../services/analysis");

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
          if (json.service)
            i.service = json.service;
        }
        return i;
      })
      break;
    }
    case 'MESSAGE': {
      const data = json.data;
      data.key = getKeyBySessionAndConnection(session, 'SOCKET');
      analysisService.create(data);
      break;
    }
    default:
      {

      }
  }
}

function getKeyBySessionAndConnection(session, connection) {
  const response = sessions.find(i => i.session == session && i.connection == connection);
  if (!response)
    throw new Error("Session not found.");
  return response.key;
}

function onClose(session) {
  sessions = sessions.filter(s => s.session !== session);
}

function onConnection(session, req) {
  sessions.push({ session: session })
  session.on('message', data => onMessage(session, data));
  session.on('error', error => onError(session, error));
  session.on('close', socket => onClose(session));
}

 function startIA() {
  console.log("Executando processo IA..");
  sessions
    .filter(i => i.connection == "SOCKET")
    .forEach(s => {
      s.session.send(JSON.stringify({ action: 'READ' }));
    });
  //setInterval(() => startIA(), 60000)
}

module.exports = {
  ws(server) {
    const wss = new WebSocket.Server({ server });
    wss.on('connection', onConnection);
    console.log(`App Web Socket Server is running!`);
    startIA();
    return wss;
  },

  getSessions() {
    return sessions;
  },

  sendMessage(key, connection, message) {
    if (sessions && sessions !== []) {
      let send = false;
      sessions
        .filter(i => (i.key === key) && (i.connection == connection))
        .forEach(s => {
          send = true;
          s.session.send(JSON.stringify(message));
        });
      if (!send)
        throw Error("Client not connected in server...");
    }
  }
}