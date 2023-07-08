const { Analysis: AnalysisModel } = require("../models/analysis");

module.exports = {
    async findTemperatureByIdInstallation(id) {
        const response = [];
        AnalysisModel.find({ "installation.id": id })
            .then(res => {
                res.forEach(r => response.push({
                    temperature: id.temperature,
                    createdAt: r.createdAt
                }));
            });
        return response;
    },

    async findPhByIdInstallation(id) {
        const response = [];
        await AnalysisModel.find({ "installation.id": id })
            .then(req => {
                req.forEach(r =>
                    response.push({
                        ph: r.ph,
                        createdAt: r.createdAt
                    })
                );
            });
        return response;
    }
}