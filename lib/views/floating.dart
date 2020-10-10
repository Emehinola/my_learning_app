import 'package:flutter/material.dart';
import 'package:learning_app/views/f_buttons.dart';

class FloatingButton extends StatefulWidget {
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  bool _itemsDisplayed;

  @override
  void initState() {
    _itemsDisplayed = false;
    super.initState();
  }

  void _floatingTap() {
    setState(() {
      _itemsDisplayed = !_itemsDisplayed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: !_itemsDisplayed
                ? Icon(Icons.menu, size: 30)
                : Icon(
                    Icons.cancel,
                    size: 40,
                  ),
            onPressed: () {
              print('floating pressed');
              print('${MediaQuery.of(context).size.height}');
              _floatingTap();
            }),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '''
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
Here i am just trying to get some of the icons do what i want them to do for me
''',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            _itemsDisplayed
                ? Container(
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            height: 500,
                            child: SmallButton(context),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ));
  }
}
