import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Buttons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<Buttons> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DateTime now = DateTime.now();

  _snackBar(String display) {
    SnackBar snackBar = SnackBar(
        content: Row(children: [
          Icon(Icons.access_alarm),
          Text.rich(TextSpan(
            text: 'Hello',
            children: [
              TextSpan(text: display, style: TextStyle(color: Colors.yellow))
            ],
            style: TextStyle(color: Colors.red),
          ))
        ]),
        duration: Duration(milliseconds: 1000));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(builder: (context) {
        Future<void> _alertDialog() async {
          switch (await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    'Here i am having my first alert dialog \nHere we are...',
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    'Info',
                    style: TextStyle(color: Colors.green),
                  ),
                  backgroundColor: Theme.of(context).primaryColorDark,
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context,
                              'Cancel'); // returns the 'Cancel' value when the cancel button is being pressed
                        },
                        child: Text('Cancel')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context,
                              'Done'); // returns the 'Done' value when the cancel button is being pressed
                        },
                        child: Text('Done')),
                  ],
                );
              })) {
            case 'Done':
              _snackBar(
                  'Done pressed'); // this checks if the returned value from the dialog is 'Done'
              break;
            case 'Cancel':
              _snackBar(
                  'Cancel pressed'); // this checks if the returned value from the dialog is 'Cancel'
              break;
            default:
              _snackBar(
                  'Nothing pressed'); // this checks whether the dialog was dismissed
          }
        }

        _timerDialog() {
          showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: now.hour, minute: now.minute))
              .then((value) => _snackBar(
                  '${value.format(context)}')); // this dialog shows the time picker dialog
        }

        _datePicker() {
          showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(now.year + 1))
              .then(
                  (value) => _snackBar('${value ?? ' Nothing was selected'}'));
        }

        Future<void> _cuperTinoAlert() async {
          switch (await showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  content: Container(
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('./assets/sam.jpg'),
                        title: Text('You are the one with this image'),
                      ),
                    ),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, 'agree');
                        },
                        child: Text('Agree')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, 'disagree');
                        },
                        child: Text('Disagree')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, 'leave me');
                        },
                        child: Text('Leave me'))
                  ],
                );
              })) {
            case 'agree':
              _snackBar('Thanks for the agreement');
              break;
            case 'disagree':
              _snackBar('Awwwnn, why did u disagree na');
              break;
            case 'leave me':
              _snackBar('Okay sir');
              break;

            default:
              _snackBar('Nothing selected. Thanks');
          }
        }

        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          key: scaffoldKey,
          body: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _cuperTinoAlert();
                      },
                      child: Text('Cupertino alert'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _snackBar('programmer');
                      },
                      child: Text('Snack bar'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _timerDialog();
                      },
                      child: Text('Time picker'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _alertDialog();
                      },
                      child: Text('Alert dialog 1'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Row(children: [
                              Icon(Icons.access_alarm),
                              Text.rich(TextSpan(
                                text: 'Hello',
                                children: [
                                  TextSpan(
                                      text: 'programmer',
                                      style: TextStyle(color: Colors.yellow))
                                ],
                                style: TextStyle(color: Colors.red),
                              ))
                            ]),
                            duration: Duration(milliseconds: 1000)));
                      },
                      child: Text('Alert dialog 2'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _datePicker();
                      },
                      child: Text('Date picker dialog'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _alertDialog();
                      },
                      child: Text('Toast'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Row(children: [
                              Icon(Icons.access_alarm),
                              Text.rich(TextSpan(
                                text: 'Hello',
                                children: [
                                  TextSpan(
                                      text: 'programmer',
                                      style: TextStyle(color: Colors.yellow))
                                ],
                                style: TextStyle(color: Colors.red),
                              ))
                            ]),
                            duration: Duration(milliseconds: 1000)));
                      },
                      child: Text('Alert dialog 2'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _datePicker();
                      },
                      child: Text('Date picker dialog'),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
