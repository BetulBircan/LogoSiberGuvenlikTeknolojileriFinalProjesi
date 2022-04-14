const pool = require('../config/index')

//Bütün kitapları getirme
getBooks=(request,response)=> {
   
    pool.query('SELECT * FROM books', function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    });
}

//Kitapın id sine göre getirme
getBook = (request,response)=> {
    console.log(request.query.id)
    pool.query(`SELECT * FROM books WHERE id = ${request.query.id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}

//Kitabın kategorilerine göre kitapları getirme
getBooksFromCategories = (request,response)=> {
    console.log(request.query.category_id)
    pool.query(`SELECT * FROM books WHERE category_id = ${request.query.category_id}`, function(err, res) {
        if(err) {
            return console.error('error running query', err);
        }
        return response.status(200).json(res.rows)
    })
}

//getElastic
getBookElastic=(req, res) => {
 
    elasticClient.search({
      index:"dbbooks",
      body:{query: {
        match_phrase_prefix: {
            "title":   req.query.query
        }
    } }
    },(err,rest)=>{
      if (err) {
        console.log(err);
      }
      else{
        return    res.status(200).json(rest.hits);
      }
    })
  
    
  }

  //PostElastic
  postBookElastic=(req, res) => {
    elasticClient.index({
      index:"dbbooks",
      type:  'books',
      body:req.body
    },(err)=>{
      if (err) {
        console.log(err);
      }
      else{
        return    res.status(201).json(req.body);
      }
    })
  }

module.exports = {
    getBooks,
    getBook,
    getBooksFromCategories,
    postBookElastic,
    getBookElastic
   
}