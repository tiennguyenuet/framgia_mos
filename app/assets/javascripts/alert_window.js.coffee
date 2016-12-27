$(document).on 'ready page:load', ->
  $('.alert').delay(3000).fadeOut()
  cancel_function = ->
    window.history.back()
