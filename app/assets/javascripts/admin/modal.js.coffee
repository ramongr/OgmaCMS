# This file handles the click methods behind the foundation modal
# Used in Admin::Posts#new, 

# Check if modal is in multilanguage form

# Dynamically add images
$('a#att-images').on 'click', ->
  img = '<img alt=default src='+$(this ).children('img').attr('data-addr')+'>'
  CKEDITOR.instances['post_content_'+lang].insertHtml(img)
  return

$('li#linkable-att').on 'click', ->
  link = '<a data-tooltip aria-haspopup=true title='+$(this).children('a').attr('data-desc')+' class=has-tip href='+$(this).children('a').attr('data-addr')+'>'+$(this).children('a').text()+'</a>';
  CKEDITOR.instances['post_content_'+lang].insertHtml(link)
  return