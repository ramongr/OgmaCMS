# Handles click events, search and insertion of emojis on CKEditor
# Used in Admin::Posts#new/edit, Admin::Pages#new/edit, Admin::Newsletters#new/edit, Comments#new/edit
$('#search-panel').hide()
# model type
model = $('*[data-model]').attr('data-model')
# Multilanguage form lang tab
lang = $('li#lang-tab').filter('.active').attr('data-lang') || $('#' + model + '-container').attr('data-lang')

# Handle lang tab changes
$('li#lang-tab').on 'click', ->
  lang = $('li#lang-tab').filter('.active').attr('data-lang')
  return

# Dynamically add images
$('a#emoji').on 'click', ->  
  emoji = $(this).html()
  switch model
    when 'post' then CKEDITOR.instances['post_content_'+lang].insertHtml(emoji)
    when 'page' then CKEDITOR.instances['page_body_'+lang].insertHtml(emoji)
    when 'comment' then CKEDITOR.instances['comment_content'].insertHtml(emoji)
    when 'newsletter' then CKEDITOR.instances['newsletter_body_'+lang].insertHtml(emoji)
  return

$('#search-field').on 'keyup, keydown', ->
  str = $(this).val()
  if str.length > 0
    $('#emoji-panel').removeClass('active')
    $('#emojiPanel1').removeClass('active')
    $('[id=emoji-panel]').hide(250)
    $('#search-panel').show(250).addClass('active')
    $('#emojiPanel6').addClass('active')
    arr = []
    regexp = new RegExp(str.substring(1, str.length),'gi')
    $.each $('#emojiPanel6 > a'), (i, v) ->
      (if regexp.test($(this).attr('title')) then $(this).show() else $(this).hide())
      return
  
  if str.length == 0
    $('#search-panel').removeClass('active')
    $('#emojiPanel6').removeClass('active')
    $('[id=emoji-panel]').show(250)
    $('#emoji-panel').addClass('active')
    $('#emojiPanel1').addClass('active')
    arr = []
  return