const service = require("../services/installation_configuration");

module.exports = {
    update: async (req, res) => {
        try {
            const json = {
                water_pump: req.body.water_pump,
                water_lock: req.body.water_lock,
            }
            service.update(req.params.key, json);
            res.status(200).json({ message: "Configuration update success." });
        } catch (error) {
            res.status(406).json({ message: error.message });
        }
    },

    getByInstallation: async (req, res) => {

    }
}