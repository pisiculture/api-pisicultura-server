const mongoose = require('mongoose');

const { Schema } = mongoose;

const { InstallationSchema } = require("./Installation")

const TaskSchema = new Schema({
    id: {
        type: String
    },
    installation:{
      type: [ InstallationSchema ]
    },
    type: {
        type: String
    },
    dateCreate: {
        type: Date
    },
},
    { timestamps: true }
);

const Task = mongoose.model('task', TaskSchema);

module.exports = {
    Task, TaskSchema
}