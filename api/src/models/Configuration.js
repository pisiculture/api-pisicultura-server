const mongoose = require('mongoose');

const { Schema } = mongoose;

const ConfigurationSchema = new Schema({
    id: {
        type: String
    },
    lastUpdate: {
        type: Date,
        require: true
    }
}, {timestamps: true});


const Configuration = mongoose.model("configuration", ConfigurationSchema);

module.exports = {
    Configuration, ConfigurationSchema
}