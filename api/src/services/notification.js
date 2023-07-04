const { Notification: NotificationModel } = require("../models/notifications");
const { User: UserModel } = require('../models/user');

module.exports = {

  async create(user, vo) {
    const model = new NotificationModel({
      user: user,
      title: vo.title,
      description: vo.description,
      state: "PENDING",
      type: vo.type
    });
    await model.save();
  },

  async findByIdUser(id) {
    const response = [];
    await NotificationModel.find({ "user.id": id })
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
      .catch(err => console.log(err.message))
    return response;
  }
}