const cors = require('cors');
const express = require('express');
const env = require('./env');
const productsRouter = require('./routers/products');
const ordersRouter = require('./routers/commandes');
const { formatProduct } = require('./utils');

const app = express();

app.use(cors({
    origin: env.CLIENT_URL,
    optionsSuccessStatus: 200,
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true, }));

app.use('/api/products', productsRouter);
app.use('/api/orders', ordersRouter);


// Port sur lequel l'API écoute
const port = env.PORT || 3000;

app.listen(port, () => {
    console.log(`Serveur démarré sur le port ${port}`);
});