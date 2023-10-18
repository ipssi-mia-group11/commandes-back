const express = require('express');
const app = express();
const port = 3000;

// Route GET pour obtenir un message
app.get('/', (req, res) => {
    res.json({ message: 'Bienvenue sur mon API !' });
});

// Démarrer le serveur
app.listen(port, () => {
  console.log(`Serveur écoutant sur le port ${port}`);
});