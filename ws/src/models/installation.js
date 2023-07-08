const mongoose = require('mongoose')

const { Schema } = mongoose;

const { ConfigurationSchema } = require("./configuration");

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
        type: ConfigurationSchema
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