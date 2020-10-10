import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_app/views/new.dart';

// this file defines the row of icons when the floating action button is pressed

class SmallButton extends StatelessWidget {
  BuildContext context;

  SmallButton(this.context);

  void _onItemTap() {
    print('floating action button pressed...');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
                onTap: _onItemTap,
                child: Container(
                    width: 139,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[200]),
                            child: Icon(Icons.search),
                          ),
                        ]))),
            GestureDetector(
                onTap: (){print('button pressed');},
                child: Container(
                    width: 139,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Message',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[200]),
                            child: Icon(Icons.local_post_office),
                          ),
                        ]))),
            GestureDetector(
                onTap: (){print('button pressed');},
                child: Container(
                    width: 139,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[200]),
                            child: Icon(Icons.settings),
                          ),
                        ]))),
            GestureDetector(
                onTap: (){print('button pressed');},
                child: Container(
                    width: 139,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Question',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[200]),
                            child: Icon(Icons.question_answer),
                          ),
                        ]))),
            GestureDetector(
                onTap: (){print('button pressed');},
                child: Container(
                    width: 139,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Notifiactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[200]),
                            child: Icon(Icons.notifications_active),
                          ),
                        ]))),
          ]),
    );
  }
}
