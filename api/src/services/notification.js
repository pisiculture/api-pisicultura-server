const { Notification: NotificationModel } = require("../models/notifications");
const { User: userModel } = require("../models/user");
module.exports = {

  async create(vo) {
    const user = userModel.findOne({ id: user.iduser });
    if (user) {
      const model = new NotificationModel({
        user: user,
        title: vo.title,
        description: vo.description,
        state: "PENDING",
        type: vo.type
      });
      await model.save();
    }
  },

  async findByIdUser(id) {
    const response = [];
    await NotificationModel.find({ "user.id": id, state: { $ne: "READ" } })
      .then(res => {
        res.forEach(el => {
          response.push({
            id: el._id,
            type: el.type,
            title: el.title,
            description: el.description,
            createAt: el.createAt,
            read: el.status == 'READ',
          });
        });
      })
      .catch(err => console.log(err.message));
    console.log(response)
    return response;
  },

  async read(iduser, id) {
    await NotificationModel.findOneAndUpdate({ "user.id": iduser, _id: id }, { state: "READ" })
      .then(res => { })
      .catch(err => { throw Error(err) });
  }
}