const WebSocket = require('ws');
let sessions = [];
const analysisService = require("../services/analysis");

function onError(session, err) {
  sessions = sessions.filter(s => s.session !== session);
  console.error(`onError: ${err.message}`);
}

function serviceSocketExec(session) {
  if (sessions.filter(i => i.session != session).length > 0) {
    session.send(JSON.stringify({ action: 'READ' }));
    setTimeout(() => serviceSocketExec(session), 5000);
  }
}

function execServiceDashboard(data) {
  sessions
    .filter(i =>
      i.key == data.key &&
      i.connection == "CLIENT" &&
      i.service == "DASHBOARD")
    .forEach(i => i.session.send(JSON.stringify({ ph: Math.floor(Math.random() * 100) + 1 || 0, temperature: data.temperature || 0 })));
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
      });
      if (json.connection == "SOCKET")
        serviceSocketExec(session);
      break;
    }
    case 'MESSAGE': {
      const info = json.data;
      info.key = getKeyBySessionAndConnection(session, 'SOCKET');
      analysisService.create(info);
      execServiceDashboard(info);
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
  session.on('error', err => onError(session, err));
  session.on('close', () => onClose(session));
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