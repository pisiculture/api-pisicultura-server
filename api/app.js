const express = require('express')
const cors = require('cors')

const jwt = require("jsonwebtoken");

const app = express();

app.use(cors());
app.use(express.json());

const conn = require('./src/db/connDB');
conn();

function checkToken(req, res, next) {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (!token) return res.status(401).json({ msg: "Acesso negado!" });

    try {
        const secret = process.env.SECRET;

        jwt.verify(token, secret);

        next();
    } catch (err) {
        res.status(400).json({ msg: "O Token é inválido!" });
    }
}

const routers = require("./src/routers/router");
app.use('/', routers);

app.listen(3001, () => console.log('Servidor API iníciado com sucesso.'));