const express = require('express');
const router = express.Router();

const { signUp, logIn, getShopsByCategory, getAllShops, createAppointment, getAppointment } = require('../controllers/customer.js');

router.post('/signUp', signUp);
router.post('/logIn', logIn);
router.post('/createAppointment', createAppointment);
router.get('/getAllShops', getAllShops);
router.get('/getShopsByCategory', getShopsByCategory);
router.get('/getAppointment', getAppointment);

module.exports = router;