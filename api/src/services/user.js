const { User: UserModel } = require('../models/user.js');
const notificationService = require("../services/notification");

module.exports = {
    async create(json) {

        if (UserModel.find({ email: json.email }))
            throw "E-mail in use.";

        const user = UserModel({
            email: json.email,
            name: json.name,
            password: json.password
        });

        const userSave = user.save();
         
        
    },

    async findByEmailAndPassword(email, password) {
        const response = UserModel.find({ email: email, password: password });
        if (!response)
            throw Error("E-mail or password is not valid...")
        return response;
    }
}


