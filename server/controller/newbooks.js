const pool = require('../config/index')

getNewBooks=(request,response)=> {
   
    pool.query('SELECT * FROM yenicikanlar', function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    });
}

getNewBook = (request,response)=> {
    console.log(request.query.id)
    pool.query(`SELECT * FROM yenicikanlar WHERE book_id = ${request.query.book_id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}

module.exports = {
    getNewBooks,
    getNewBook
    
   
}