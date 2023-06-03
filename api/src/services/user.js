const { User: UserModel } = require('../models/User.js');

module.exports = {
    create: async (json) => {

        if (UserModel.find({ email: json.email }))
            throw "E-mail in use.";

        const user = UserModel({
            email: json.email,
            name: json.name,
            password: json.password
        });

        return user.save();
    }
}