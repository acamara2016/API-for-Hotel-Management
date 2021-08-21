var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "SELECT * FROM `bill`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from bill where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `bill` (`id`, `Invoice_id`, `Invoice_Payment_method`, `Invoice_Payment_Customer_Name`, `Amount`, `Date`, `Fname`, `Lname`, `Type`) VALUES (NULL, '"+req.body.invoice_id+"', '"+req.body.method+"', '"+req.body.name+"', '"+req.body.price+"', '"+req.body.date+"', '"+req.body.fname+"', '"+req.body.lname+"', '"+req.body.type+"')";
    if(req.body.fname != null && req.body.lname != null && req.body.invoice_id != null && req.body.date != null && req.body.method != null && req.body.type != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;