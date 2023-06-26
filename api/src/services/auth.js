const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { User: UserModel } = require('../models/user.js');
const notificationService = require("./notification.js");

module.exports = {
    async create(json) {
        const { name, email, password, confirmpassword } = json;

        if (!name)
            throw new Error("O nome é obrigatório!");
        if (!email)
            throw new Error("O email é obrigatório!");
        if (!password)
            throw new Error("A senha é obrigatória!");
        if (password != confirmpassword)
            throw new Error("A senha e a confirmação precisam ser iguais!");

        const userExists = await UserModel.findOne({ email: email });

        if (userExists)
            throw new Error("Por favor, utilize outro e-mail!");

        const salt = await bcrypt.genSalt(12);
        const passwordHash = await bcrypt.hash(password, salt);

        const model = new UserModel({
            name: name,
            email: email,
            password: passwordHash,
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


