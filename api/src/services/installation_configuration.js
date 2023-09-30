const axios = require("axios");

const { InstallationConfiguration: InstallationConfigurationModel } = require("../models/installation_configuration");

module.exports = {
    async update(key, vo) {
       try {
        await InstallationConfigurationModel.updateOne({ key: key }, vo);
        vo.action = "EXECUTE";
        await axios.post("http://192.168.0.121:3000/ws/communication/send-message/" + key, vo)
       } catch (error) {
        console.log(error)
       }
    },

    async createDefault(key) {
        const model = new InstallationConfigurationModel({
            key: key,
            water_pump: false,
            water_lock: false,
            lighting: false
        });
        return await model.save();
    },

    async findByKey(key) {
        return InstallationConfigurationModel.findOne({ key: key });
    }
}