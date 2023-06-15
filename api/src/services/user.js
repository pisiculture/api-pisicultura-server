const { User: UserModel } = require('../models/user.js');
const notificationService = require("../services/notification");

module.exports = {
    async create(json) {
        if (this.findByEmail(json.email))
            throw Error("E-mail in use.");
        const model = UserModel({
            email: json.email,
            name: json.name,
            password: json.password,
            createAt: new Date()
        });
        return await model.save();
    },

    async findByEmail(email) {
        await UserModel.find({ email: email })
            .then(r => {
                return r
            });
        return {};
    },

    async findByEmailAndPassword(email, password) {
        const response = UserModel.find({ email: email, password: password });
        if (!response)
            throw Error("E-mail or password is not valid...")
        return response;
    }
}


