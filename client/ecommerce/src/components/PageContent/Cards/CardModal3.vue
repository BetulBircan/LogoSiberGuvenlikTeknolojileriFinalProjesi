<template>
<!-- Modal -->
<div class="modal" id="newModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">{{parentmessage.name}}</h5>
        <button type="button" class="close" data-dismiss="modal" >
          &times;
        </button>
      </div>
      <div class="modal-body">
         <div class="modal-body" >
                    
                    <img v-bind:src="parentmessage.imageurl">
                    <br>
                    <br>
                    <b style="color: #351842">Açıklaması</b>
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
      </div>
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
</template>

<script>
export default {
name:"CardModal3",
 props: ['parentmessage'],
}
</script>

<style lang="scss" scoped>
img { 
  width:208px; 
  height:307px;
}
</style>


