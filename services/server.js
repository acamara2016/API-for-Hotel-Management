// Set up express
const express = require('express')
const app = express()
const db = require('./api/db/connection')

// Body parser
const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// Use .env files in local setup
!process.env.NODE_ENV ? require('dotenv').config() : console.log('DEV:PROD')

//Add Headers
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*')

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST')

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type')

    // Pass to next layer of middleware
    next();
});
 
var customer = require('./api/routes/customer.routes');
var reservation = require('./api/routes/reservation.routes');
var check = require('./api/routes/check.routes');
var room_check = require('./api/routes/room_check.routes.js');
var room = require('./api/routes/room.routes');
var invoice = require('./api/routes/invoice.routes.js');
var payment = require('./api/routes/payment.routes');
var bill = require('./api/routes/bill.routes');
var hotel = require('./api/routes/hotel.routes');
var price = require('./api/routes/pricing.routes');

app.use('/customer', customer);
app.use('/reservation', reservation);
app.use('/check', check);
app.use('/room_check', room_check);
app.use('/room', room);
app.use('/invoice', invoice);
app.use('/payment', payment);
app.use('/bill', bill);
app.use('/hotel', hotel);
app.use('/pricing', price)
// Listen for the server at a port.
app.listen(process.env.PORT || 8000, (err) => {
    console.log('Server running on ' + 8000)
})
