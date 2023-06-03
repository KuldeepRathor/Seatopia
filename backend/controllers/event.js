const mongoose = require('mongoose');
const EventModel = require('../models/event');

exports.createmyEvent = async (req, res) => {
    try {
        console.log(req.body);
        const event = await EventModel.create({
            ...req.body,
        });
        res.status(201).json({
            success: true,
            event,
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            error: 'Error creating event',
        });
    }
};

exports.deletemyEvent = async (req, res) => {
    try {
        const event = await EventModel.findById(req.params.id);
        if (event.createdBy.toString() !== req.user._id.toString()) {
            throw new Error('Unauthorized');
        }
        await EventModel.findByIdAndDelete(req.params.id);
        res.status(200).json({
            success: true,
            event,
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            error: 'Error deleting event',
        });
    }
};
