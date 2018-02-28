# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.login.mini.modal').modal('attach events', '.login.button', 'show')

$ ->
  $('.signup.modal').modal('attach events', '.signup.link', 'show')
