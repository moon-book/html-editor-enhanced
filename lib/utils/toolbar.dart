import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html_editor_enhanced/src/widgets/toolbars/toolbar_button.dart';

import 'hotfix_font_awesome_icons.dart';

/// Abstract class that all the toolbar classes extend
abstract class Toolbar {
  const Toolbar();
}

/// Style group
class StyleButtons extends Toolbar {
  final bool style;

  const StyleButtons({
    this.style = true,
  });
}

/// Font setting group
class FontSettingButtons extends Toolbar {
  final bool fontName;
  final bool fontSize;
  final bool fontSizeUnit;

  const FontSettingButtons({
    this.fontName = true,
    this.fontSize = true,
    this.fontSizeUnit = true,
  });
}

/// Font group
class FontButtons extends Toolbar {
  final bool bold;
  final bool italic;
  final bool underline;
  final bool clearAll;
  final bool strikethrough;
  final bool superscript;
  final bool subscript;

  const FontButtons({
    this.bold = true,
    this.italic = true,
    this.underline = true,
    this.clearAll = true,
    this.strikethrough = true,
    this.superscript = true,
    this.subscript = true,
  });

  List<ToolbarButton> getIcons1() {
    final icons = <ToolbarButton>[
      if (bold)
        ToolbarButton(
          type: ButtonType.bold,
          child: Icon(
            HotFixFontAwesomeIcons.bold.iconData,
            size: 14,
          ),
          tooltip: 'In Đậm',
        ),
      if (italic)
        ToolbarButton(
          type: ButtonType.italic,
          child: Icon(
            HotFixFontAwesomeIcons.italic.iconData,
            size: 14,
          ),
          tooltip: 'In Nghiêng',
        ),
      if (underline)
        ToolbarButton(
          type: ButtonType.underline,
          child: Icon(
            HotFixFontAwesomeIcons.underline.iconData,
            size: 14,
          ),
          tooltip: 'Gạch dưới',
        ),
      if (clearAll)
        ToolbarButton(
          type: ButtonType.clearFormatting,
          child: Icon(
            HotFixFontAwesomeIcons.eraser.iconData,
            size: 14,
          ),
          tooltip: 'Bỏ định dạng',
        ),
    ];

    return icons;
  }

  List<ToolbarButton> getIcons2() {
    var icons = <ToolbarButton>[
      if (strikethrough)
        ToolbarButton(
          child: Icon(
            HotFixFontAwesomeIcons.strikethrough.iconData,
            size: 14,
          ),
          type: ButtonType.strikethrough,
          tooltip: 'Gạch ngang',
        ),
      if (superscript)
        ToolbarButton(
          child: Icon(
            HotFixFontAwesomeIcons.superscript.iconData,
            size: 14,
          ),
          type: ButtonType.superscript,
          tooltip: 'Superscript',
        ),
      if (subscript)
        ToolbarButton(
          child: Icon(
            HotFixFontAwesomeIcons.subscript.iconData,
            size: 14,
          ),
          type: ButtonType.subscript,
          tooltip: 'Subscript',
        ),
    ];

    return icons;
  }

  static Map<ButtonType, String> commands() {
    return <ButtonType, String>{
      ButtonType.bold: 'bold',
      ButtonType.italic: 'italic',
      ButtonType.underline: 'underline',
      ButtonType.clearFormatting: 'removeFormat',
      ButtonType.strikethrough: 'strikeThrough',
      ButtonType.superscript: 'superscript',
      ButtonType.subscript: 'subscript',
    };
  }
}

/// Color bar group
class ColorButtons extends Toolbar {
  final bool foregroundColor;
  final bool highlightColor;

  const ColorButtons({
    this.foregroundColor = true,
    this.highlightColor = true,
  });

  List<ToolbarButton> getIcons() {
    var icons = <ToolbarButton>[];

    if (foregroundColor)
      icons.add(
        ToolbarButton(
          type: ButtonType.foregroundColor,
          child: Container(
            color: Colors.yellow,
            child: Icon(
              HotFixFontAwesomeIcons.font.iconData,
              size: 14,
            ),
          ),
          tooltip: 'Màu chữ',
        ),
      );
    if (highlightColor)
      icons.add(
        ToolbarButton(
          type: ButtonType.highlightColor,
          child: Icon(
            HotFixFontAwesomeIcons.brush.iconData,
            size: 14,
          ),
          tooltip: 'Màu nền',
        ),
      );
    return icons;
  }
}

