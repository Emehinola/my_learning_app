import 'package:flutter/material.dart';
import 'package:learning_app/views/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_app/views/forms.dart';
import 'package:learning_app/views/buts.dart';
import 'package:learning_app/views/animations.dart';
import 'package:learning_app/views/vertical_anim.dart';
import 'package:learning_app/views/floating.dart';
import 'package:learning_app/views/new.dart';

class ActionBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActionState();
  }
}

class _ActionState extends State<ActionBtn> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DateTime now = DateTime.now();

  int _currentIndex;

  List<String> _menu = [
    'Forms',
    'Buttons',
    'Animations',
    'Animations 2',
    'Floating buttons'
  ];
  List<int> _index = [0, 1, 2, 3, 4];
  List<Widget> _screens = [
    Forms(),
    Buttons(),
    AnimationScreen(),
    VericalAnim(),
    FloatingButton(),
  ];

  @override
  initState() {
    _currentIndex = 0;
    super.initState();
  }

  _onSelected(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Actions page'),
            actions: [
              PopupMenuButton(
                  onSelected: _onSelected,
                  itemBuilder: (BuildContext context) {
                    return _index.map((index) {
                      return PopupMenuItem(
                          child: Text(_menu[index]), value: index);
                    }).toList();
                  })
            ],
          ),
          body: _screens[_currentIndex],
          drawer: CustomDrawer(),
        ));
  }
}
