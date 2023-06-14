const { Analysis: AnalysisModel } = require("../models/analysis");

const installationService = require("../services/installation");

module.exports = {
    async create(data) {
        const installation = installationService.findByKey(data.key);
        const analysis = AnalysisModel({
            ph: data.ph,
            installation: installation
        });
        await analysis.save();
    },

    async findByIdInstallation(id) {
        await AnalysisModel.find({})
            .then((data) => {
                return data;
            });
        throw Error("Error");
    }
}