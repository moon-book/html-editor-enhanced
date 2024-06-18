import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class InsertImageDialogWeb extends StatefulWidget {
  final HtmlEditorController controller;
  final HtmlToolbarOptions htmlToolbarOptions;
  final Callbacks? callbacks;

  const InsertImageDialogWeb({
    required this.controller,
    required this.htmlToolbarOptions,
    this.callbacks,
    Key? key,
  }) : super(key: key);

  @override
  State<InsertImageDialogWeb> createState() => _InsertImageDialogWebState();
}

class _InsertImageDialogWebState extends State<InsertImageDialogWeb> {
  final TextEditingController filename = TextEditingController();
  final TextEditingController url = TextEditingController();
  final urlFocus = FocusNode();
  FilePickerResult? result;
  String? validateFailed;

  @override
  void dispose() {
    urlFocus.dispose();
    filename.dispose();
    url.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chèn ảnh'),
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.htmlToolbarOptions.allowImagePicking) ...[
            Text(
              'Chọn ảnh từ máy tính',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: filename,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF76A9FA),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    elevation: 0.0,
                  ),
                  onPressed: () async {
                    result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      withData: true,
                      allowedExtensions: widget.htmlToolbarOptions.imageExtensions,
                    );
                    if (result?.files.single.name != null) {
                      setState(() {
                        filename.text = result!.files.single.name;
                      });
                    }
                  },
                  child: Text(
                    'Chọn ảnh',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                suffixIcon: result != null
                    ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            result = null;
                            filename.text = '';
                          });
                        })
                    : Container(height: 0, width: 0),
                errorText: validateFailed,
                errorMaxLines: 2,
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            Text('hoặc thêm ảnh theo url'),
            SizedBox(height: 20),
            Text('URL', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: url,
              focusNode: urlFocus,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'URL',
                errorText: validateFailed,
                errorMaxLines: 2,
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Huỷ bỏ',
            style: TextStyle(color: Color(0xFF4B5563)),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (filename.text.isEmpty && url.text.isEmpty) {
              setState(() {
                validateFailed = widget.htmlToolbarOptions.allowImagePicking
                    ? 'Please either choose an image or enter an image URL!'
                    : 'Please enter an image URL!';
              });
            } else if (filename.text.isNotEmpty && url.text.isNotEmpty) {
              setState(() {
                validateFailed = 'Please input either an image or an image URL, not both!';
              });
            } else if (filename.text.isNotEmpty && result?.files.single.bytes != null) {
              var base64Data = base64.encode(result!.files.single.bytes!);
              var proceed = await widget.htmlToolbarOptions.mediaUploadInterceptor?.call(result!.files.single, InsertFileType.image) ?? true;
              if (proceed) {
                if (widget.callbacks?.onImageUpload != null) {
                  widget.callbacks!.onImageUpload?.call(
                    FileUpload(
                      base64: base64Data,
                      name: result?.files.single.name,
                      type: result?.files.single.extension,
                      size: result?.files.single.bytes?.length,

                      /// TODO: hard-code
                      maxWidth: 600,
                    ),
                  );
                } else {
                  widget.controller.insertHtml(
                      "<img src='data:image/${result!.files.single.extension};base64,$base64Data' data-filename='${result!.files.single.name}'/>");
                }
              }
              Navigator.of(context).pop();
            } else {
              var proceed = await widget.htmlToolbarOptions.mediaLinkInsertInterceptor?.call(url.text, InsertFileType.image) ?? true;
              if (proceed) {
                if (widget.callbacks?.onImageLinkInsert != null) {
                  widget.callbacks?.onImageLinkInsert?.call(url.text.trim());
                } else {
                  widget.controller.insertNetworkImage(url.text);
                }
              }
              Navigator.of(context).pop();
            }
          },
          child: Text('Đồng ý'),
        )
      ],
    );
  }
}
