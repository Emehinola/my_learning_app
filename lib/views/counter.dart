import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('./assets/sam.jpg'))),
            child: Center(
                child: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Text(
                    'Counter',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('$_counter',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          backgroundColor:
                              Colors.red)) // displays counter to the screen
                ],
              ),
            ])),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _increaseCounter,
          ),
        ));
  }

  // the function to re-set counter on every button press
  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }
}
