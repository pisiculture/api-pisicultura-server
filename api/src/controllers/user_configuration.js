const service = require("../services/user_configuration")

module.exports = {

    getById: async (req, res) => {
        try {
            res.status(200)
               .json(service.getById(req.params.id));
        } catch (error) {
            res.status(406)
               .json({ message: "Register not found. " });
        }
    },

    async create(req, res) {
        try {
            res.status(201)
               .json(await service.create(req.body));
        } catch (error) {
            res.status(406)
               .json({ message: "Params required not found. " });
        }
    },

     async update(req, res) {
        try {
            res.status(200).json({});
        } catch (error) {
          res.status(406).json({message: error});   
        }
    },

    delete: (req, res) => {

    }
}