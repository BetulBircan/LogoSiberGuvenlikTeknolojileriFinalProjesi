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

<!-- Products Start -->
    <YeniCikanlar />
    <!-- Products End -->


<!-- AllBools -->
    <CardBooks />
    <!--  -->


 
    


    <!-- Categories Start -->
    <PopularBooks />
    <!-- Categories End -->

    


  



    
  

    


    



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
