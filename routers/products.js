const express = require('express');
const router = express.Router();

// router.get
// router.post
// ...

router.get('', (req, res) => {
    res.send('GET /api/products');
});

module.exports = router;