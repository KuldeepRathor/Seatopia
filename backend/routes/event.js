const express = require('express');
const router = express.Router();

const {
    createmyEvent,
} = require('../controllers/event.js');

router.post('/createmyEvent',  createmyEvent);
module.exports = router;