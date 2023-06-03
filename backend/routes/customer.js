const express = require('express');
const router = express.Router();

const { signUp, logIn, getShopsByCategory, getAllShops, createAppointment } = require('../controllers/customer.js');

router.post('/signUp', signUp);
router.post('/logIn', logIn);
router.post('createAppointment', createAppointment);
router.get('/getAllShops', getAllShops);
router.get('/getShopsByCategory', getShopsByCategory);

module.exports = router;