const dotenv = require('dotenv');
const express = require('express');
const mysql = require('mysql2');
const app = express();

dotenv.config({
    path: './.env.local',
});

// Configuration de la connexion à la base de données MySQL
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
});

// Connexion à la base de données MySQL
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connecté à la base de données MySQL');
});

app.use(express.json());

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