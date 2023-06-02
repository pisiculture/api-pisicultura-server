const service = require('../services/task_service');

module.exports = {

    getById: async (req, res) => {
        try {
            const response = await service.findById(req.params.id);

            if (response)
                res.status(200).json(response);

        } catch (error) {
            return res.status(404).json({ message: "Register not found." });
        }
    },

    post: async (req, res) => {

        const task = TaskSchema({

        });

        res.send('<h1> TESTE</h1>')
    },
    delete: async (req, res) => {

    },
    put: async (req, res) => {
        try {

        } catch (error) {

        }
    }
}