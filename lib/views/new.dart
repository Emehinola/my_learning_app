import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_app/views/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firebase.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:learning_app/views/top_design.dart';
import 'package:learning_app/views/bar_design.dart';
import 'package:learning_app/views/crud.dart';
import 'package:learning_app/views/sliver_appbar.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  String text;
  DocumentReference documentReference;

  initState() {
    // FirebaseFirestore.instance
    //     .collection('quotes')
    //     .doc()
    //     .set({'title': 'Fine', 'author': 'Sam'});

    documentReference =
        FirebaseFirestore.instance.collection('quotes').doc('quote');
    super.initState();
  }

  Future getText() async {
    await documentReference.get().then((value) {
      if (value.exists) {
        text = value.data()['author'];
      }
    });
    print(text);
    return text;
  }

  List<UnicornButton> buttons(BuildContext context) {
    List<UnicornButton> _buttons = [
      UnicornButton(
          hasLabel: true,
          labelText: 'Reminder',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'reminder',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BarDesign()));
              print('button pressed');
            },
            child: _roundBtn(),
          )),
      UnicornButton(
          hasLabel: true,
          labelText: 'Profile',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'person',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Crud()));
              print('button pressed');
            },
            child: Icon(Icons.person),
          )),
      UnicornButton(
          hasLabel: true,
          labelText: 'Sliver',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'sliver app bar',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SliverApp()));
              print('button pressed');
            },
            child: Text('40'),
          )),
      UnicornButton(
          hasLabel: true,
          labelText: 'Settings',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'settings',
            onPressed: () {
              print('button pressed');
            },
            child: Icon(Icons.settings),
          )),
      UnicornButton(
          hasLabel: true,
          labelText: 'Notifications',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'notification',
            onPressed: () {
              print('button pressed');
            },
            child: Icon(Icons.notifications),
          )),
      UnicornButton(
          hasLabel: true,
          labelText: 'Design',
          currentButton: FloatingActionButton(
            mini: true,
            heroTag: 'design',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TopDesign()));
            },
            child: Icon(Icons.notifications),
          ))
    ];
    return _buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: Header(),
            preferredSize: Size(MediaQuery.of(context).size.width, 160)),
        body: FutureBuilder<Object>(
            future: getText(),
            builder: (context, snapshot) {
              return Center(
                  child: Text(snapshot.data.toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)));
            }),
        floatingActionButton: UnicornDialer(
          childPadding: 10,
          animationDuration: 300,
          hasNotch: true,
          orientation: UnicornOrientation.VERTICAL,
          childButtons: buttons(context),
          parentButtonBackground: Colors.green,
          finalButtonIcon: Icon(Icons.cancel),
          parentButton: Icon(Icons.add),
        ));
  }
}

Widget _roundBtn() {
  return Stack(
    children: [
      Container(
        child: Icon(Icons.access_time),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        width: 50,
        height: 50,
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                border: Border.all(color: Colors.white, width: 2)),
            child: Text(
              '200',
              style: TextStyle(color: Colors.white),
            ),
          ))
    ],
  );
}
