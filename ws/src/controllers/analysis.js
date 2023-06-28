const analysisService = require("../services/analysis");

module.exports = {
   
    findByInstallation(req, res) {
        try {
            res.status(200).json(analysisService.findByIdInstallation(req.params.id));
        } catch (error) {
            res.status(406).json({ message: "Error in server..."});
        }
    }
}