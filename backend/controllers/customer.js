const Customer = require('../models/customerModel');
const Shop = require('../models/shopModel');

exports.signUp = async(req, res) => {
    try{
        const newCustomer = new Customer ({ 
            email: req.body.email,
            password: req.body.password,
            name: req.body.name,
            uid: req.body.uid,
            phone: req.body.phone,
        });    
        const customer = await newCustomer.save();
        res.status(200).json(customer);
    } catch(err){
        return res.json(err);
    }
};

exports.logIn = async(req,res) => {
    try{
        const customer = await Customer.findOne({
            email: req.body.email,
            password: req.body.password
        });
        !customer && res.status(400).json("Invalid credentials");
        res.status(200).json(customer);
    }catch (err){
        res.status(200).json(err);
    }
};

exports.getShopsByCategory = async(req, res) => {
    const {category} = req.body;
    try{
        const shops = await Shop.find({category: category});
        res.status(200).json(shops);
    } catch(err){
        return res.json(err);
    }
}

exports.getAllShops = async(req, res) => {
    try{
        const shops = await Shop.find();
        res.status(200).json(shops);
    } catch(err){
        return res.json(err);
    }
}

exports.createAppointment = async(req, res) => {
    const {shopUid, userUid, timeslot, appointmentmsg} = req.body;
    try{
        Event.findOne({ uid: shopUid })
        .then((shop) => {
          if (!shop) {
            return res.status(404).json({ error: 'Shop not found' });
          }
          shop.timeslots.set(timeslot, { user: userUid, appointmentmsg: appointmentmsg });
          return shop.save();
        })
        .then((updatedShop) => {
          res.status(200).json({ message: 'Appointment created', shop: updatedShop });
        })
        .catch((error) => {
          res.status(500).json({ error: 'Error creating appointment', message: error.message });
        });
    } catch(err){
        return res.json(err);
    }
}