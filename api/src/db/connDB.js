const mongoose = require('mongoose');

async function db() {
    try {
        mongoose.set("strictQuery", true);
        await mongoose.connect("mongodb+srv://root:MSoD6UtOopWqVkyh@app.bjknbjj.mongodb.net/?retryWrites=true&w=majority");
        console.log("Conectado com sucesso ao banco de dados.")
    } catch (error) {
        console.log('Erro ao conectar DB...')
    }
}

module.exports = db;