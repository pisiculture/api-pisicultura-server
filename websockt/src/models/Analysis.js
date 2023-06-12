const mongoose = require('mongoose')

const { Schema } = mongoose;

const { InstallationSchema } = require("./Installation");

const AnalysisSchema = new Schema({
    id: {
        type: String
    },
    ph: {
        type: Number,
        require: true
    },
    installation: {
        type: [InstallationSchema]
    },
    dateCreate: {
        type: Date,
        require: true
    },
}, { timestamp: true });

const Analysis = mongoose.model('analysis', AnalysisSchema);

module.exports = { Analysis, AnalysisSchema }
