const { Configuration: ConfigurationModel } = require("../models/configuration");

module.exports = {
    async update(id, vo) {

        await ConfigurationModel.findOneAndUpdate({ id: id }, vo);

        console.log(ConfigurationModel.find({ id: id }))

    },

    async createDefault() {
        const model = new ConfigurationModel({
            water_pump: false,
            water_lock: false
        });
       return await model.save();
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