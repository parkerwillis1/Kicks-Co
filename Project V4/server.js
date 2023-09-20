const express = require('express');
const mysql = require('mysql');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static('public'));
app.use(express.json());


const dbConfig = {
    user: 'root',
    password: 'utsapassword',
    host: '34.174.247.100',
    database: 'shoeshopping',
    port: 3306
};

const connection = mysql.createConnection(dbConfig);

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/index.html'));
});

app.get('/dashboard', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/dash.html'));
});

app.get('/api/shoesInStock', function (req, res) {
    connection.query('SELECT SUM(Quantity) as total FROM inventory', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    });
});

app.get('/inventory', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/inventory.html')); 
});

app.get('/create', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/create.html'));
});


app.get('/view', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/view.html'));
});

app.get('/modify', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/modify.html'));
});

app.get('/api/inventory', function (req, res) { 
    connection.query('SELECT * FROM inventory', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results);
    });
});

app.get('/orders', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/orders.html'));
});

app.get('/api/orders', (req, res) => {
    const query = 'SELECT * FROM orders';
    connection.query(query, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});
