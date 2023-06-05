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

    post: async (req, res) => {
        try {
            res.status(201)
               .json(service.post(req.body));
        } catch (error) {
            res.status(406)
               .json({ message: "Params required not found. " });
        }
    },

    put: async (req, res) => {
        try {
            res.status()
        } catch (error) {
          res.status(406).json({message: error});   
        }
    },

    delete: (req, res) => {

    }
}