const mysql = require('mysql')
db = mysql.createConnection({
  host: 'rds.cags0yrmviiu.us-east-2.rds.amazonaws.com',
  user: 'root',
  password: 'somepassword',
  database: 'rds'
});
db.connect(function(err) {
    if (err) throw err;
    console.log("acamara Dalhousie DB!");
});
 
module.exports = db