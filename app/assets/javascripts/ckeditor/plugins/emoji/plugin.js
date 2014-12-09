$(document).foundation();
CKEDITOR.plugins.add('emoji',{
  icons: 'emoji',
  init: function(editor){
    editor.ui.addButton('Emoji', {
      label: 'Emoji',
      command: 'emoji',
      click: function(){
        $('#emoji-modal').foundation('reveal', 'open')
      }
    });
  }
})