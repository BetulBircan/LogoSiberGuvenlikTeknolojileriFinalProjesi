<template>
     <div class="container-fluid m-0" >
      
        <div class="row align-items-center py-3 px-xl-5">
            <TopBarLogo />
            <TopBarSearch />
            <TopBarDetail />
        </div>
    </div>
</template>

<script>

import TopBarLogo from "./TopBarLogo"
import TopBarSearch from "./TopBarSearch.vue"
import TopBarDetail from "./TopBarDetail.vue"

export default {
    name: 'TopbarHolder',
    components: {
    TopBarLogo,
    TopBarSearch,
    TopBarDetail
  }
}
</script>

<style>

</style>