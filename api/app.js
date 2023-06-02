const express = require('express')
const cors = require('cors')
const conn = require('./src/db/connDB')
const app = express();

app.use(cors());
app.use(express.json());
conn();

const taskController = require("./src/controllers/task_controller");

app.get('/api/', taskController.post);

app.listen(3001, () => console.log('Servidor API iníciado com sucesso.'))