/// List group
class ListButtons extends Toolbar {
  final bool ul;
  final bool ol;
  final bool listStyles;

  const ListButtons({
    this.ul = true,
    this.ol = true,
    this.listStyles = true,
  });

  List<ToolbarButton> getIcons() {
    var icons = <ToolbarButton>[];
    if (ul)
      icons.add(
        ToolbarButton(
          type: ButtonType.ul,
          child: Icon(
            HotFixFontAwesomeIcons.listUl.iconData,
            size: 14,
          ),
          tooltip: 'Liệt kê danh sách',
        ),
      );
    if (ol)
      icons.add(
        ToolbarButton(
          type: ButtonType.ol,
          child: Icon(
            HotFixFontAwesomeIcons.listOl.iconData,
            size: 14,
          ),
          tooltip: 'Liệt kê theo thứ tự',
        ),
      );
    return icons;
  }
}

/// Paragraph group
class ParagraphButtons extends Toolbar {
  final bool alignLeft;
  final bool alignCenter;
  final bool alignRight;
  final bool alignJustify;
  final bool increaseIndent;
  final bool decreaseIndent;
  final bool textDirection;
  final bool lineHeight;
  final bool caseConverter;

  const ParagraphButtons({
    this.alignLeft = true,
    this.alignCenter = true,
    this.alignRight = true,
    this.alignJustify = true,
    this.increaseIndent = true,
    this.decreaseIndent = true,
    this.textDirection = true,
    this.lineHeight = true,
    this.caseConverter = true,
  });

  List<ToolbarButton> getIcons1() {
    var icons = <ToolbarButton>[];
    if (alignLeft)
      icons.add(
        ToolbarButton(
          type: ButtonType.alignLeft,
          child: Icon(
            HotFixFontAwesomeIcons.alignLeft.iconData,
            size: 14,
          ),
          tooltip: 'Căn trái',
        ),
      );
    if (alignCenter)
      icons.add(
        ToolbarButton(
          type: ButtonType.alignCenter,
          child: Icon(
            HotFixFontAwesomeIcons.alignCenter.iconData,
            size: 14,
          ),
          tooltip: 'Căn giữa',
        ),
      );
    if (alignRight)
      icons.add(
        ToolbarButton(
          type: ButtonType.alignRight,
          child: Icon(
            HotFixFontAwesomeIcons.alignRight.iconData,
            size: 14,
          ),
          tooltip: 'Căn phải',
        ),
      );
    if (alignJustify)
      icons.add(
        ToolbarButton(
          type: ButtonType.alignJustify,
          child: Icon(
            HotFixFontAwesomeIcons.alignJustify.iconData,
            size: 14,
          ),
          tooltip: 'Căn đều',
        ),
      );
    return icons;
  }

  List<ToolbarButton> getIcons2() {
    var icons = <ToolbarButton>[];
    if (increaseIndent)
      icons.add(
        ToolbarButton(
          type: ButtonType.increaseIndent,
          child: Icon(
            HotFixFontAwesomeIcons.indent.iconData,
            size: 14,
          ),
          tooltip: 'Dịch sang phải',
        ),
      );
    if (decreaseIndent)
      icons.add(
        ToolbarButton(
          type: ButtonType.decreaseIndent,
          child: Icon(
            HotFixFontAwesomeIcons.outdent.iconData,
            size: 14,
          ),
          tooltip: 'Dịch sang trái',
        ),
      );
    return icons;
  }

  List<ToolbarButton> getIcons3() {
    return <ToolbarButton>[
      ToolbarButton(
        type: ButtonType.ltr,
        child: Icon(
          Icons.format_textdirection_l_to_r,
          size: 17,
        ),
        tooltip: 'Left to right',
      ),
      ToolbarButton(
        type: ButtonType.ltr,
        child: Icon(
          Icons.format_textdirection_r_to_l,
          size: 17,
        ),
        tooltip: 'Right to left',
      ),
    ];
  }
}

/// Insert group
class InsertButtons extends Toolbar {
  final bool link;
  final bool picture;
  final bool audio;
  final bool video;
  final bool otherFile;
  final bool table;
  final bool hr;

  const InsertButtons({
    this.link = true,
    this.picture = true,
    this.audio = true,
    this.video = true,
    this.otherFile = false,
    this.table = true,
    this.hr = true,
  });

