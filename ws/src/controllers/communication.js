const service = require("../services/communication");

module.exports = {
  sendExecRead(req, res) {
    try {
      service.sendMessage({ key: req.params.key, connection: "SOCKET", message: { action: "READ" } });
      res.status(200).json({ message: "Send message success." });
    } catch (error) {
      res.status(200).json({ message: error.message });
    }
  },

  sendMessage(req, res) {
    try {
      service.sendMessage({ key: req.params.key, connection: "SOCKET", message: req.body });
      res.status(200).json({ message: "Send message success." });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
}