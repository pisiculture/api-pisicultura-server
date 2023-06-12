const mongoose = require('mongoose');

async function db() {
    try {
        mongoose.set("strictQuery", true);
        await mongoose.connect("mongodb://localhost:27016?maxPoolSize=20");
        console.log("Connected in data base with success.")
    } catch (error) {
        console.log('Erro ao conectar DB...')
    }
}

module.exports = db;