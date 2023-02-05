import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderDemo extends StatelessWidget {
  const PathProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PathProviderDemo',
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final file = await _getLocalDocumentFile();
              print(file);
            },
            child: const Text(
              '获取读取文件目录',
            ),
          ),
          TextButton(
            onPressed: () async {
              await _write('123456789');
            },
            child: const Text(
              '写文件',
            ),
          ),
          TextButton(
            onPressed: () async {
              final content = await _read();
              print(content);
            },
            child: const Text(
              '读文件',
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getLocalDocumentPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> _getLocalDocumentFile() async {
    final documentPath = await _getLocalDocumentPath();
    return File('$documentPath/counter.txt');
  }

  Future<void> _write(String content) async {
    final file = await _getLocalDocumentFile();
    file.writeAsString(content);
  }

  Future<String> _read() async {
    final file = await _getLocalDocumentFile();
    return file.readAsString();
  }
}
