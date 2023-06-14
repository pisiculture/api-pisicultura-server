const mongoose = require("mongoose");

const { Schema } = mongoose;

const NotificationSchema = new Schema({
    id: {
        type: String
    },
    title: {
        type: String,
        require: true
    },
    description: {
        type: String,
        require: true
    },
    type: {
        type: String,
        require: true
    },
    state: {
        type: String,
        require: true
    },
    destiny: {
        type: String,
        require: true
    },
    onCreate: {
        type: Date,
        require: true
    },
    onSend: {
        type: String,
        require: true
    }
});

const Notification = mongoose.model("notification", NotificationSchema);

module.exports = { Notification, NotificationSchema };
