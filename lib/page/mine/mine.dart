import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'mine',
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          child: const Text('page 3'),
        ),
      ),
    );
  }
}
