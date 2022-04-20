# LogoSGTFinallyProject
- Tek sayfadan oluşacak bir e-ticaret sitesi

## Proje Detayları:

- Vue.js ile tek sayfadan oluşan bir e-ticaret sistemi tasarlayacağız.
- 10 adet kategori olacak.
- Tüm backend işlemleri Node.js ile yapılacak.
- Arayüz Vue.js ile yapılacak.
- Ürünler API’den çekilecek. İstenilen API kullanılabilir. API’yi kendiniz tasarlayabilirsiniz.
- ElasticSearch ile ana sayfada arama alanı yapılacak.
- Winston kullanılacak.
- Ürüne tıkladığımız zaman bir kutusu ekrana gelecek ve ürünün bilgileri yer alacak.
- Relational veritabanı için PostgreSQL kullanılacak.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Proje Açıklaması:
- Bu proje kitap e-ticaret sitesi  olarak tasarlanmıştır.
- Bu projede öncelikle veritabanında books, categories ve authors tablolarını oluşturdum. Burada PostgreSQL veritabanını kullandım.

![pg](https://user-images.githubusercontent.com/86554799/163433089-97e415b6-2555-43ac-bdad-b1adb08da714.jpg)

**books tablosu**

![books](https://user-images.githubusercontent.com/86554799/160821056-6b9429a4-caaf-4201-8102-0f95f4d9964a.jpg)
![bookstable2](https://user-images.githubusercontent.com/86554799/163435034-d9bb64a7-38a9-419c-aa39-cb1aa6f64147.jpg)

**categories tablosu**

![categories](https://user-images.githubusercontent.com/86554799/160821179-b1892d80-25e4-42a9-8c08-b49134d10cbf.jpg)

**authors tablosu **

![authors](https://user-images.githubusercontent.com/86554799/160821450-d33bc6ca-e481-4dda-8d84-88973c820ffa.jpg)

**Not: Burada books tablosunda bulunan category_id categories tablosuyla, author_id authors tablosuyla ilişkilendirilmiştir.**

```
create table books(
	id serial primary key,
	name varchar(255) not null,
	price integer not null,
	category_id integer references categories(category_id),
  author_id integer references authors(author_id),
  publisher varchar(255) not null,
  imageurl varchar(2048) not null,
  description text
	)
```
**server klasörü**
- Pprojede arka planda yapılan server işlemleri yani veritabanına bağlanma ve verileri çekebilen api yapılarının olduğu server klasörü oluşturdum ve içerisine veritabanını bağlamak için config klasörü, daha sonradan kitapları listelemek gibi işlemlerin yapıldığı fonksiyonların yazıldığı controller klasörü, yönlendirme işlemleri için router klasörü ve elastic search klasörü oluşturuldu.

![serverklasör](https://user-images.githubusercontent.com/86554799/163449688-a9e18d35-4ca1-443d-80a9-26e1eac3f188.jpg)

Ben burada yazdığım bazı kodları paylaştım. Geriye kalan kısımları *server* klasörü içerisinde geekli kodları inceleyebilirsiniz

**app.js**

```
const express = require('express');  // express modülünü gösterme
const BookRouter = require('./router/Router.js')  //Router kısmını tanımlama
const app = express()  //express modülünü app değişkenine tanımlama
const winston = require('winston');  //loglama işlemleri için winston mmodülünü çağırma
const elasticClient = require('./elasticsearch/elasticClient');  //elasticsearchı tanmlama
const cors = require('cors');  //cors modülünü tanımlama


//middlewares
app.use(cors());
app.use(express.json())

//loglama işlemleri burada yapılır
const logger = winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    defaultMeta: { service: 'user-service' },
    transports: [
      //
      // - Write all logs with importance level of `error` or less to `error.log`
      // - Write all logs with importance level of `info` or less to `combined.log`
      //
      new winston.transports.File({ filename: 'error.log', level: 'error' }),
      new winston.transports.File({ filename: 'combined.log' }),
    ],
  });

  //
// If we're not in production then log to the `console` with the format:
// `${info.level}: ${info.message} JSON.stringify({ ...rest }) `
//
logger.error("Hata Yakaladım")

elasticClient.ping({    
    requestTimeout: 1000
}, function (error) {
    if (error) {
        console.trace('Elasticsearch\'e erişilmiyor!');
    } else {
        console.log('Elasticsearch ayakta :)');
    }
});



app.get('/', (req, res) => {
    res.send("Hello World")
})

const port = 5000
app.listen(port, () => {
    console.log(`Server is running on ${port} port`)
})

app.use('/api',BookRouter)

```
**client klasörü**
- E-ticaret sitesindeki arayüz kısmını yani kitapların, kategori isimlerinin görüntüleneceği alanlar için client klasörünü oluşturdum. Burada javascriptin vue.js frameworkünden yararlandım.

`npm install -g @vue/cli`
`vue create ecommrece`

- Sonrasında index.html,css dosyaları ve resimlerin bulunduğu public klasörünü, componentler, main.js gibi dosyaların bulundupu src kalsörünü oluşturdum.

![client1](https://user-images.githubusercontent.com/86554799/163577837-87b288be-bfcc-4a7e-95b3-b9933c2b5867.jpg)
![client2](https://user-images.githubusercontent.com/86554799/163577910-3f280199-b1ca-4fe2-ba20-632089a148d7.jpg)
![clientcomponents](https://user-images.githubusercontent.com/86554799/163577926-5ddc96ea-7395-46b3-81f5-3ba1005bd090.jpg)

- Ben burada **CardBooks.vue** ve **App.vue** componentlerinin kodlarını paylaşıyorum. Diğer componentlerin ve de servislerin daha fazla detaylı kodlarına *client/ecommerce/src* kısmından inceleyebilirsiniz. 

**client/ecommerce/src/components/CardBooks.vue

```
<template>
<!-- html kısımları burada yazılır -->
  <div>
    <div class="container">
      <div class="row">
        <!-- kitapları card şeklinde listelenir -->
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

<CardModal2 :parentmessage="book"/>
      </div>
  
    </div>
    
  </div>
</template>

<script>
//componentler ve servisler burada tanımlanır
import CardModal2 from "./CardModal2.vue"
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
CardModal2
  },
  created() {

    this.getBooks();
   
  },
//gerekli metodlar burada yazılır.
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
//stil özellikleri burada verilir.
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
``` 
**App.vue**

```
<template>
   <!-- Topbar Start -->
   <TopbarHolder />
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <NavBarVue />
    <!-- Navbar End -->

       <!-- Products Start -->

  <NewBooks />

    <!-- Products End -->
<!-- AllBools -->
    <CardBooks />
    <!--  -->

    <!-- Categories Start -->
    <PopularBooks />
    <!-- Categories End -->

    <!-- Products Start -->
    <YeniCikanlar />
    <!-- Products End -->

    <!-- Footer Start -->
    <FooterVue />
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
FROM B: {{store.count}}
</template>

<script>
import {store} from "./components/store"
import TopbarHolder from "./components/TopBar/TopbarHolder.vue"
import NavBarVue from "./components/Navbar/NavBarVue.vue"
import FooterVue from "./components/Footer/FooterVue.vue"
import PopularBooks from "./components/PageContent/PopularBooks.vue"
import NewBooks from "./components/PageContent/Cards/NewBooks.vue"
import YeniCikanlar from "./components/PageContent/YeniCikanlar.vue"
import CardBooks from "./components/PageContent/Cards/CardBooks.vue"



export default {
  name: 'App',
  data() {
    return {store}
  },
  components: {
    TopbarHolder,
    NavBarVue,
    FooterVue,
    PopularBooks,
    NewBooks,
    YeniCikanlar,
    CardBooks

  }

  
}
</script>

<style>


</style>

```
**Sonuç**

![kitapdunyası](https://user-images.githubusercontent.com/86554799/163995074-86c45fb8-5860-4dc1-800d-b0f6acd27190.gif)

- Projede geliştirilmeler devam etmekte olup burada güncellemesini yapmış olacağım
