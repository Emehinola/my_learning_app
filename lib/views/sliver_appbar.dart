import 'package:flutter/material.dart';

class SliverApp extends StatelessWidget {
  List<int> _items = List<int>.generate(10, (value) => value);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            IconButton(icon: Icon(Icons.mobile_screen_share), onPressed: () {})
          ],
          centerTitle: false,
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Stack(
              children: [
                Image.asset(
                  './assets/girl.jpg',
                  fit: BoxFit.cover,
                  height: 332,
                ),
                Container(decoration: BoxDecoration(color: Colors.black45))
              ],
            ),
            title: Text(
              'Hello world',
              style: TextStyle(color: Colors.amberAccent),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      height: 70,
                      child: Card(
                        child: Text('$index'),
                      ),
                    ),
                childCount: 10))
      ],
    );
  }
}
