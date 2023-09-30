const mongoose = require('mongoose');

const { Schema } = mongoose;

const InstallationConfigurationSchema = new Schema({
    id: {
        type: String
    },
    key: {
        type: String,
        require: true
    },
    water_pump: {
        type: Boolean,
        require: true
    },
    water_lock: {
        type: Boolean,
        require: true
    },
    lighting: {
        type: Boolean,
        require: false
    },
    lastUpdate: {
        type: Date,
        require: false
    }
}, { timestamps: true });


const InstallationConfiguration = mongoose.model("installation_configuration", InstallationConfigurationSchema);

module.exports = {
    InstallationConfiguration, InstallationConfigurationSchema
}