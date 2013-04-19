CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'MyToolbar';

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
};
