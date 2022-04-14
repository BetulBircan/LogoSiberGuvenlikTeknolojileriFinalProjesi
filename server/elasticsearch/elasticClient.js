const es = require('elasticsearch')

const op = {
    host: 'localhost:9200',
    log: 'trace'
}

const esClient = new es.Client(op);
 
module.exports = esClient;