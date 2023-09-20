const express = require('express');
const { connect } = require('http2');
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

app.get('/api/unitsold', function (req, res) {
    connection.query('SELECT SUM(Units) as total FROM orders', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    });
});

app.get('/api/totalRevenue', function (req, res) {
    connection.query('SELECT SUM(TotalAmount) as total FROM orders', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    })
});

app.get('/api/shoesInStock', function (req, res) {
    connection.query('SELECT SUM(Quantity) as total FROM inventory', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    });
});

app.get('/api/recentOrder', function (req, res) {
    connection.query('SELECT * FROM orders ORDER BY order_ID DESC LIMIT 1', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    })
});

app.get('/api/promoDisplay', async function (req, res) {
    connection.query('SELECT * FROM discounts ORDER BY discounts_ID DESC LIMIT 1', function (error, results, fields) {
        if (error) console.log(error);
        res.json(results[0]);
    });
});

app.get('/api/ao_Table', function (req, res) {
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

app.get('/inventory', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/inventory.html')); 
});

app.get('/create', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/create.html'));
});

app.post('/create', (req, res) => {
    const { inv_ID, SaleStatus, Quantity, Shoes_shoes_ID } = req.body;
    const queryStr = 'INSERT INTO inventory (inv_ID, SaleStatus, Quantity, Shoes_shoes_ID) VALUES (?, ?, ?, ?)';

    connection.query(queryStr, [inv_ID, SaleStatus, Quantity, Shoes_shoes_ID], (error, results) => {
        if (error) {
            console.error("Error inserting into inventory: ", error);
            res.status(500).json({ error: "Error inserting into inventory" });
        } else {
            res.json({ success: true, message: "Item created successfully" });
        }
    });
});

app.get('/view', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/view.html'));
});

app.get('/modify', (req, res) => {
    res.sendFile(path.join(__dirname, '/public/html/modify.html'));
});

app.post('/modify/:id', (req, res) => {
    const itemId = req.params.id;
    const { SaleStatus, Quantity, Shoes_shoes_ID } = req.body;
    
    const queryStr = 'UPDATE inventory SET SaleStatus = ?, Quantity = ?, Shoes_shoes_ID = ? WHERE inv_ID = ?';

    connection.query(queryStr, [SaleStatus, Quantity, Shoes_shoes_ID, itemId], (error, results) => {
        if (error) {
            console.error("Error updating inventory item: ", error);
            res.status(500).json({ error: "Error updating inventory item" });
        } else {
            res.json({ success: true, message: "Item updated successfully" });
        }
    });
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

// LOG IN
app.get('/logdat', (req, res) => {
    
    const query = 'SELECT * FROM staff';
    connection.query(query, (error, results) => {
        if (error) {
            console.error("Error fetching staff: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

// POST DISCOUNT
app.post('/api/add_Discount', (req, res) => {
    const { Name, Percentage } = req.body;
    const queryStr = 'CALL create_discount(?, ?)';

    connection.query(queryStr, [Name, Percentage], (error, results) => {
        if (error) {
            console.error("Error executing create_discount(): ", error);
            res.status(500).json({ error: "Error executing create_discount()" });
        } else {
            res.json({ success: true, message: "Discount created successfully" });
        }
    });
});

// SORTING DATE
app.get('/api/date-desc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY OrderDate DESC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

app.get('/api/date-asc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY OrderDate ASC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

// SORTING CUSTOMER
app.get('/api/cust-desc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY customers_cust_ID DESC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

app.get('/api/cust-asc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY customers_cust_ID ASC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

// SORTING DOLLAR
app.get('/api/dollar-desc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY TotalAmount DESC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
});

app.get('/api/dollar-asc', (req, res) => {
    const queryStr = 'SELECT * FROM orders ORDER BY TotalAmount ASC';

    connection.query(queryStr, (error, results) => {
        if (error) {
            console.error("Error fetching orders: ", error);
            res.status(500).json({ message: "Internal Server Error" });
            return;
        }
        res.json(results);
    });
})

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});