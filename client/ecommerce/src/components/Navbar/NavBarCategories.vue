<template>
  <div class="col-lg-3 d-none d-lg-block">
    <a
      class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white "
      data-toggle="collapse"
      href="#navbar-vertical"
      style="height: 65px; margin-top: -1px; padding: 0 30px"
    >
      <h6 class="m-0">Categories</h6>
      <i class="fa fa-angle-down text-dark"></i>
    </a>
    <nav
      class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0"
      id="navbar-vertical"
    >
      <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
        <ul style="list-style-type: none">
          <li id="list"
            v-for="item in categories"
            :key="item.category_id"
            @click="category(item.category_id)"
          >
            {{ item.name }} 
            <br>
           
          </li>
          
        </ul>
        
      </div>
    </nav>
  </div>
</template>

<script>
import { store } from '../store'
import BookDataService from "../../services/BooksDataService"

export default {
  name: "NavBarCategories",
  data() {
    return {
       store,
     
      categories: [],
    };
  },
  created(){
 this.getCategories();
    },
  methods: {
    getCategories() {
      BookDataService.getAllCategories()
        .then((response) => {
          this.categories = response.data;
          console.log(response.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
    category(param){
      store.added(param);
    },
    
  },
};
</script>

<style lang="scss" scoped>
li{
  cursor: pointer;
}
li:hover {
font-size: 15px;
text-decoration: underline;
text-decoration-color: indianred;
}
li:active {
  text-decoration: underline;
  color:blue;
}

</style>
