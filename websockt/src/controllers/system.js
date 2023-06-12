const service = require("../services/system");

module.exports = {
    sessions(req, res) {
        try {
         let sessions = service.sessions();
         res.status(200).json({ message: "List of session", session: sessions})
        } catch (error) {
            res.status(500).json({ message: "Error server..."});
        }
    }
}