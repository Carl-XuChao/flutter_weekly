import 'package:flutter/material.dart';
import 'package:flutter_weekly/page/mine/mine.dart';

import 'content/content.dart';
import 'home/home.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: '内容'),
              BottomNavigationBarItem(icon: Icon(Icons.money_outlined), label: '我的'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _tabController.animateTo(index);
            },
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              ContentPage(),
              MinePage(),
            ],
          ),
        ),
      ),
    );
  }
}
