const service = require("../service/task");

const ws = require("../service")

module.exports = {
    send: (req, res) => {
       try {
         res.status(200)
            .json({ message: "Message send success." });
       } catch (error) {
         res.status(406)
            .json({ message: error });
       }
    }
}