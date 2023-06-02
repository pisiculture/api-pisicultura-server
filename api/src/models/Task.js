const mongoose = require('mongoose');

const { Schema } = mongoose;

const taskSchema = new Schema({
    id: String,
    type: String,
    dateCreate: Date,
    
});