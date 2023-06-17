const { Permission: PermissionModel } = require('../models/permission.js')


module.exports = {

    async create(user, installation) {
        const model = new PermissionModel({
            user: user,
            installation: installation,
            privilegs: ["CREATE", "UPDATE", "VIEW"],
            createdAt: new Date()
        });
        return await model.save();
    },

    async findByIdUser(id) {
        await PermissionModel.find({ user: { id: id } })
            .then(i => console.log(i));
    },

    async findByEmailUser() {
        await PermissionModel.find({ user: { email: req.body.email } })
            .then(i => console.log(i));
    },

    findByIdUserAndIdInstallation: async (req, res) => {

        PermissionModel.find({ user: { email: req.body.email } })
            .then(i => console.log(i));
    }
}