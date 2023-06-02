const mongoose = require('mongoose');

async function db() {
    try {
        mongoose.set("strictQuery", true);
        await mongoose.connect("mongodb://localhost:27016?maxPoolSize=20");
        console.log("Conectado com sucesso ao banco de dados.")
    } catch (error) {
        console.log('Erro ao conectar DB...')
    }
}

module.exports = db;