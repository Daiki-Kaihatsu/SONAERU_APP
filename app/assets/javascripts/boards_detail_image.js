
var counter = 0;

// IDを連番で付与
$(document).ready(function () {
  $('.formImage') //
    .on('cocoon:after-insert', function (e, insertedItem) {
      $(insertedItem).find('.imageFile').attr('id', 'imageFile_' + ++counter);
      $(insertedItem).find('.image-add').attr('id', 'add-image_' + counter);
    })
})

// 画像のプレビュー機能
$(function () {
  function imgView(n) {
  
    $('#add-image_'  + n).click(function() {
      $('#imageFile_' + n).click();
      return false;
    });

    console.log(n)
    var reader = new FileReader();
    document.getElementById('imageFile_' + n).onchange = function (e) {
      reader.addEventListener('load', function (e) {
        $('#add-image_' + n).html('<img src="' + e.target.result + '" />');
        
      });
      reader.readAsDataURL(this.files[0]);
    }
    
  }
  imgView(counter);
});