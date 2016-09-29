$(document).on 'ready page:load', ->
  $('div.alert-danger').delay(3000).fadeOut()
  $('div.alert-success').delay(3000).fadeOut()
  cancel_function = ->
    window.history.back()
