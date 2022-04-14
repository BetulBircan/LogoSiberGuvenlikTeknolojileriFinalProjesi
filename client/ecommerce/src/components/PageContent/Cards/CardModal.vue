<template>
<div>
      <div class="modal" id="myModal" >
            <div class="modal-dialog">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">{{ parentmessage.name}}</h4>
                  <button type="button" class="close" data-dismiss="modal">
                    &times;
                  </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" >
                    
                    <img v-bind:src="parentmessage.imageurl">
                    <br>
                    <br>
                    {{parentmessage.description}}
                    <br>
                    <br>
                    Sayfa Sayısı: {{ parentmessage.pagecount}}
                    <br>
                    <br>
                    Fiyat: {{ parentmessage.price}}.00 TL

                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-danger"
                    data-dismiss="modal"
                  >
                   Kapat
                  </button>
                </div>
              </div>
            </div>
          </div>
               </div>
</template>

<script>
export default {
name:"CardModal",
 props: ['parentmessage'],
}
</script>

<style lang="scss" scoped>
img { 
  width:208px; 
  height:307px;
}
</style>


