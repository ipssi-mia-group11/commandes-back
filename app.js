const express = require('express');
const mysql = require('mysql2');
const app = express();

// Configuration de la connexion à la base de données MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'datacommande',
});

// Connexion à la base de données MySQL
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connecté à la base de données MySQL');
});

// Route pour récupérer des données depuis la base de données
app.get('/api/data', (req, res) => {
    const sql = 'SELECT * FROM utilisateurs';
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.json(result);
    });
});


// Port sur lequel l'API écoute
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`Serveur démarré sur le port ${port}`);
});