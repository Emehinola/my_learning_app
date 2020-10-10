import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  TextEditingController authorContrl = TextEditingController();
  TextEditingController quoteContrl = TextEditingController();

  bool _isLoading = true; // for progress loading

  String quote;
  String author;

  DocumentReference firestore =
      FirebaseFirestore.instance.collection('quotes').doc('quote');

  Future fetch() async {
    await firestore.get().then((value) {
      if (value.exists) {
        quote = value.data()['text'];
        author = value.data()['author'];
      }
    });
    setState(() {
      _isLoading = false;
    });
    Map<String, String> result = {'text': quote, 'author': author};
    return result;
  }

  update() {
    firestore
        .update({'text': quoteContrl.text, 'author': authorContrl.text})
        .then((value) => print('updated'))
        .catchError((e) {
          print(e);
        });
  }

  delete() {
    firestore.delete();
    setState(() {});
  }

  write() {
    Map<String, String> data = {
      'author': authorContrl.text,
      'text': quoteContrl.text
    };
    firestore.set(data);
    authorContrl.clear();
    quoteContrl.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          FutureBuilder(
              future: fetch(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   _isLoading = true;
                // } else if (snapshot.connectionState == ConnectionState.active) {
                //   setState(() {
                //     _isLoading = false;
                //   });
                // }
                return !_isLoading
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: authorContrl,
                              decoration:
                                  InputDecoration(hintText: 'author here'),
                            ),
                            TextField(
                              controller: quoteContrl,
                              decoration:
                                  InputDecoration(hintText: 'quote goes here'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () => fetch(),
                                  child: Text('Fetch data'),
                                )),
                            Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () => update(),
                                  child: Text('Update data'),
                                )),
                            Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () => delete(),
                                  child: Text('Delete data'),
                                )),
                            Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: () => write(),
                                  child: Text('Write data'),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Quote: ${snapshot.data['text']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Author: ${snapshot.data['author']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })
        ],
      ),
    ));
  }
}
