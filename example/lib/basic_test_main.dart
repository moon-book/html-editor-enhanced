import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

void main() {
  runApp(BasicHtmlEditorTestApp());
}

class BasicHtmlEditorTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTML Editor Basic Test',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: BasicHtmlEditorTestPage(),
    );
  }
}

class BasicHtmlEditorTestPage extends StatefulWidget {
  @override
  _BasicHtmlEditorTestPageState createState() =>
      _BasicHtmlEditorTestPageState();
}

class _BasicHtmlEditorTestPageState extends State<BasicHtmlEditorTestPage> {
  final HtmlEditorController _controller = HtmlEditorController();
  String _htmlOutput = '';
  String _status = 'Editor is loading...';

  Future<void> _readHtml() async {
    final html = await _controller.getText();

    setState(() {
      _htmlOutput = html.isEmpty ? '(empty)' : html;
      _status = 'Read HTML from editor';
    });
  }

  void _loadSampleHtml() {
    _controller.setText('''
<h2>HTML editor test</h2>
<p>This content was loaded from <strong>basic_test_main.dart</strong>.</p>
<ul>
  <li>Edit this text in the editor.</li>
  <li>Press "Get HTML" to inspect the result.</li>
</ul>
''');

    setState(() {
      _status = 'Loaded sample HTML';
    });
  }

  void _insertHtmlSnippet() {
    _controller.insertHtml(
      '<p style="color: #00796b;"><em>Inserted HTML snippet</em></p>',
    );

    setState(() {
      _status = 'Inserted HTML snippet';
    });
  }

  void _clearEditor() {
    _controller.clear();

    setState(() {
      _htmlOutput = '';
      _status = 'Editor cleared';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          _controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('HTML Editor Basic Test'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Toggle code view',
              icon: Icon(Icons.code),
              onPressed: _controller.toggleCodeView,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.toggleCodeView();
          },
          child: Text(r'<\>',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(_status),
                SizedBox(height: 12),
                HtmlEditor(
                  controller: _controller,
                  htmlEditorOptions: HtmlEditorOptions(
                    hint: 'Type HTML content here...',
                    shouldEnsureVisible: true,
                  ),
                  htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.aboveEditor,
                    toolbarType: ToolbarType.nativeScrollable,
                  ),
                  otherOptions: OtherOptions(height: 420),
                  callbacks: Callbacks(
                    onInit: () {
                      setState(() {
                        _status = 'Editor initialized';
                      });
                    },
                    onChangeContent: (String? value) {
                      debugPrint('Content changed: ${value ?? ''}');
                    },
                  ),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _loadSampleHtml,
                      child: Text('Load sample'),
                    ),
                    ElevatedButton(
                      onPressed: _readHtml,
                      child: Text('Get HTML'),
                    ),
                    ElevatedButton(
                      onPressed: _insertHtmlSnippet,
                      child: Text('Insert HTML'),
                    ),
                    OutlinedButton(
                      onPressed: _clearEditor,
                      child: Text('Clear'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Output',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 8),
                Container(
                  constraints: BoxConstraints(minHeight: 120),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SelectableText(_htmlOutput),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
