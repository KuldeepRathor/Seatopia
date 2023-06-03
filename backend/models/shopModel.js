const mongoose = require('mongoose');

const shopSchema = new mongoose.Schema(
    {
        uid: {
            type: String,
            required: [true, 'Event uid is required'],
        },
        category: {
            type: String,
            required: [true, 'Event category is required'],
        },
        address: {
            type: String,
        },
        coordinates: {
            longitude: {
                type: Number,
            },
            latitude: {
                type: Number,
            },
        },
        name: {
            type: String,
        },
        phone: {
            type: String,
        },
        email: {
            type: String,
        }, 
        password: {
            type: String,
        },
        images:{
            type:[String],
        },
        services: {
            type: String,
        },
        timeslots: {
            type: Map,
            of: {
                user: String,
                appointmentmsg: String,
            },
        }
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model('Shop', shopSchema);