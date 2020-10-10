// this class file displays list items statically
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/views/models.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var action;
  final List<User> items = List<User>.generate(
      10,
      (index) => User(
          index: index,
          name:
              'Emehinola Samuel $index')); // creating a list of integers from 1 to 10

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _snackBar(String item) {
    SnackBar snackBar = SnackBar(
      content: Text('$item deleted from the list'),
      duration: Duration(milliseconds: 1000),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView.builder(
          key: _scaffoldKey,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            Future<bool> _promptUser(DismissDirection direction) async {
              return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                          content: Text('Do you really want to delete?'),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text('Yes')),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: Text('No'))
                          ],
                        ) ??
                        false; // returns false if the dialog is dismissed by the user or other events
                  });
            }

            _handleSwipe(DismissDirection direction, int index) {
              final swipedItem = items[index];

              items.removeAt(index);

              if (direction == DismissDirection.startToEnd) {
                action = 'delete';
              } else {
                action = 'archieve';
              }

              Scaffold.of(context)
                  .showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: Text('Are you sure want to delete?'),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          final copied = User.copy(swipedItem);
                          print(copied == swipedItem);
                          setState(() => items.insert(index, copied));
                        }),
                  ))
                  .closed
                  .then((reason) {
                if (reason == SnackBarClosedReason.dismiss) {
                  print('dismissed');
                }
              });
            }

            return Dismissible(
                key: ValueKey(items[index]),
                background: Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Delete message',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  color: Colors.red,
                ),
                secondaryBackground: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text('Archieve message',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  color: Colors.yellow,
                ),
                confirmDismiss: (direction) => _promptUser(
                    direction), // prompts the user to get a confirmation message from him/her
                onDismissed: (direction) {
                  return _handleSwipe(direction, index);
                  // _snackBar(items[index].toString());
                },
                child: Card(
                    shadowColor: Colors.white,
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(6)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('./assets/sam.jpg'),
                        ),
                        title: Text('Emehinola Samuel ${index + 1}'),
                        subtitle: index > 1
                            ? Text('$index messages')
                            : Text('$index message'),
                        trailing: IconButton(
                          icon: Icon(Icons.mode_edit),
                          onPressed: () {},
                        ),
                      ),
                      height: 60,
                    )));
          });
    });
  }
}
