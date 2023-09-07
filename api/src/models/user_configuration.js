const mongoose = require('mongoose');

const { Schema } = mongoose;

const UserConfigurationSchema = new Schema({
    notify: {
        type: Boolean,
        require: true
    },
    active: {
        type: Boolean,
        require: true
    },
}, { timestamps: true });


const UserConfiguration = mongoose.model("user_configuration", UserConfigurationSchema);

module.exports = { UserConfiguration, UserConfigurationSchema }