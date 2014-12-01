# This file handles the click methods behind the emojis in the foundation modal
# Used in Admin::Posts#new, Admin::Pages#new

# Check if modal is in pages or posts
instance = $('*[data-model]').attr('data-model')

# Check if modal is in multilanguage form
lang = $('#attachment-modal').attr('data-lang')

# Dynamically add images
$('a#emoji').on 'click', ->
  emoji = $(this).html()
  switch instance
    when 'post' then CKEDITOR.instances['post_content_'+lang].insertHtml(emoji)
    when 'page' then CKEDITOR.instances['page_body_'+lang].insertHtml(emoji)
    when 'comment' then CKEDITOR.instances['comment_content'].insertHtml(emoji)
    when 'newsletter' then CKEDITOR.instances['newsletter_body'].insertHtml(emoji)
  return
