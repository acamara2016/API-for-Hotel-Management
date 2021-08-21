var db = require('../db/connection');
var express = require('express');
var router = express.Router();


router.get('/', function (req, res){
    var sql = "SELECT * FROM `rooms`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:type/:id', function (req, res){
    var {type, id} = req.params;
    var sql = "select * from rooms where "+type+" = '"+id+"'";
    if(  id != null){
        db.query(sql, function (err,result){
        res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/', function (req, res){
    var sql = "INSERT INTO `rooms` (`idRoom`, `level`, `occupancy`, `ready`) VALUES ('"+req.body.idRoom+"', '"+req.body.level+"', '"+req.body.occupancy+"', '"+req.body.ready+"')";
    if(req.body.idRoom != null && req.body.level != null && req.body.occupancy != null && req.body.ready != null){
        db.query(sql, function (err,result){
            if(err) return res.json(err);
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/occupy', function (req, res){
    var sql = "UPDATE `rooms` SET `occupancy` = 'YES' WHERE `rooms`.`idRoom` = "+req.body.id+"";
    if(req.body.id != null){
        db.query(sql, function (err,result){
            if(err){return res.json(err);}
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});
router.post('/ready', function (req, res){
    var sql = "UPDATE `rooms` SET `ready` = 'YES' WHERE `rooms`.`idRoom` = "+req.body.id+"";
    if(req.body.id != null){
        db.query(sql, function (err,result){
            if(err){return res.json(err);}
            res.json(result);
        });
    }else{
        res.json({error:true});
    }
});


module.exports = router;