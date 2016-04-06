# This file handles the click methods behind the foundation modal
# Used in Admin::Posts#new/edit, Admin::Pages#new/edit, Admin::Newsletters#new/edit

# Check if modal model
model = $('*[data-model]').attr('data-model')

# Check if modal is in multilanguage form
lang = $('li#lang-tab').filter('.active').attr('data-lang') || $('#' + model + '-container').attr('data-lang')

# Handle lang tab changes
$('li#lang-tab').on 'click', ->
  lang = $('li#lang-tab').filter('.active').attr('data-lang')
  return

# Dynamically add images
$('a#att-images').on 'click', ->
  img = '<img alt=default src='+$(this ).children('img').attr('data-addr')+'>'
  switch model
    when 'post' then CKEDITOR.instances['post_content_'+lang].insertHtml(img)
    when 'page' then CKEDITOR.instances['page_body_'+lang].insertHtml(img)
    when 'newsletter' then CKEDITOR.instances['newsletter_body_'+lang].insertHtml(img)
  return

$('li#linkable-att').on 'click', ->
  link = '<a data-tooltip aria-haspopup=true class=has-tip title='+$(this).children('a').attr('data-desc')+' href='+$(this).children('a').attr('data-addr')+'>'+$(this).children('a').text()+'</a>';
  switch model
    when 'post' then CKEDITOR.instances['post_content_'+lang].insertHtml(link)
    when 'page' then CKEDITOR.instances['page_body_'+lang].insertHtml(link)
    when 'newsletter' then CKEDITOR.instances['newsletter_body_'+lang].insertHtml(link)
  return

$('a#ins-images').on 'click', ->
  request = $.post 'add_photo',
    attachment_id: $(this).children('img').attr('data-id')
  return