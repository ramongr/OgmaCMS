# This file handles the click methods behind the emojis in the ckeditor modal
# Used in Admin::Posts#new/edit, Admin::Pages#new/edit, Admin::Newsletters#new/edit, Comments#new/edit

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