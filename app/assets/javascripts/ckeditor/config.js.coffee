CKEDITOR.editorConfig = (config) ->
  config.removePlugins = 'liststyle,tabletools,scayt,contextmenu'
  config.defaultLanguage = 'pt'
  config.skin = 'office2013'
  config.disableNativeSpellChecker = false
  config.allowedContent = true
  config.extraPlugins = 'mediabutton,emoji'
  
  config.toolbar_Editor = [
    { name: 'document', items: [ 'Source', '-', 'Preview', 'Print','-','Templates' ]},
    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors', items : [ 'TextColor','BGColor' ] },
    { name: 'tools', items : [ 'Maximize', 'ShowBlocks' ] },
    '/',
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing', items : [ 'Find','Replace','-','SelectAll' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
    '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
    { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
    '/',
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Table','HorizontalRule','Emoji','SpecialChar','PageBreak'] },
    { name: 'custom', items: ['Mediabutton']}
  ]

  config.toolbar_Post = [
    { name: 'document', items: [ 'Source', '-', 'Preview', 'Print','-','Templates' ]},
    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors', items : [ 'TextColor','BGColor' ] },
    { name: 'tools', items : [ 'Maximize', 'ShowBlocks' ] },
    '/',
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing', items : [ 'Find','Replace','-','SelectAll' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
    '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
    { name: 'links', items : [ 'Image','Link','Unlink','Anchor' ] },
    '/',
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Table','HorizontalRule','Emoji','SpecialChar','PageBreak'] },
    { name: 'custom', items: ['Mediabutton']}
  ]

  config.toolbar_Comments = [
    { name: 'custom', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript', 'RemoveFormat', '-', 'Image', 'Link', 'Unlink', '-', 'Emoji' ] }
  ]

  config.toolbar = 'Editor'

  true