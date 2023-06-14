const { Configuration: ConfigurationModel } = require("../models/Configuration");
const { Installation: InstallationModel } = require("../models/Installation");

module.exports = {
    async update(id, vo) {

        await ConfigurationModel.findOneAndUpdate({ id: id }, vo);

        console.log(ConfigurationModel.find({ id: id }))

    },

    async create(vo) {

        const installation = InstallationModel.find({ id: vo.idinstallation });

        if (!installation)
            throw Error("Installation not found.");

        const model = new ConfigurationModel({
            installation: [installation],
            water_pump: vo.water_pump || false,
            water_lock: vo.water_lock || false
        });

        await model.save();
    },

    async findByIdInstallation() {
        const response = await ConfigurationModel.find({
            idinstallation: {
                id: id
            }
        });
        if (!response)
            throw Error("Configuration not found.");
        return response;
    }
}