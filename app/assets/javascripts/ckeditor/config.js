CKEDITOR.editorConfig = function (config) {
  const ckeditorConfig = config;

  ckeditorConfig.width = '100%';
  ckeditorConfig.height = '500';
  ckeditorConfig.filebrowserFlashBrowseUrl = '/ckeditor/attachment_files';
  ckeditorConfig.filebrowserFlashUploadUrl = '/ckeditor/attachment_files';
  ckeditorConfig.filebrodialogDefinitionwserImageBrowseLinkUrl = '/ckeditor/pictures';
  ckeditorConfig.filebrowserImageBrowseUrl = '/ckeditor/pictures';

  // Add ? to url because of a bug from ckeditor when upload via attaching images in CKEditor via drag and drop
  // https://github.com/galetahub/ckeditor/issues/836
  // https://github.com/consul/consul/pull/3977
  ckeditorConfig.filebrowserImageUploadUrl = '/ckeditor/pictures?';
  ckeditorConfig.filebrowserUploadUrl = '/ckeditor/attachment_files';
  ckeditorConfig.filebrowserUploadMethod = 'form';
  ckeditorConfig.image_previewText = ' ';

  ckeditorConfig.toolbar_MyToolbar = [
    {
      name: 'document',
      groups: ['mode', 'document', 'doctools'],
      items: ['Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates']
    },
    {
      name: 'clipboard',
      groups: ['clipboard', 'undo'],
      items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
    },
    {
      name: 'editing',
      groups: ['find', 'selection', 'spellchecker'],
      items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt']
    },
    {
      name: 'forms',
      items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField']
    },
    '/',
    {
      name: 'basicstyles',
      groups: ['basicstyles', 'cleanup'],
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    },
    {
      name: 'paragraph',
      groups: ['list', 'indent', 'blocks', 'align', 'bidi'],
      items: [
        'NumberedList',
        'BulletedList',
        '-',
        'Outdent',
        'Indent',
        '-',
        'Blockquote',
        'CreateDiv',
        '-',
        'JustifyLeft',
        'JustifyCenter',
        'JustifyRight',
        'JustifyBlock',
        '-',
        'BidiLtr',
        'BidiRtl',
        'Language'
      ]
    },
    { name: 'links', items: ['Link', 'Unlink'] },
    { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'SpecialChar'] },
    '/',
    { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
    { name: 'tools', items: ['Maximize'] }
  ];

  ckeditorConfig.toolbar_MiniToolbar = [];
};

CKEDITOR.on('dialogDefinition', function (e) {
  dialogName = e.data.name;
  dialogDefinition = e.data.definition;
  if (dialogName === 'link') {
    dialogDefinition.removeContents('upload');
    infoTab = dialogDefinition.getContents('info');
    infoTab.remove('protocol');
    infoTab.remove('txtURL');
    advancedTab = dialogDefinition.getContents('advanced');
    advancedTab.remove('advLangDir');
    advancedTab.remove('advAccessKey');
    advancedTab.remove('advName');
    advancedTab.remove('advLangCode');
    advancedTab.remove('advTabIndex');
    advancedTab.remove('advTitle');
    advancedTab.remove('advContentType');
    advancedTab.remove('advCSSClasses');
    advancedTab.remove('advCharset');
    advancedTab.remove('advRel');
  }

  if (dialogName === 'image') {
    dialogDefinition.width = '1000';

    dialogDefinition.removeContents('Link');
    advancedTab = dialogDefinition.getContents('advanced');
    advancedTab.remove('cmbLangDir');
    advancedTab.remove('txtLangCode');
    advancedTab.remove('txtGenTitle');
    advancedTab.remove('txtGenLongDescr');
    advancedTab.remove('txtGenClass');
  }
});
