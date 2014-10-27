CKEDITOR.plugins.add('mediabutton', {
  icons: 'mediabutton',
  init: function( editor ){
    
    editor.addCommand('mediabutton',{
      exec: document.getElementById('insert-attachment').click()
    })

    editor.ui.addButton( 'Mediabutton',{
      label: 'Insert Media',
      command: 'mediabutton',
      toolbar: 'insert'
    });
  }
})