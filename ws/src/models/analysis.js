const mongoose = require('mongoose')

const { Schema } = mongoose;

const { InstallationSchema } = require("./installation");

const AnalysisSchema = new Schema({
    ph: {
        type: Number,
        require: true
    },
    temperature: {
        type: Number,
        require: true
    },
    installation: {
        type: InstallationSchema
    },
}, { timestamps: true });

const Analysis = mongoose.model('analysis', AnalysisSchema);

module.exports = { Analysis, AnalysisSchema }
