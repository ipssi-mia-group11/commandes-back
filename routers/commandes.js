const { Router, } = require('express');
const db = require('../db');
const { formatProduct } = require('../utils');

const router = Router();

/* Get les commandes des utilisateurs */
router.get('', (req, res) => {
    const sql = `
        SELECT u.ID as UtilisateurID, c.ID as CommandeID, u.Nom, u.Prenom, p.NomProduit, (dc.Quantite * p.Prix) as Prix
        FROM utilisateurs u
        JOIN commandes c ON u.ID = c.UtilisateurID
        JOIN detailscommande dc ON c.ID = dc.CommandeID
        JOIN produits p ON dc.ProduitID = p.ID;`;
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        return res.json({
            items: result.map(formatProduct)
        });
    });
});

module.exports = router;