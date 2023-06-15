const service = require('../services/user.js');

module.exports = {
    create: async (req, res) => {
        try {
            await res.status(201).json(await service.create(req.body));
        } catch (error) {
            res.status(415).json({ message: error });
        }
    }
}