  List<ToolbarButton> getIcons() {
    var icons = <ToolbarButton>[];
    if (link)
      icons.add(
        ToolbarButton(
          type: ButtonType.link,
          child: Icon(
            HotFixFontAwesomeIcons.link.iconData,
            size: 14,
          ),
          tooltip: 'Link',
        ),
      );

    if (picture)
      icons.add(
        ToolbarButton(
          type: ButtonType.picture,
          child: Icon(
            HotFixFontAwesomeIcons.image.iconData,
            size: 14,
          ),
          tooltip: 'Hình ảnh',
        ),
      );

    if (audio)
      icons.add(
        ToolbarButton(
          type: ButtonType.audio,
          child: Icon(
            HotFixFontAwesomeIcons.fileAudio.iconData,
            size: 14,
          ),
          tooltip: 'Audio',
        ),
      );
    if (video)
      icons.add(
        ToolbarButton(
          type: ButtonType.video,
          child: Icon(
            HotFixFontAwesomeIcons.video.iconData,
            size: 14,
          ),
          tooltip: 'Video',
        ),
      );
    if (otherFile)
      icons.add(
        ToolbarButton(
          type: ButtonType.otherFile,
          child: Icon(
            HotFixFontAwesomeIcons.file.iconData,
            size: 14,
          ),
          tooltip: 'File',
        ),
      );
    if (table)
      icons.add(
        ToolbarButton(
          type: ButtonType.table,
          child: Icon(
            HotFixFontAwesomeIcons.table.iconData,
            size: 14,
          ),
          tooltip: 'Table',
        ),
      );
    if (hr)
      icons.add(
        ToolbarButton(
          type: ButtonType.hr,
          child: Icon(
            Icons.horizontal_rule,
            size: 14,
          ),
          tooltip: '<hr>',
        ),
      );
    return icons;
  }
}

/// Miscellaneous group
class OtherButtons extends Toolbar {
  final bool fullscreen;
  final bool codeview;
  final bool undo;
  final bool redo;
  final bool help;
  final bool copy;
  final bool paste;

  const OtherButtons({
    this.fullscreen = true,
    this.codeview = true,
    this.undo = true,
    this.redo = true,
    this.help = true,
    this.copy = true,
    this.paste = true,
  });

  List<ToolbarButton> getIcons1() {
    var icons = <ToolbarButton>[];
    if (fullscreen)
      icons.add(
        ToolbarButton(
          type: ButtonType.fullscreen,
          child: Icon(
            HotFixFontAwesomeIcons.maximize.iconData,
            size: 14,
          ),
          tooltip: 'Toàn Màn hình',
        ),
      );

    if (codeview)
      icons.add(
        ToolbarButton(
          type: ButtonType.codeview,
          child: Container(
            padding: EdgeInsets.only(right: 2),
            child: Icon(
              HotFixFontAwesomeIcons.code.iconData,
              size: 13,
            ),
          ),
          tooltip: 'Xem Code',
        ),
      );
    if (undo)
      icons.add(
        ToolbarButton(
          type: ButtonType.undo,
          child: Icon(
            HotFixFontAwesomeIcons.arrowRotateLeft.iconData,
            size: 14,
          ),
          tooltip: 'Undo',
        ),
      );
    if (redo)
      icons.add(
        ToolbarButton(
          type: ButtonType.redo,
          child: Icon(
            HotFixFontAwesomeIcons.arrowRotateRight.iconData,
            size: 14,
          ),
          tooltip: 'Redo',
        ),
      );
    if (help)
      icons.add(
        ToolbarButton(
          type: ButtonType.help,
          child: Icon(
            HotFixFontAwesomeIcons.question.iconData,
            size: 14,
          ),
          tooltip: 'Trợ giúp',
        ),
      );
    return icons;
  }

  List<ToolbarButton> getIcons2() {
    var icons = <ToolbarButton>[];
    if (copy)
      icons.add(
        ToolbarButton(
          type: ButtonType.copy,
          child: Icon(
            HotFixFontAwesomeIcons.copy.iconData,
            size: 14,
          ),
          tooltip: 'Copy',
        ),
      );
    if (paste)
      icons.add(
        ToolbarButton(
          type: ButtonType.paste,
          child: Icon(
            HotFixFontAwesomeIcons.paste.iconData,
            size: 14,
          ),
          tooltip: 'Paste',
        ),
      );
    return icons;
  }
}
