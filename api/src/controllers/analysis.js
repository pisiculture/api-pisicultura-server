const service = require("../services/analysis");

module.exports = {
    async findPhByIdInstallation(req, res) {
        try {
            res.status(200).json(service.findPhByIdInstallation(req.params.id));
        } catch (err) {
            res.status(404).json({ message: err.message });
        }
    },

    async findTemperatureByIdInstallation(req, res) {
        try {
            res.status(200).json(service.findTemperatureByIdInstallation(req.params.id));
        } catch (err) {
            res.status(404).json({ message: err.message });
        }
    }
}