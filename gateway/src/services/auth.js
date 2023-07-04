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
        const token = jwt.sign({ id: user._id }, process.env.SECRET);
        const { id, name } = user;
        return { id, name, email, token };
    },

    async create(json) {
        const { name, email, password } = json;

        if (!name)
            throw new Error("O nome é obrigatório!");
        if (!email)
            throw new Error("O email é obrigatório!");
        if (!password)
            throw new Error("A senha é obrigatória!");
       
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
        return await model.save();
    },
}


