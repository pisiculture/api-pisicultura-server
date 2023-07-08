const { Analysis: AnalysisModel } = require("../models/analysis");

module.exports = {
    async findTemperatureByIdInstallation(id) {
        const response = [];
        AnalysisModel.find({ "installation.id": id })
            .then(res => {
                res.forEach(r => response.push({
                    temperature: id.temperature,
                    createAt: r.createAt
                }));
            });
        return response;
    },

    async findPhByIdInstallation(id) {
        const response = [];
        const req = await AnalysisModel.find();
         console.log(req)
        if (req) {
            req.forEach(r => response.push({
                ph: id.ph,
                createAt: r.createAt
            }));
        }

        return response;
    }
}