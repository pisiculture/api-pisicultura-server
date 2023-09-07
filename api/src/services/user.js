const { User: UserModel } = require('../models/user');

module.exports = {
    async findById(iduser) {
     await   UserModel.findOne({ id: iduser})
        .then( resp => {
            return resp;
        });
    }
}