var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "SELECT * FROM `today price`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from `today price` where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.get('/:id', function (req, res){
    var {id} = req.params;
    var sql = "UPDATE `today price` SET `Price` = '"+req.body.price+"' WHERE `today price`.`id` = 1 AND `today price`.`Hotel_idHotel` = '"+id+"'";
    if(req.body.price != null && id != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;