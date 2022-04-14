<template>
  <div>
    <div class="container">
      <div class="row">
        <div  class="col-md-3"  v-for="item in books.filter(
            (el) =>{
              if(store.categoryId==0){
                 return el;
              }
        return el.category_id==store.categoryId;
}
           )" :key="item.id"  >
           
          <div>
          <div  class="card" >
            <img
              class="card-img-top"
              v-bind:src="item.imageurl"
              alt="Card image"
              
            />
            <div class="card-body">
              <h4 class="card-title">{{ item.name }}</h4>
              
            </div>
           
            <div class="card-footer">
              {{ item.price }}.00 TL
           
            </div>
                <a
                type="button"
                class="btn btn-success"
                @click="getid(item)"
                data-toggle="modal"
                data-target="#myModal"
                
                >Göster</a
              >
          </div>
      
          <br>
          <!-- The Modal -->
      
        </div>
     
          </div>

<CardModal :parentmessage="book"/>
      </div>
  
    </div>
    
  </div>
</template>

<script>
import CardModal from "./CardModal.vue"
import BookDataService from "../../../services/BooksDataService"
import { store } from '../../store'
export default {
  name: "CardBooks",
  data() {
    return {
      store,
      books: [],
      book: [],
    };
  },
  components:{
CardModal
  },
  created() {

    this.getBooks();
   
  },

  methods: {

    getid(param)
    {return this.book=param},
    
    getBooks() {
      BookDataService.getAllBooks()
        .then((response) => {
          console.log(store.categoryId);
          console.log(response.data);
          if(store.categoryId==0){
           
     return this.books = response.data;
          }
          else{
            console.log("bring it");
           this.books= this.books.filter(
            (el) =>{
              
        return el.category_id==store.categoryId;
}
           );
          }
          console.log(response);
          return JSON.parse(JSON.stringfy(this.books));
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.card-img-top {
margin-right: auto;
      margin-left: auto;
    
  width:208px;
    height: 307px;
}
.card-title{
  width: 168px;
  height: 64.8px;
}
</style>