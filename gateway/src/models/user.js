const mongoose = require('mongoose');

const { Schema } = mongoose;

const UserSchema = new Schema({
    email: {
        type: String,
        require: true,
    },
    name: {
        type: String,
        require: true
    },
    password: {
        type: String,
        require: true
    },
}, { timestamps: true });

const User = mongoose.model("user", UserSchema);

module.exports = { User, UserSchema };