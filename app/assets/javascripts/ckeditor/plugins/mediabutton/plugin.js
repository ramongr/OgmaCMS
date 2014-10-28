CKEDITOR.plugins.add('mediabutton',{
  icons: 'mediabutton',
  init: function(editor){
    editor.ui.addButton('Mediabutton', {
      label: 'Insert Media',
      command: 'mediabutton',
      click: function(){
        $('#attachment-modal').foundation('reveal', 'open')
      }
    });
  }
})