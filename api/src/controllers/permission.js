const service = require('../services/permission.js')

module.exports = {

    async getByIdUser(req, res) {
        console.log(req.header)
        try {
            res.status(200).json(await service.getByIdUser(req.params.id))
        } catch (error) {
            res.status(404).json({ message: "Permission not found." })
        }
    },

    async update(req, res) {
        try {
            res.status(200).json(await service.update(req.params.id, req.body));
        } catch (error) {
            res.status(415).json({message: "Register not update."})
        }
    }
}