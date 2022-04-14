const express = require('express')
const Books =require('../controller/books')    //Kitaplar
const Categories = require('../controller/categories') //Kategoriler
const Authors = require('../controller/authors')
const NewBooks = require('../controller/newbooks')
const router = express.Router()

//Books
router.get('/books', Books.getBooks)
router.get('/book', Books.getBook)
router.get('/bookscategory', Books.getBooksFromCategories)
router.post('/elastic', Books.postBookElastic)
router.get('/getelastic', Books.getBookElastic)

//Categories
router.get('/categories', Categories.getCategories)
router.get('/category', Categories.getCategory)

router.get('/authors', Authors.getAuthors)
router.get('/author', Authors.getAuthor)
router.get('/authorscategory', Authors.getAuthorsFromCategories)

router.get('/newbooks', NewBooks.getNewBooks)
router.get('/newbook', NewBooks.getNewBook)


module.exports =router