const mysql = require('mysql')
db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'acamara'
});
db.connect(function(err) {
    if (err) throw err;
    console.log("Company connected!");
});
 
module.exports = db