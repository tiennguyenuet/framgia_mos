$(document).on('submit', '#form-login', function(e){
  e.preventDefault();
  var url = $(this).attr('action');
  var method = $(this).attr('method');
  var data = $(this).serializeArray();
  $('#error-login').html('');
  $('#loading').html('<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>');
  setTimeout(function(){
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(data){
        var message = '<i class="fa fa-check-circle-o"></i> Login success, Redirecting...'
        $('#loading').html('');
        $('#login-success').html(message);
        location.reload();
      },
      error: function(data){
        console.log(data);
        $('#loading').html('');
        $('#error-login').html(data.responseJSON.message);
        $('#login-button').removeAttr("disabled");
      }
    });
  }, 100);
})
