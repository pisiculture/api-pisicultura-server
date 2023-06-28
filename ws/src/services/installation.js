const { Installation: InstallationModel } = require("../models/installation");

module.exports = {

    async findByKey(key) {
        await InstallationModel.find({ key: key })
            .then(i => {
                return i;
            });
        throw Error("Installation not found.");
    }
}