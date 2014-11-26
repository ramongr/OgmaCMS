# This file handles the click methods behind the foundation modal
# Used in Admin::Posts#new, Admin::Pages#new

# Check if modal is in pages or posts
instance = $('form').attr('data-model')

# Check if modal is in multilanguage form
lang = $('#attachment-modal').attr('data-lang')
# Dynamically add images
$('a#att-images').on 'click', ->
  img = '<img alt=default src='+$(this ).children('img').attr('data-addr')+'>'
  if instance == 'post'
    CKEDITOR.instances['post_content_'+lang].insertHtml(img)
  else
    CKEDITOR.instances['page_body_'+lang].insertHtml(img)
  return

$('li#linkable-att').on 'click', ->
  link = '<a data-tooltip aria-haspopup=true class=has-tip title='+$(this).children('a').attr('data-desc')+' href='+$(this).children('a').attr('data-addr')+'>'+$(this).children('a').text()+'</a>';
  CKEDITOR.instances['post_content_'+lang].insertHtml(link)
  return

$('a#ins-images').on 'click', ->
  request = $.post 'add_photo',
    attachment_id: $(this).children('img').attr('data-id')
  return