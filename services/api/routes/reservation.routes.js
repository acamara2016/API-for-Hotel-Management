var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "select * from Reservation";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `reservation` (`id`, `start`, `end`, `Customer_Name`, `Today Price_id`, `Today Price_Hotel_idHotel`) VALUES (NULL, '"+req.body.start+"', '"+req.body.end+"', '"+req.body.name+"', '"+req.body.price_id+"', '"+req.body.hotel_id+"')";
    if(req.body.start != null && req.body.end != null && req.body.name != null && req.body.price_id != null && req.body.hotel_id != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;