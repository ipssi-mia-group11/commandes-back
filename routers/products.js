const { Router, } = require('express');
const db = require('../db');

const router = Router();

const formatProduct = (product) => ({
    ...product,
    Prix: parseFloat(product.Prix),
});

router.get('', (_, res) => {
    const sql = 'SELECT * FROM `produits`';
    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500);
        }
        res.json({
            items: result.map(formatProduct),
        });
    });
});

router.get('/:id', (req, res) => {
    const sql = 'SELECT * FROM `produits` WHERE `id` = ?';
    db.query(sql, [req.params.id,], (err, result) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500);
        }
        res.json({
            item: formatProduct(result[0]),
        });
    });
});

router.post('', (req, res) => {
    const sql = 'INSERT INTO `produits` (`NomProduit`, `Prix`, `Stock`) VALUES (?, ?, ?)';
    db.query(sql, [req.body.NomProduit, req.body.Prix, req.body.Stock], (err, result) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500);
        }
        res.json({
            item: {
                ID: result.insertId,
                ...req.body,
            },
        });
    });
});

router.patch('/:id', (req, res) => {
    const sql = 'UPDATE `produits` SET `NomProduit` = ?, `Prix` = ?, `Stock` = ? WHERE `id` = ?';
    db.query(sql, [req.body.NomProduit, req.body.Prix, req.body.Stock, req.params.id,], (err) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500);
        }
        res.json({
            item: {
                ...req.body,
                ID: req.params.id,
            },
        });
    });
});

router.delete('/:id', (req, res) => {
    const sql = 'DELETE FROM `produits` WHERE `id` = ?';
    db.query(sql, [req.params.id,], (err) => {
        if (err) {
            console.error(err);
            return res.sendStatus(500);
        }
        res.json({
            item: {
                ID: req.params.id,
            },
        });
    });
});

module.exports = router;