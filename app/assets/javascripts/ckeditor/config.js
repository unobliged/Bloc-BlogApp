CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'MyToolbar';
  //config.filebrowserBrowseUrl = '/ckeditor/pictures';
  config.filebrowserUploadUrl = '/ckeditor/pictures';
  config.filebrowserImageBrowseUrl = '/ckeditor/pictures';

  config.toolbar_MyToolbar =
      [
        ['Bold', 'Italic','Underline','Strike','Subscript','Superscript'],
        ['Format','Font','FontSize'],
        ['NumberedList','BulletedList'],
        ['Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl'],
        ['UIColor','TextColor','BGColor'],
        ['Link', 'Unlink','Anchor'],
        ['Image','HorizontalRule','SpecialChar'],
        ['SpellChecker','Scayt']
      ];

  // Rails CSRF token
  config.filebrowserParams = function(){
    var csrf_token = jQuery('meta[name=csrf-token]').attr('content'),
        csrf_param = jQuery('meta[name=csrf-param]').attr('content'),
        params = new Object();
    
    if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
    }
    
    return params;
  };
  
  config.addQueryString = function( url, params ){
    var queryString = [];

    if ( !params )
      return url;
    else
    {
      for ( var i in params )
        queryString.push( i + "=" + encodeURIComponent( params[ i ] ) );
    }

    return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" );
  };
  
  // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
  CKEDITOR.on( 'dialogDefinition', function( ev ){
    // Take the dialog name and its definition from the event data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    var content, upload;
    
    if ( ['link', 'image', 'attachment', 'flash'].indexOf(dialogName) > -1 ) {
      content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
      upload = (content == null ? null : content.get('upload'));
      
      if (upload && upload.filebrowser['params'] == null) {
        upload.filebrowser['params'] = config.filebrowserParams();
        upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
      }
    }
  });

};
