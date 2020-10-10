import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_app/views/chat.dart';

class TopDesign extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController txtCtrl = TextEditingController();

  TextField _search() {
    final form = TextField(
      enableInteractiveSelection: true,
      textInputAction: TextInputAction.search,
      controller: txtCtrl,
      decoration: InputDecoration(
          enabled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.lightGreen)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('searched result gotten: ${_input()}');
              }),
          contentPadding: EdgeInsets.all(10),
          hintText: 'Search history',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey))),
      onSubmitted: (String txt) => _input(),
    );

    return form;
  }

  String _input() {
    String text = txtCtrl.text;
    return text;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _alertDialog() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                  height: 100,
                  child: Center(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('./assets/sam.jpg'),
                  ))),
              actions: [
                FlatButton(
                    onPressed: () => Navigator.pop(context, 'done'),
                    child: Text('Done')),
                FlatButton(
                    onPressed: () => Navigator.pop(context, 'cancel'),
                    child: Text('Cancel'))
              ],
            );
          })) {
        case 'done':
          print('Done');
          break;
        case 'cancel':
          print('Cancelled');
          break;
        default:
          print('Dismissed');
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(),
        appBar: AppBar(
          leading:
              CircleAvatar(backgroundImage: AssetImage('./assets/sam.jpg')),
          title: Text('Admission Social', style: TextStyle(fontSize: 25)),
          centerTitle: false,
          bottom: PreferredSize(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    IconButton(
                        icon:
                            Icon(Icons.format_align_left, color: Colors.white),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                          print('pressed');
                        }),
                    Expanded(child: _search()),
                    IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          _alertDialog();
                          print('profile pressed');
                        }),
                  ])),
              preferredSize:
                  Size(MediaQuery.of(context).size.width, kToolbarHeight)),
        ),
        body: ListView(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('./assets/building.jpg'),
                    //     fit: BoxFit.cover)
                    ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) => Post(),
                      itemCount: 10,
                    )
                  ],
                ),
              ),
            ]));
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('./assets/sam.jpg'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sam',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('Unilag - Computer Science')
                      ],
                    ),
                  ],
                ),
                IconButton(
                  tooltip: 'Message the user',
                  icon: Icon(Icons.message, color: Colors.lightGreen),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ChatScreen()));
                    print('chat opened');
                  },
                ),
                IconButton(
                  tooltip: 'Turn on notification for this post',
                  icon: Icon(Icons.notifications, color: Colors.redAccent),
                  onPressed: () {
                    print('notification enabled');
                  },
                ),
              ],
            )),
        Image.asset('./assets/building.jpg'),
        Container(
          height: 60,
          color: Colors.blueGrey,
          child: Row(
            children: [
              IconButton(
                  tooltip: 'Your profile',
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    print('up voted');
                  }),
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration:
                      InputDecoration(hintText: 'Write  comment here...'),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.thumb_down,
                  color: Colors.black54,
                  size: 25,
                ),
                onPressed: () {
                  print('thumb down');
                },
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
