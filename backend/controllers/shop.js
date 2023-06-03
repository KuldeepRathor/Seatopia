const Shop = require('../models/shopModel');

exports.createShop = async(req, res) => {
    try{
        const newShop = new Shop ({
            ...req.body,
        });
        const shop = await newShop.save();
        res.status(200).json(shop);
    }catch(err){
        return res.json(err);
    }
};