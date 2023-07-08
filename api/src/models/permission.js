const mongoose = require('mongoose');

const { UserSchema } = require('./user');
const { InstallationSchema } = require('./installation');

const { Schema } = mongoose;

const PermissionSchema = new Schema({
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
}, { timestamps: true });

const Permission = mongoose.model('permission', PermissionSchema);

module.exports = { Permission, PermissionSchema }
