var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "select * from Customer";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from Customer where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `customer` (`Name`, `Email`, `Country`, `SSN`) VALUES ('"+req.body.name+"', '"+req.body.email+"', '"+req.body.email+"', '"+req.body.ssn+"')";
    if(req.body.name != null && req.body.email != null && req.body.country != null && req.body.ssn != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;