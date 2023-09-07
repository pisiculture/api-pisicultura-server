const axios = require("axios");

const { InstallationConfiguration: InstallationConfigurationModel } = require("../models/installation_configuration");

module.exports = {
    async update(key, vo) {

        await InstallationConfigurationModel.findOneAndUpdate({ key: key }, vo);
        axios.post("192.168.0.121:3000/ws/communication/send-message/" + key, vo);
    },

    async createDefault() {
        const model = new InstallationConfigurationModel({
            water_pump: false,
            water_lock: false
        });
        return await model.save();
    },

    async findByIdInstallation(idinstallation) {
        const response = await InstallationConfigurationModel.find({ "installation._id": idinstallation });
        if (await response.length == 0)
            throw Error("Configuration not found.");
        return response;
    }
}