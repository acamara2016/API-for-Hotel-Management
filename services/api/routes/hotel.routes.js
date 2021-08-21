var db = require('../db/connection');
var express = require('express');
var router = express.Router();
var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');


router.get('/', function (req, res){
    var sql = "SELECT * FROM `Hotel`";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:id', function (req, res){
    var {id} = req.params;
    var sql = "SELECT * FROM `Hotel` where idHotel = '"+id+"'";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
router.get('/:id', function (req, res){
    var idHotel = req.params.id;
    var sql = "UPDATE `hotel` SET `admin` = '"+admin+"', `password` = '"+password+"' WHERE `hotel`.`idHotel` = '"+idHotel+"'";
    db.query(sql, function (err,result){
        res.json(result);
    });
});
//UPDATE `hotel` SET `admin` = 'ADMINGG', `password` = 'passwordGG' WHERE `hotel`.`idHotel` = 'Azalai-username'


router.post('/signin', function(req, res, next) {
    const {username} = req.body;
    const sql = "Select * from `Hotel` where admin= '"+username+"'";
    db.query(sql, function(err, result){
        if (err) throw err;
        var string=JSON.stringify(result);
        var json =  JSON.parse(string);
        if(json[0] && req.body.password == json[0].password){
            var token = jwt.sign({ id: json[0].idHotel }, "company-secret", {
                expiresIn: 3600 // 24 hours
            });
            res.status(200).send({
                id: json[0].idHotel,
                username: json[0].admin,
                accessToken: token
            });
            
        }else{
            if (err) throw err;
            res.send(null)
        }
    });
});



module.exports = router;