const mongoose = require('mongoose')

const { Schema } = mongoose;

const { ConfigurationSchema } = require("./configuration");

const InstallationSchema = new Schema({
    key: {
        type: String,
        require: true
    },
    description: {
        type: String,
        require: true
    },
    configurations: {
        type: ConfigurationSchema
    },
}, { timestamp: true });

const Installation = mongoose.model("installation", InstallationSchema);

module.exports = { Installation, InstallationSchema }