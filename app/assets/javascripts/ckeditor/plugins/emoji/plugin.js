CKEDITOR.plugins.add('emoji',{
  icons: 'emoji',
  init: function(editor){
    editor.ui.addButton('Emoji', {
      label: 'Insert Media',
      command: 'emoji',
      click: function(){
        $('#emoji-modal').foundation('reveal', 'open')
      }
    });
  }
})