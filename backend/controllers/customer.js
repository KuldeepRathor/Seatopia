const Customer = require('../models/customerModel');

exports.signUp = async(req, res) => {
    try{
        const newCustomer = new Customer ({ 
            email: req.body.email,
            password: req.body.password,
            name: req.body.name,
            uid: req.body.uid,
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
