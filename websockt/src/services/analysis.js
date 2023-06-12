const { Analysis: AnalysisModel } = require("../models/Analysis");

const servi = require("../../app");


module.exports = {
    async create(data) {

        console.log(data);

        const analysis = AnalysisModel({
            ph: data.ph
        });

        await analysis.save();
    },

    findByIdInstallation(req, res) {
        console.log(servi.sockets);
        res.status(200).json({ message: "Success"});
    }
}