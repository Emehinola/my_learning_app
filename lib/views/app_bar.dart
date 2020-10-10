import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Emehinola Samuel',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 25),
          ),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('./assets/sam.jpg')),
                Text('Acct bal: \$50.54', style: TextStyle(fontSize: 23))
              ]))
        ]),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          title: Text('My name'),
          subtitle: Text('Description'),
          leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                './assets/adamu.jpg',
              )),
          trailing: Icon(Icons.more_vert),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          title: Text('Account Opening'),
          subtitle: Text('Open an account here'),
          leading: Icon(Icons.open_in_new),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          title: Text('Account Settings'),
          subtitle: Text('Account settings here'),
          leading: Icon(Icons.settings),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
          title: Text('Track Order'),
          subtitle: Text('You can track all your orders here'),
          leading: Icon(Icons.shopping_cart),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ListTile(
            title: Text('Logout'),
            subtitle: Text('Logout from your account'),
            leading: Icon(Icons.call_missed_outgoing)),
      ),
      SizedBox(height: 100),
      Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Copyright@ Apex @ 2020'))
    ]));
  }
}

AppBar customAppBar() {
  TabController _tabBarController = TabController(length: 3, vsync: null);
  return AppBar(
      title: Text('Shopping Mall'),
      bottom: TabBar(
        tabs: [
          Tab(text: 'Chat', icon: Icon(Icons.chat)),
          Tab(text: 'Call', icon: Icon(Icons.call)),
          Tab(text: 'Status', icon: Icon(Icons.message))
        ],
        controller: _tabBarController,
      ));
}

BottomNavigationBar customBtnNavigation() {
  return BottomNavigationBar(
      currentIndex: 0,
      unselectedLabelStyle: TextStyle(color: Colors.red),
      selectedLabelStyle: TextStyle(color: Colors.red),
      selectedFontSize: 15,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('User', style: TextStyle(color: Colors.blue))),
        BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('Email', style: TextStyle(color: Colors.blue))),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(color: Colors.blue))),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Photo', style: TextStyle(color: Colors.blue))),
      ]);
}
