const mongoose = require('mongoose');

const { UserSchema } = require('../models/User');
const { InstallationScrema } = require('../models/Installation');

const { Schema } = mongoose;

const PermissionSchema = new Schema({
    id: String,
    user: {
        type: [UserSchema],
        require: true
    },
    installation: {
        type: [InstallationScrema],
        require: true
    },
    dateCreate: {
        type: Date,
        require: true
    }
}, { timestamps: true });

const Permission = mongoose.model('permission', PermissionSchema);

module.exports = { Permission, PermissionSchema }