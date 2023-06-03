const mongoose = require('mongoose');

const customerSchema = new mongoose.Schema(
    {
        uid: {
            type: String,
            required: true,
            unique: true,
        },
        email: {
            type: String,
            required: [true, 'Please Enter Your Email'],
            unique: true,
        },
        password: {
            type: String,
            required: [true, 'Please Enter Your Password'],
        },
        name: {
            type: String,
            required: true,
        },
        phone: {
            type: String,
        },
        apoointment: {
            type: String,
        },
    },
    { timestamps: true }
);

module.exports = mongoose.model('Customer', customerSchema);