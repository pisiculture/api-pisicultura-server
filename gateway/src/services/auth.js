const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { User: UserModel } = require('../models/user.js');

module.exports = {
   
    async auth(json) {       
        const { email, password } = json;

        if (!email) 
            throw new Error("O email é obrigatório!");

        if (!password)
            throw new Error("A senha é obrigatória!");

        const user = await UserModel.findOne({ email: email });

        if (!user)
            throw new Error("Usuário não encontrado!");

        const checkPassword = await bcrypt.compare(password, user.password);

        if (!checkPassword)
            throw new Error("Senha inválida");
        return jwt.sign({ id: user._id }, process.env.SECRET);
    },
}


