import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fun_wanandroid/pages/homePage.dart';
import 'package:fun_wanandroid/pages/navigationPage.dart';
import 'package:fun_wanandroid/pages/projectPage.dart';
import 'package:fun_wanandroid/pages/threePage.dart';
import 'package:fun_wanandroid/res/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyBottomNavigationBar(),
      builder: EasyLoading.init(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyBottomNavigationBarState();
  }
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  double drawerWidthPercentage = 0.8;

  final PageController _pageController = PageController(keepPage: true);

  final ValueNotifier<int> _currentPageNotifier = ValueNotifier(0);

  final List<Widget> _pages = [
    const HomePage(),
    const ThreePage(),
    const NavigationPage(),
    const ProjectPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double drawerWidth = screenWidth * drawerWidthPercentage;

    return Scaffold(
      appBar: AppBar(
          title: ValueListenableBuilder<int>(
        valueListenable: _currentPageNotifier,
        builder: (context, index, child) {
          return Text('Page Item ${index + 1}');
        },
      )),
      drawer: Drawer(
        width: drawerWidth,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                //处理侧滑Item点击
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                //处理侧滑Item点击
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
            _currentPageNotifier.value = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: YStrings.home),
          BottomNavigationBarItem(icon: const Icon(Icons.filter_list), label: YStrings.tree),
          BottomNavigationBarItem(icon: const Icon(Icons.low_priority), label: YStrings.navi),
          BottomNavigationBarItem(icon: const Icon(Icons.apps), label: YStrings.project)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _currentPageNotifier.value = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
