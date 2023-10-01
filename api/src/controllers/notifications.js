const service = require("../services/notification");

module.exports = {

    async findByIdUser(req, res) {
         try {
            res.status(200).json(service.findByIdUser(req.params.id));
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

    async read(req, res) {
        try {
            service.read(req.params.iduser, req.params.id);
            res.status(202).json({ message: "Update state sucessfull."});
        } catch (err) {
            res.status(404).json({ message: err.message });
        }
    }
}