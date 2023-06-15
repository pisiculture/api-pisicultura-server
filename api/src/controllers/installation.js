const service = require("../services/installation")

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
            service.create(req.body);
            res.status(201)
               .json({ message: "User created successfully, check your email box."});
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