const dotenv = require('dotenv');

dotenv.config({
    path: './.env.local',
});

module.exports = process.env;