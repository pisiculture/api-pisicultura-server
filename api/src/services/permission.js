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

    getByIdUser(iduser) {
        return PermissionModel.find({ "user.id": iduser });
    },

    findByEmailUser() {
        return PermissionModel.find({ "user.email": req.body.email });
    },

    findByIdUserAndIdInstallation: async (req, res) => {

        PermissionModel.find({ user: { email: req.body.email } })
            .then(i => console.log(i));
    }
}