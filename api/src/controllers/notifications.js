const service = require("../services/notification");

module.exports = {
    async create(req, res) {
        try {
            service.create(req.body);
            res.status(201).json({ message: "Successfully created" });
        } catch (error) {
            res.status(406).json({ message: error.message });
        }
    }
}