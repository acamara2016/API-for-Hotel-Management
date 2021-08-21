var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "SELECT * FROM `payment`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from payment where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `payment` (`method`, `date`, `Customer_Name`) VALUES ('"+req.body.method+"', '"+req.body.date+"', '"+req.body.name+"')";
    if(req.body.name != null && req.body.date != null && req.body.method != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;