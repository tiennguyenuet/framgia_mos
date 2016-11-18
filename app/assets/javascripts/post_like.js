$(document).on('click', '.btn-like', function(e){
  e.preventDefault();
  host = location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: '')
  $.ajax({
    method: "POST",
    url: host + '/likes',
    data: {id: $('.show-post').data('post'), commit: 'post'},
    dataType: 'json',
    success: function(data){
      if(data.type == "like")
        $('#post_likes').html('Liked ('+ data.size + ')');
      else
        $('#post_likes').html('Like ('+ data.size + ')');
      $('.btn-like').toggleClass('liked');
    }
  });
});
