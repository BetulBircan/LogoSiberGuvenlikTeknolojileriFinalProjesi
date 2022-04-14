const pool = require('../config/index')

//All Ctegories
getCategories=(request,response)=> {
   
    pool.query('SELECT * FROM categories', function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    });
}

//From by id
getCategory = (request,response)=> {
    console.log(request.query.category_id)
    pool.query(`SELECT * FROM categories WHERE category_id = ${request.query.category_id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}
module.exports = {
    getCategories,
    getCategory
}