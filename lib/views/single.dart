import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/views/app_bar.dart';

class Single extends StatelessWidget {
  final int id;
  Single({this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          leading: (IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }))),
      body: Show(blogId: this.id),
      drawer: CustomDrawer(),
    ));
  }
}

class Show extends StatelessWidget {
  final int blogId;

  Show({this.blogId});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: EdgeInsets.all(6.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Text(
                'Blog news in details ${this.blogId + 1}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 6.0),
            Divider(color: Colors.blue),
            Image.asset('./assets/adamu.jpg'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'The blog title goes here... goes here... goes here... goes here...goes here... goes here...',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // SizedBox(height: 30), it adds vertical space
                // Divider(), adds horizontal line
                SizedBox(height: 10),
                Container(
                  child: Text(
                    'The body of the blog goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...The body of the blog goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here... goes here...',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                )
              ],
            ),
          ])),
    ]);
  }
}
