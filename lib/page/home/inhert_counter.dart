import 'package:flutter/material.dart';

class InheritedState extends InheritedWidget {
  const InheritedState(this.count, {Key? key, required Widget child})
      : super(key: key, child: child);

  final int count;

  static InheritedState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedState>();
  }

  void increase() {}

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return count != (oldWidget as InheritedState).count;
  }
}

class InheritedCounter extends StatefulWidget {
  const InheritedCounter({Key? key}) : super(key: key);

  @override
  State<InheritedCounter> createState() => _InheritedCounterState();
}

class _InheritedCounterState extends State<InheritedCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget custom'),
      ),
      body: InheritedState(_count,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              WidgetA(),
              WidgetB(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count += 1;
          });
        },
        child: const Text("++"),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      child: const Text('WidgetA'),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      child: Text(InheritedState.of(context)?.count.toString() ?? '--'),
    );
  }
}
