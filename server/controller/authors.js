const pool = require('../config/index')

getAuthors=(request,response)=> {
   
    pool.query('SELECT * FROM authors', function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    });
}

getAuthor = (request,response)=> {
    console.log(request.query.id)
    pool.query(`SELECT * FROM authors WHERE author_id = ${request.query.author_id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}

getAuthorsFromCategories = (request,response)=> {
    console.log(request.query.category_id)
    pool.query(`SELECT * FROM authors WHERE category_id = ${request.query.category_id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}



module.exports = {
    getAuthors,
    getAuthor,
    getAuthorsFromCategories
   
}