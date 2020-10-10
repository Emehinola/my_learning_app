import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
              print('back');
            }),
        title: Text(
          'Michael',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: FlatButton(
                      onPressed: () {
                        print('more pressed');
                      },
                      child: Text('More'))),
              PopupMenuItem(
                  child: FlatButton(
                      onPressed: () {
                        print('chat archieved');
                      },
                      child: Text('Archieve chat'))),
              PopupMenuItem(
                  child: FlatButton(
                      onPressed: () {
                        print('Report user');
                      },
                      child: Text('Report user')))
            ];
          })
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text('This conversation has an end to end encryption'),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.grey[300]),
                  child: Text('Today')),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'Hello dear',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'I\'m good and you?',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'Good also \n And i forgot to ask you something yesterday',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'Okay, so what\'s that?',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'But i hope it\'s not about money?',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueAccent),
                            child: Text(
                              'No.it\'s just that i love you',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.face),
                      onPressed: () {
                        print('emoji pressed');
                      }),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Type a message'),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        print('message sent');
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
