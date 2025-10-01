import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ToolbarButton extends StatelessWidget {
  final ButtonType type;
  final Widget child;
  final String tooltip;

  ToolbarButton({required this.type, required this.child, this.tooltip = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: child,
    );
  }
}
