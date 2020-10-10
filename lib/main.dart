import 'package:flutter/material.dart';
import 'package:learning_app/views/app_bar.dart';
import 'package:learning_app/views/product_fetcher.dart';
import 'package:learning_app/views/list_view.dart';
import 'package:learning_app/views/counter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabBarController;
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MyListView(),
    ProductFetcher('Wrist watch'),
    Counter() // counter's page
  ];

  @override
  void initState() {
    _tabBarController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  void onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white, primaryColorDark: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: customAppBar(),
          body: TabBarView(controller: _tabBarController, children: _pages),
          drawer: CustomDrawer(),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              unselectedLabelStyle: TextStyle(color: Colors.red),
              selectedLabelStyle: TextStyle(color: Colors.red),
              selectedFontSize: 15,
              selectedItemColor: Colors.blue,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: onTabClick,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('User', style: TextStyle(color: Colors.blue))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.email),
                    title: Text('Email', style: TextStyle(color: Colors.blue))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title:
                        Text('Settings', style: TextStyle(color: Colors.blue))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera),
                    title: Text('Photo', style: TextStyle(color: Colors.blue))),
              ]),
        ));
  }

  // customizing the app bar here
  AppBar customAppBar() {
    return AppBar(
      title: Text('Shopping Mall'),
      bottom: TabBar(
        tabs: [
          Tab(text: 'Chat', icon: Icon(Icons.chat)),
          Tab(text: 'Call', icon: Icon(Icons.call)),
          Tab(text: 'Status', icon: Icon(Icons.message))
        ],
        controller: _tabBarController,
      ),
    );
  }
}
