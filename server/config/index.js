const { Pool } = require('pg');
var config = {
    user: 'jzxoqykg', 
    database: 'jzxoqykg', 
    password: 'POTJjuYo9dW4P20lMGDjOYUOr8pauoV3', 
    host: 'kesavan.db.elephantsql.com', 
    port: 5432, 
    max: 10, // max number of clients in the pool
    idleTimeoutMillis: 30000
};
const pool = new Pool(config);


module.exports = pool;