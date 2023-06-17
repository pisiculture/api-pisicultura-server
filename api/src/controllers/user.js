const service = require('../services/user.js');

module.exports = {
    
    async create(req, res) {
        try {
            res.status(201).json(await service.create(req.body));
        } catch (error) {
            res.status(406).json({ message: error.message });
        }
    },

    async getAll(req, res) {
        try {
            res.status(200).json(await service.findAll());
        } catch (err) {
            res.status(406).json({ message: "List of user not found." });
        }
    },

    async auth(req, res) {
       try {
         res.status(200).json(await service.auth(req.body));
       } catch (error) {
        res.status(403).json({ message: "User or password not valid." });
       }
    }
}