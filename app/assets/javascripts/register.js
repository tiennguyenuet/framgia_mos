$(document).on('submit', '#form-register', function(e){
  e.preventDefault();
  var url = $(this).attr('action');
  var method = $(this).attr('method');
  var data = $(this).serializeArray();
  $('#register-errors').html('');
  $('.loading').html('<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>');
  setTimeout(function(){
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function(data){
        var message = '<i class="fa fa-check-circle-o"></i> Sign up success, Redirecting...'
        $('.loading').html('');
        $('#register-success').html(message);
        location.reload();
      },
      error: function(data){
        var errors = data.responseJSON.errors;
        $('.loading').html('');
        $.each(errors, function(key, value){
          $('#register-errors').append('<p>'+
            '<i class="fa fa-exclamation-circle"></i> '+ value +'</p>');
        });
        $('#register-button').removeAttr("disabled");
      }
    });
  }, 500);
})
