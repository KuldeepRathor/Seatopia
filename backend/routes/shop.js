const express = require('express');
const router = express.Router();

const { createShop } = require('../controllers/shop.js');

router.post('/createShop', createShop);

module.exports = router;