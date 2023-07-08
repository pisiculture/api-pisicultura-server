const { Installation: InstallationModel } = require("../models/installation");

module.exports = {

    async findByKey(key) {
        const response = await InstallationModel.findOne({ key: key })
        if (!response)
            throw Error("Installation not found.");
        return response;
    }
}