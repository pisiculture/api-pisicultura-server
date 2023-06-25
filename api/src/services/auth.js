const { User: UserModel } = require('../models/user.js');
const notificationService = require("./notification.js");

module.exports = {
    async create(json) {

        const email = await this.findByEmail(json.email);

        if (email.length > 0)
            throw Error("E-mail in use.");

        const model = UserModel({
            email: json.email,
            name: json.name,
            password: json.password,
            createAt: new Date()
        });

        const user = await model.save();
        notificationService.create(user, { title: "User created with success.", description: "Message success." });
        return user;
    },

    findByEmail(email) {
        return UserModel.find({ email: email });
    },

    findByEmailAndPassword(email, password) {
        const response = UserModel.find({ email: email, password: password });
        if (!response)
            throw Error("E-mail or password is not valid...")
        return response;
    },

    findAll() {
       return UserModel.find({});
    },

    auth(vo) {
        return UserModel.find({ username: vo.username });
    }
}


