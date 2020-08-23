// 画像のプレビュー
$('#cover-profile-image').click(function() {
  $('#user_profile_image').click();
  return false;
  console.log(e);
});
$('#user_profile_image').on('change', function(e) {
  var $preview, file, reader, t;
  file = e.target.files[0];
  reader = new FileReader;
  $preview = $('.profile-image');
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