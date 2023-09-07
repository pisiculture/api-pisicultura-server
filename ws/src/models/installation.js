const mongoose = require('mongoose')

const { Schema } = mongoose;

const { InstallationConfigurationSchema } = require("./installation_configuration");

const InstallationSchema = new Schema({
    id: {
        type: String,
        require: true
    },
    key: {
        type: String,
        require: true
    },
    description: {
        type: String,
        require: true
    },
    configurations: {
        type: InstallationConfigurationSchema
    },
    dateCreate: {
        type: Date,
        require: true
    },
}, { timestamps: true });

const Installation = mongoose.model("installation", InstallationSchema);

module.exports = {
    Installation, InstallationSchema
}