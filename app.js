const cors = require('cors');
const express = require('express');
const env = require('./env');
const db = require('./db');
const productsRouter = require('./routers/products');

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true, }));

app.use((_, res, next) => {
    res.header('Access-Control-Allow-Origin', env.CLIENT_URL);
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

app.use('/api/products', productsRouter);

// Route pour récupérer des données depuis la base de données
app.get('/api/data', (req, res) => {
    const sql = 'SELECT * FROM utilisateurs';
    db.query(sql, (err, result) => {
        if (err) {
            return res.sendStatus(500);
        }
        res.json(result);
    });
});

// Port sur lequel l'API écoute
const port = env.PORT || 3000;

app.listen(port, () => {
    console.log(`Serveur démarré sur le port ${port}`);
});