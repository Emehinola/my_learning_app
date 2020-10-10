import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Forms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // returning the class state here
    return _FormState();
  }
}

class _FormState extends State<Forms> {
  // focus nodes
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();
  FocusNode numNode = FocusNode();

// controllers
  TextEditingController emailController;
  TextEditingController passController;
  TextEditingController numController;

  initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    numController = TextEditingController();

    super.initState();
  }

// creating forms variables
  Widget getEmail(context) {
    // get the current running platform
    var platform = Theme.of(context).platform;

    final email = TextField(
      autocorrect: false,
      style: TextStyle(
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red)),
        labelText: 'Email here', // this shows at the top
        hintText: 'Email',
        helperText: 'Input the correct email here',
        suffixIcon: Icon(Icons.email),
        isDense: true,
        alignLabelWithHint: true,
        prefixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 10,
        ),
      ),
      cursorColor: Theme.of(context).primaryColor,
      readOnly: false,
      focusNode: emailNode,
      cursorRadius: Radius.circular(2.0),
      cursorWidth: 2.0,
      controller: emailController,
      textInputAction: platform == TargetPlatform.iOS
          ? TextInputAction.continueAction
          : null,
    );

    return email;
  }

  Widget getPass(context) {
    final pass = TextField(
      autocorrect: false,
      decoration: InputDecoration(
          helperText: 'Input the correct password here',
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey[300]),
          suffixIcon: Icon(Icons.lock),
          labelText: 'Password here'),
      cursorColor: Theme.of(context).primaryColor,
      obscureText: true,
      obscuringCharacter: '-',
      focusNode: passNode,
      controller: passController, textAlign: TextAlign.left,
      keyboardType:
          TextInputType.number, // sets the desired keyboard for the input type
    );

    return pass;
  }

  Widget getNum(context) {
    final pass = TextField(
      autocorrect: false,
      decoration: InputDecoration(
          helperText: 'Input the correct phone here',
          hintText: 'Phone Number',
          hintStyle: TextStyle(color: Colors.grey[300]),
          suffixIcon: Icon(Icons.phone),
          labelText: 'Telephone here'),

      cursorColor: Theme.of(context).primaryColor,

      focusNode: numNode,
      controller: numController, textAlign: TextAlign.left,
      keyboardType:
          TextInputType.number, // sets the desired keyboard for the input type
    );

    return pass;
  }

  Widget button(context) {
    final but = RaisedButton(
        onPressed: () {
          if (passController.text == '') {
            FocusScope.of(context).requestFocus(passNode);
            print('hello world');
          } else if (emailController.text == '') {
            FocusScope.of(context).requestFocus(emailNode);
          }
          print(emailController.text);
        },
        child: Text('Create account',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        elevation: 2.0,
        color: Theme.of(context).primaryColor);
    return but;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]); // THIS SETS THE SCREEN ORIENTATION
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          shadowColor: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'My forms are defined here',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.blue[100],
                        spreadRadius: 2.0),
                  ])),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    getEmail(context),
                    SizedBox(
                      height: 20,
                    ),
                    getPass(context),
                    SizedBox(
                      height: 20,
                    ),
                    getNum(context),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: button(context)),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                              child: Text('Forgot password?',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {}),
                        ),
                        FlatButton(
                            child: Text('Already have an account?\nLogin'),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
