var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "SELECT * FROM `rooms_has_check`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from rooms_has_check where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `rooms_has_check` (`Rooms_idRoom`, `Check_id`, `Check_Customer_Name`) VALUES ('"+req.body.idRoom+"', '"+req.body.idCheck+"', '"+req.body.name+"')";
    if(req.body.name != null && req.body.idCheck != null && req.body.idRoom != null){
        db.query(sql, function (err,result){
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;