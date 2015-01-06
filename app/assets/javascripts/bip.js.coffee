bip = ->
  if $('#best-in-place-container').length > 0
    $(".best_in_place").best_in_place()
    $('span[data-bip-attribute]').each ->
      $(this).attr('title', $(this).attr('data-title'))
      return
# TO DO : Support multilanguage
    CKEDITOR.disableAutoInline = true
    CKEDITOR.inline "editable",
      on:
        blur: (event) ->
          text = event.editor.getData()

          id = $('#editable').attr('data-id')
          lang = $('#editable').attr('data-lang')

          if $('#editable').attr('data-model') == 'posts'
            $.ajax
              url: "/admin/posts/" + id
              type: "PUT"
              data:
                ajax: true
                post:
                  id: id
                  lang: lang
                  content: text
            return
          else
            $.ajax
              url: "/admin/pages/" + id
              type: "PUT"
              data:
                ajax: true
                post:
                  id: id
                  lang: lang
                  body: text
            return
  return

$(document).ready(bip)
$(document).on('page:load', bip)