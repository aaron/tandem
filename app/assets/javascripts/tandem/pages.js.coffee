# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

$(document).ready ->
  $('.page_link').colorbox
    onCleanup: ->
      location.reload()

  if $('#tandem_page_links').length > 0
    $('body').addClass('tandem-admin-bar')

  $('div.tandem_content').on 
    'mouseenter': ->
      $('div.tandem_toolbar', $(this)).fadeIn('slow')
  
    'mouseleave': ->
      $('div.tandem_toolbar', $(this)).fadeOut('slow')

    'click': ->
      $.fn.colorbox
        href: $('a.tandem_edit_link', $(this)).attr('href')
        iframe: true
        width: '80%'
        height: '80%'
        open: true
      return false

reload_tandem_content = (resource_id,resource_url) ->
  $.fn.colorbox.close()
  resource_id = '#'+resource_id
  $(resource_id).load resource_url+' '+resource_id, ->
    bind_tandem_events($(resource_id))