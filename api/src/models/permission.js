const mongoose = require('mongoose');

const { UserSchema } = require('./user');
const { InstallationSchema } = require('./installation');

const { Schema } = mongoose;

const PermissionSchema = new Schema({
    id: String,
    user: {
        type: UserSchema,
        require: true
    },
    installation: {
        type: InstallationSchema,
        require: true
    },
    privilegs: {
        type: [],
        require: true
    },
    createdAt: {
        type: Date,
        require: true
    },
    updatedAt: {
        type: Date,
        required: true
    }
}, { timestamps: true });

const Permission = mongoose.model('permission', PermissionSchema);

module.exports = { Permission, PermissionSchema }
