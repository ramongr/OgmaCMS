CKEDITOR.plugins.add('mediabutton', {
  icons: 'mediabutton',
  init: function( editor ){
    editor.ui.addButton( 'Mediabutton',{
      label: 'Insert Media',
      command: 'mediabutton',
      toolbar: 'insert'
    });

    $('#insert-attachment').click()
  }
})