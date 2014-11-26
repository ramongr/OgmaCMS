# This file handles the click methods behind the emojis in the foundation modal
# Used in Admin::Posts#new, Admin::Pages#new

# Check if modal is in pages or posts
instance = $('form').attr('data-model')

# Check if modal is in multilanguage form
lang = $('#attachment-modal').attr('data-lang')

# Dynamically add images
$('a#emoji').on 'click', ->
  emoji = $(this).html()
  if instance == 'post'
    CKEDITOR.instances['post_content_'+lang].insertHtml(emoji)
  else
    CKEDITOR.instances['page_body_'+lang].insertHtml(emoji)
  return
