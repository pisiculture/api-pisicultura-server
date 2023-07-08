const mongoose = require('mongoose');

const { Schema } = mongoose;

const ConfigurationSchema = new Schema({
    notify: {
        type: Boolean,
        require: true
    },
    active: {
        type: Boolean,
        require: true
    },
}, { timestamps: true });


const Configuration = mongoose.model("configuration", ConfigurationSchema);

module.exports = { Configuration, ConfigurationSchema }