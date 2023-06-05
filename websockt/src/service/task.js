const ws = require("../service/websocket");

module.exports = {
    send: async (json) => {
        if (!json.key)
            throw new Error("Não informado a instalação a ser enviada mensagem.");
        if(!json.message)
           throw new Error("Mensagem não informada..");
        ws.send(json.key, json.message);
    }
}