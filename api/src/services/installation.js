const { Installation : InstallationModel } = require('../models/installation');
const configurationService = require('./configuration');
const permissionsService = require("./permission");

module.exports = {

    async create(vo) {

        const configurations = configurationService.createDefault();
        const key =  Math.random().toString(36).slice(-10);

        const model = new InstallationModel({
           key: key,
           description: vo.description,
           configurations: configurations,
           createAt: new Date(),
        });

     const installation = await model.save();

     permissionsService.create()
    }
}