// // 画像のプレビュー
// $('#review-image').click(function() {
//   $('#review_review_image').click();
//   return false;
// });
// $('#review_review_image').on('change', function (e) {
//   console.log(e)
//   var $preview, file, reader, t;
//   file = e.target.files[0];
//   reader = new FileReader;
//   $preview = $('.review-add-image');
//   t = this;
//   if (file.type.indexOf('image') < 0) {
//     return false;
//   }
//   reader.onload = (function(file) {
//     return function(e) {
//       $preview.empty();
//       $preview.attr("src", e.target.result);
//       console.log(e)
//     };
//   })(file);
//   reader.readAsDataURL(file);
// });


// 画像のプレビュー機能
$(function () {
  
    $('#review-image').click(function() {
      $('#preview').click();
      return false;
    });

    var reader = new FileReader();
    document.getElementById('preview').onchange = function (e) {
      reader.addEventListener('load', function (e) {
        $('#review-image').html('<img src="' + e.target.result + '" />');
        
      });
      reader.readAsDataURL(this.files[0]);
    }
    
  });