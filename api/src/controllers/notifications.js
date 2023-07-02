const service = require("../services/notification");

module.exports = {

    async findByIdUser(req, res) {
         try {
            res.status(200).json(await service.findByIdUser(req.params.id));
         } catch (error) {
            res.status(404).json({ message: "Not found notifications"});
         }
    },

    async create(req, res) {
        try {
            service.create(req.body);
            res.status(201).json({ message: "Successfully created" });
        } catch (error) {
            res.status(406).json({ message: error.message });
        }
    },
}