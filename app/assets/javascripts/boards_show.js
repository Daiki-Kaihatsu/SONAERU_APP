$(function() {
  $('button#add').click(function(){
  var tr_form = '' +
  '<tr>' +
    '<td><%= f.text_field:body,class:body,name:"text_1[]",rows:5,cols:1,:placeholder => "説明文を入力"  %></td>' +
    '<td><input type="text" name="text_2[]"></td>' +
  '</tr>';
    $(tr_form).appendTo($('table > tbody'));
  });
});