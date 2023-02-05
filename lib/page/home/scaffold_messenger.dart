import 'package:flutter/material.dart';

class ScaffoldMessengerDemo extends StatelessWidget {
  const ScaffoldMessengerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('hello, world')));
        // ScaffoldMessenger.of(context).showMaterialBanner(
        //   const MaterialBanner(content: Text('hello, world'), actions: [
        //     Text('hello, world 1'),
        //     Text('hello, world 1'),
        //   ]),
        // );
      },
      child: const Text('click'),
    );
  }
}
