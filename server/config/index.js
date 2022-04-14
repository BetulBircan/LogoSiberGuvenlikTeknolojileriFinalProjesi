const { Pool } = require('pg');
var config = {
    user: 'postgres', 
    database: 'dbbooks', 
    password: '171518', 
    host: 'localhost', 
    port: 5432, 
    max: 10, // max number of clients in the pool
    idleTimeoutMillis: 30000
};
const pool = new Pool(config);


module.exports = pool;