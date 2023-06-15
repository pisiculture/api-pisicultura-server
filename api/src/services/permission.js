const { Permission: PermissionModel } = require('../models/permission.js')


module.exports = {
  
   async create(user, installation) {
     const model = new PermissionModel({
         user: user,
         installation: installation,
         privilegs: [ "CREATE", "UPDATE", "VIEW"],
         createdAt: new Date()
     });
     return await model.save();
    },

    findByIdUserAndIdInstallation: async (req, res) => {
        
    }
}