/* Format les prix en décimal */
const formatProduct = (product) => ({
    ...product,
    Prix: parseFloat(product.Prix),
});

module.exports = { formatProduct };