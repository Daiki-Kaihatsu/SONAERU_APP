// 画像のプレビュー
$('#cover-image').click(function() {
  $('#board_image').click();
  return false;
});
$('#board_image').on('change', function(e) {
  var $preview, file, reader, t;
  console.log(e);
  file = e.target.files[0];
  reader = new FileReader;
  $preview = $('.board-image');
  t = this;
  if (file.type.indexOf('image') < 0) {
    return false;
  }
  reader.onload = (function(file) {
    return function(e) {
      $preview.empty();
      $preview.attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});