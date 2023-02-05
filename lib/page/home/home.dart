import 'package:flutter/material.dart';
import 'package:flutter_weekly/page/home/scaffold_messenger.dart';
import 'package:flutter_weekly/page/home/stateful_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;

  double _padding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'home',
        ),
      ),
      // body: const SharedPreferencesDemo(),
      // body: const PathProviderDemo(),
      // body: const InheritedCounter(),
      body: Column(
        children: [
          // Scrollbar(child: null,)
          SelectableText('hello, word', onTap: () {
            print('hello, world');
          }),

          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Flutter'),
              subtitle: Text('rivepod'),
              trailing: Icon(Icons.select_all_outlined),
              dense: true,
              onTap: () {
                print('click a listTitle');
                setState(() {
                  _opacity = _opacity == 0 ? 1 : 0;
                  _padding = 32;
                });
              },
              selectedColor: Colors.red,
            ),
          ),

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
            child: const FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.5,
              alignment: Alignment.center,
              child: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
          ),

          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1),
            child: Text('opacity'),
          ),
          AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: Duration(seconds: 1),
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
          ),

          // FutureBuilderDemo(),
          StatefulBuilderDemo(),
          ScaffoldMessengerDemo(),

          MediaQuery
        ],
      ),
    );
  }
}
