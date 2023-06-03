const service = require('../services/permission.js')

module.exports = {

    getByUserAndInstallation: async (req, res) => {
         try {
            res.status(200).json(c)
         } catch (error) {
            res.status(404).json( { message: "Permission not found."} )
         }
    },
    create: async (req, res) => {
        try {

        }catch(err) {
            res.status(203).json({ message: "Not conteins params request." })
        }
    }
}