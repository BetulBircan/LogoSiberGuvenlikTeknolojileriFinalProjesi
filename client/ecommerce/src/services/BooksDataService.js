import http from "../http-common";
class BookDataService {
  //Bütün Kitapları getirme
  getAllBooks() {
    return http.get("/books");
  }

  getBookDetail(c_id) { 
    return http.get("/books/"+c_id); 
  } 

  //Kategorilerine göre getirme
  getBookFromCategories(c_id) {
    return http.get("/bookscategory?category_id="+c_id)
  }

  //Bütün Kategorileri getirme
  getAllCategories() {
    return http.get("/categories");
  }

  //Yeni Ürünler
  getNewBooks() {
    return http.get("/newbooks")
  }

  //Tüm Yazarlar
  getAllAuthors() {
    return http.get("/authors");
  }

 
  create(data) {
    return http.post("/tutorials", data);
  }
}
export default new BookDataService();
