<template>
<div class="center"><h2 class="text-center">Yeni Çıkanlar</h2></div>
  <Carousel :settings="settings" :breakpoints="breakpoints">
    <Slide v-for="slide in newBook" :key="slide.book_id">
      <div class="carousel__item">
          <div class="card-img">
          <img v-bind:src="slide.imageurl" class="card-img">
        </div>

        <div class=" card-title">
           {{slide.name}}
        </div>

              <div class="card-s card-price">
           {{slide.price}}.00 TL
        </div>
<!-- 
                      <div class="card-s card-article">
           {{slide.author_id.name}}
        </div> -->

        <div class="card-s card-publisher">
            {{slide.publisher}}
        </div>


        <a 
        type="button"
        class=" card-button"
        @click="getid(slide)"
        data-toggle="modal"
        data-target="#newModal"
        >
         Göster
        </a>

        <br>

      </div>


    </Slide>
    


    <template #addons>
      <Navigation />
      <CardModal3 :parentmessage="book"/>
    </template>
  </Carousel>
</template>

<script>
import 'vue3-carousel/dist/carousel.css';
import { Carousel, Slide, Navigation } from 'vue3-carousel';
import CardModal3 from "./Cards/CardModal3.vue"
import BookDataService from "../../services/BooksDataService";
export default {
    name:"YeniCikanlar",

  components: {
    Carousel,
    Slide,
    Navigation,
    CardModal3,
  },
  data: () => ({

      newBook:[],// donen degerı methods bunun ıcıne kaydet
      book: [],
    // carousel settings
    settings: {
      itemsToShow: 1,
      snapAlign: 'center',
    },
    // breakpoints are mobile first
    // any settings not specified will fallback to the carousel settings
    breakpoints: {
      // 700px and up
      700: {
        itemsToShow: 3.5,
        snapAlign: 'center',
      },
      // 1024 and up
      1024: {
        itemsToShow: 5,
        snapAlign: 'start',
      },
    },
  }),
  

created(){
    // this ile methodsy cagır 
    this.getAllNewBooks()
},
methods:{
  getid(param)
    {return this.book=param},
    //service baglan datayı cek   5 10 slice legth 
    getAllNewBooks(){
       BookDataService.getNewBooks()
        .then((response) => {
          this.newBook = response.data;

          console.log(response);
          return JSON.parse(JSON.stringfy(this.newBook));
        })
        .catch((e) => {
          console.log(e);
        });
    }
}

}



</script>

<style lang="scss">


.carousel__item {
  height: 422px;
  min-width:250px;
  background-color: white;
  color:  var(--vc-clr-white);

  border-radius: 8px;

  &:hover{
  
       box-shadow: 0 0 5px 1px rgb(158, 157, 157);
.card-img{
    box-shadow: 0 0 0 0 ;
}

.card-button{
    display:block;
    
 

}
  }
 
  
}

.carousel__slide {
  padding: 3px;

}

.carousel__prev,
.carousel__next {
  box-sizing: content-box;
  border: 5px solid white;
}
.cs-img{
 

    margin-top: 20px;
   width:90%;
     object-fit: cover;
}
.card-img{
    margin-right: auto;
      margin-left: auto;
    box-shadow: 0 0 1px 1px rgb(158, 157, 157);
  width:205px;
    height: 205px;

    
}

div{
         color: black;
}

.card-title{
   font-weight:500;
   font-size:18px;
  
}

.card-price{
  
   font-size:20px;
}

.card-article{
  
   font-size:13px;
}


.card-publisher{
     
   font-size:13px;
}

.card-s{
  display: flex;
    justify-content: start;
    margin-left: 30px;
    margin-top: 20px;
}


.card-button{
    margin-left: auto;
       margin-right: auto;
       margin-top:12px;
       border-radius: 5px;
       color: white;
    width:85%;
    background-color:rgb(230, 91, 102);
    padding:3px;
    display: none;
    cursor:pointer;
    &:active {
      background-color: #c98282;
    }
    &:hover {
      text-decoration: none
    }

    .center { 
  align-items: center;
  justify-content: center;
}
}





</style>