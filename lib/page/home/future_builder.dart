import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({Key? key}) : super(key: key);

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

/*
* 实现原理还是根据异步方法返回的数据进行setState状态更新， 其中涉及到外部传参future数据更新的处理。
* */
class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  late Future<int> _data;

  @override
  void initState() {
    _data = _getData();
    super.initState();
  }

  Future<int> _getData() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // todo： 初始状态
            return const Text(
              'init state',
              style: TextStyle(fontSize: 24, color: Colors.black),
            );
          case ConnectionState.waiting:
            // todo: loading widget
            return const Text(
              'loading ...',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              // todo： 异常状态
              return const Text(
                'somethings error',
                style: TextStyle(fontSize: 24, color: Colors.red),
              );
            } else if (snapshot.hasData) {
              // todo： 正常加载数据状态
              return Text(
                'data is  ${snapshot.data}',
                style: const TextStyle(fontSize: 24, color: Colors.black),
              );
            } else {
              // todo： 空状态
              return const Text(
                'data is empty',
                style: TextStyle(fontSize: 24, color: Colors.black),
              );
            }
          case ConnectionState.active:
            // future 不存在这个状态
            return const SizedBox.shrink();
        }
      },
      future: _data,
    );
  }
}
