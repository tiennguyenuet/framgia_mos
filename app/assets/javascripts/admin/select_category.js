$(document).on('turbolinks:load', function() {
  $('#selectAll').click(function() {
    if (this.checked) {
      $(':checkbox').each(function() {
        this.checked = true;
      });
    }else{
      $(':checkbox').each(function() {
        this.checked = false;
      });
    }
  });

  $('.category_ids_').on('change', function(){
    var i = true;
    $('.category_ids_').each(function(){
      if ($(this).prop('checked') == false) {
        i = false;
      }
    });
    $('#selectAll').prop('checked', i);
  });

  $('.btn-delete-categories').click(function(e) {
    check_delete = false;
    $(':checkbox').each(function(){
      if (this.checked == true){
        check_delete = true;
        return;
      }
    });
    if (check_delete == false){
      alert('Please choose categories to delete!');
      e.preventDefault();
    }
  });
});
