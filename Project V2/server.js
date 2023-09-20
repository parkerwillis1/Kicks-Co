const express = require('express');
const sql = require('mssql');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static('public'));

const dbConfig = {
    user: 'root',
    password: 'Collegeismything123',
    server: '34.174.247.100',
    database: 'shoeshopping'
};

sql.connect(dbConfig, function (err) {
    if (err) console.log(err);
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/index.html')); // login page
});

app.get('/dashboard', (req, res) => {
    // we need to add authentication middleware here to protect this route
    res.sendFile(path.join(__dirname, '/public/html/dash.html'));
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

app.get('/inventory', function (req, res) {
    let request = new sql.Request();
    let sqlQuery = 'SELECT * FROM inventory';
    
    request.query(sqlQuery, function (err, data) {
        if (err) console.log(err);
        res.send(data.recordset);
    });
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});
