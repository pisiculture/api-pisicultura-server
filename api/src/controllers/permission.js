const service = require('../services/permission.js')

module.exports = {

    getByUserAndInstallation: async (req, res) => {
        try {
            res.status(200)
               .json(service.getByUserAndInstallation(req.params.user, req.params.installation))
        } catch (error) {
            res.status(404).json({ message: "Permission not found." })
        }
    },
    getIdUser: async (req, res) => {
        try {
            res.status(200)
               .json(service.getByIdUser(req.params.user));
        } catch (error) {
            res.status(404).json({ message: "Not found permitions in installations for user." });
        }
    },
    create: async (req, res) => {
        try {
            res.status(201)
               .json(service.create(req.body));
        } catch (err) {
            res.status(415).json({ message: "Not conteins params request." })
        }
    },
    put: async (req, res) => {
        try {
            res.status(200)
               .json(service.put(req.params.id, req.body));
        } catch (error) {
            res.status(415).json({message: "Register not update."})
        }
    }
}