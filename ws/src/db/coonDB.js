const mongoose = require('mongoose');
require("dotenv").config();

async function db() {
    try {
        mongoose.set("strictQuery", true);
        await mongoose.connect(`mongodb+srv://${process.env.MONGO_USER}:${process.env.MONGO_PASSWORD}@app.bjknbjj.mongodb.net/${process.env.MONGO_DB}?retryWrites=true&w=majority`);
        console.log("Conectado com sucesso ao banco de dados.")
    } catch (error) {
        console.log('Erro ao conectar DB...')
    }
}

module.exports = db;