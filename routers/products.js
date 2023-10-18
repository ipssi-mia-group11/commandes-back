const { Router, } = require('express');
const db = require('../db');

const router = Router();

// router.get
// router.post
// ...

router.get('', (req, res) => {
    const sql = 'SELECT * FROM `produits`';
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            products: result,
        });
    });
});

module.exports = router;