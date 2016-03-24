/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		'/',
		'/',
		'/',
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'blocks', 'align', 'indent', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Source,NewPage,Preview,Print,Templates,Cut,Copy,Redo,Paste,PasteFromWord,PasteText,Replace,Undo,SelectAll,Find,Scayt,Form,Checkbox,Radio,TextField,Textarea,Button,Select,ImageButton,HiddenField,Bold,RemoveFormat,NumberedList,Outdent,Blockquote,JustifyLeft,BidiLtr,Link,Image,Flash,Unlink,BidiRtl,CreateDiv,Indent,BulletedList,JustifyCenter,JustifyRight,Language,Anchor,Table,JustifyBlock,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,FontSize,Font,Format,Styles,TextColor,BGColor,ShowBlocks,Maximize,About,Italic,Underline,Strike,Subscript,Superscript';
};