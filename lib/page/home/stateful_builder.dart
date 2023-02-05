import 'package:flutter/material.dart';

class StatefulBuilderDemo extends StatelessWidget {
  const StatefulBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _count = 1;
    return Container(
      color: Colors.green,
      child: StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return ElevatedButton(
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
            child: Text(
              '$_count',
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
