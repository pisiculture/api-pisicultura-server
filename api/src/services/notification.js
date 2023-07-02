const { Notification: NotificationModel } = require("../models/notifications");

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
    await NotificationModel.find({ "user.id": id})
      .then(res => {
        response.push({
          id: res.id,
          type: res.type,
          title: res.title,
          description: res.description,
          createAt: res.createAt,
          read: res.status == 'READ'
        })
      })
      .catch(err => console.log(err.message))
    return response;
  }
}