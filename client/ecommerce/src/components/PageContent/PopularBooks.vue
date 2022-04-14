<template>
  <div class="container-fluid pt-5">
    <div class="text-center mb-4">
      <h2 class="section-title px-5">
        <span class="px-2">Popüler Kitaplar</span>
      </h2>
    </div>
    <div class="row px-xl-5 pb-3">
      <div class=" col-md-3 ">
        <div
        
          class="cat-item d-flex flex-column border mb-4"
          style="padding: 30px"
        >


         <div class="card" style="width: 250px">
            <img 
              class="card-img-top"
              v-bind:src="item.imageurl"
              alt="Card image"
            />
            <div class="card-body">
              <h4 class="card-title">{{ item.name }}</h4>
              <p class="card-text">{{ item.price }}</p>
              <a
                type="button"
                class="btn btn-success"
                data-toggle="modal"
                data-target="#myModal"
                >See Profile</a
              >
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BookDataService from "../../services/BooksDataService";

export default {
  name: "PopularBooks",
  data() {
    return {
      books: [],
    };
  },

  created () {
      this.getBooks();
  },

  methods: {
      getBooks() {
          BookDataService.getAllBooks()
          .then((response) => {
              this.books = response.data;

              console.log(response)
              return JSON.parse(JSON.stringfy(this.books));
          })
          .catch((e) => {
              console.log(e);
          })
      },
    // getBook(c_id) {
    //   BookDataService.getBookFromCategories(c_id)
    //     .then((response) => {
    //       this.books = response.data;

    //       console.log(response);
    //       return JSON.parse(JSON.stringfy(this.books));
    //     })
    //     .catch((e) => {
    //       console.log(e);
    //     });
    // },
  },
};
</script>

<style></style>
