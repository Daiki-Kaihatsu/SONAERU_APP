
var counter = 0;

// IDを連番で付与
$(document).ready(function () {
  $('.formImage') //
    .on('cocoon:after-insert', function (e, insertedItem) {
      $(insertedItem).find('.imageFile').attr('id', 'imageFile_' + ++counter);
      $(insertedItem).find('.image-add').attr('id', 'add-image_' + counter);
    })
})

$(function () {
  function imgView(n) {
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
// $(function () {
//   var reader = new FileReader();
//   document.getElementById('imageFile_' + counter).onchange = function (e) {
//     reader.addEventListener('load', function (e) {
//       $('#add-image' + n).html('<img src="' + e.target.result + '" />');
//     });
//     reader.readAsDataURL(this.files[0]);
//     console.log(n)
//   }
// })

//   $('#add-image').click(function () {
//     $('#imageFile_' + counter).click();
//     imgView(counter);

//   });

// function imgView(counter) {
//   $('#imageFile_' + counter).on('change', function (e) {
//     var $preview, file, reader, t;
//     file = e.target.files[0];
//     reader = new FileReader;
//     $preview = $('.add-image');
//     t = this;
//     if (file.type.indexOf('image') < 0) {
//       return false;
//     }
//     reader.onload = (function (file) {
//       return function (e) {
//         $preview.empty();
//         $preview.attr("src", e.target.result);
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// }