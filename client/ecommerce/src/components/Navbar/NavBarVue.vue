<template>
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
          <NavBarCategories />
           <NavBarSlider />
        </div>
    </div>
</template>

<script>
import NavBarCategories from "./NavBarCategories.vue"
import NavBarSlider from "./NavBarSlider.vue"

export default {
    name: "NavBarVue",
    components: {
        NavBarCategories,
        NavBarSlider
    }
}
</script>

<style>

</style>