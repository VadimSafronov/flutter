import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Здесь у нас будет идти запись в ApplicationDocumentsDirectory
// Указываем путь
class TextStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/text.txt');
  }
// Читаем файл
  Future<String> readFile() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return '';
    }
  }
// Запись файла
  Future<File> writeFile(String text) async {
    final file = await _localFile;
    return file.writeAsString('$text\r\n', mode: FileMode.append);
  }
// Чистим файл
  Future<File> cleanFile() async {
    final file = await _localFile;
    return file.writeAsString('');
  }
}
// Дальше идет работа с Виджетом
class PathDemo extends StatefulWidget {
  final TextStorage storage;
  static const routeName = '/noPath';
  PathDemo({Key key, @required this.storage}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PathDemo> {
  TextEditingController _textField = new TextEditingController();

  String _content = '';

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((String text) {
      setState(() {
        _content = text;
      });
    });
  }

  Future<File> _writeStringToTextFile(String text) async {
    setState(() {
      _content += text + '\r\n';
    });

    return widget.storage.writeFile(text);
  }

  Future<File> _clearContentsInTextFile() async {
    setState(() {
      _content = '';
    });

    return widget.storage.cleanFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read/Write File Example'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
                controller: _textField,
                decoration: InputDecoration.collapsed(
                    hintText: "Write in ApplicationDocumentsDirectory")),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Write to File'),
                onPressed: () {
                  if (_textField.text.isNotEmpty) {
                    _writeStringToTextFile(_textField.text);
                    _textField.clear();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                child: Text(
                  'Clear Contents',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  _clearContentsInTextFile();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: new SingleChildScrollView(
                child: Text(
                  '$_content',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
