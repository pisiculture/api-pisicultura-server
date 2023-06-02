const { Task: TaskModel } = require("../models/Task")

module.exports = {

    findById: async (id) => {
        return TaskModel.findById(id);
    }
,
    post: async (dados) => {
        const task = {
            description: task.description,
            
        }
    }
}