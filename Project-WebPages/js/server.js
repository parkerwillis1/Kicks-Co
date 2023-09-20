const express = require('express');
const sql = require('mssql');
const app = express();
const port = 3000;

app.use(express.static('public'));

const dbConfig = {
    user: 'username',
    password: 'password',
    server: 'localhost',
    database: 'DatabaseName'
};

sql.connect(dbConfig, function (err) {
    if (err) console.log(err);
});

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html');
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