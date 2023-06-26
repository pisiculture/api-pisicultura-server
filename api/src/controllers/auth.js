const service = require('../services/auth');

module.exports = {
    async create(req, res) {
        try {
            await service.create(req.body);
            res.status(201).json({ msg: "Usuário criado com sucesso!" });
        } catch (error) {
            res.status(422).json({ msg: error.message });
        }
    },

    async login(req, res) {
        try {
            res.status(200).json({ msg: "Autenticação realizada com sucesso!", token: await service.login(req.body) });
        } catch (error) {
            res.status(500).json({ msg: error.message });
        }
    }

}