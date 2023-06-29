const mongoose = require('mongoose');
require("dotenv").config();

async function db() {
    try {
        mongoose.set("strictQuery", true);
        await mongoose.connect(`mongodb://db/app?retryWrites=true&w=majority`);
        console.log("Conectado com sucesso ao banco de dados.")
    } catch (error) {
        console.log('Erro ao conectar DB...', error.message)
    }
}

module.exports = db;