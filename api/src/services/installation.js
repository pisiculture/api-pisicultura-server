const { Installation: InstallationModel } = require('../models/installation');

const configurationService = require('./configuration');
const permissionsService = require("./permission");
const userService = require('./user');

module.exports = {

    async create(vo) {
        const user = userService.findById(vo.iduser);
        if (!user)
            throw Error("User not found.");
        const configurations = configurationService.createDefault();
        const key = Math.random().toString(36).slice(-10);
        const model = new InstallationModel({
            key: key,
            description: vo.description,
            configurations: configurations,
            createAt: new Date(),
        });
        const installation = await model.save();
        permissionsService.create(user, installation);
        console.log(installation);
        return { message: "Installation created successfully, check your email box.", key: key };
    }
}