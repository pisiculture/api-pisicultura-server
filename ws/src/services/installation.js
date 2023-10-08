const { Installation: InstallationModel } = require("../models/installation");

module.exports = {

    async findByKey(key) {
        const response = await InstallationModel.findOne({ key: key })
        console.log(response)
        if (!response)
            return {};
        return response;
    }
}