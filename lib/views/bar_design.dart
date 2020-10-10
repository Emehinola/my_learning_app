import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BarDesign extends StatefulWidget {
  @override
  _BarDesignState createState() => _BarDesignState();
}

class _BarDesignState extends State<BarDesign> {
  final GlobalKey stackKey = GlobalKey();
  ScrollController scrollController;
  bool isUp = false;
  double _height;
  bool hideContainer = false;

  final String text =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose(injected humour and the like).";

  Size size;

  Size getSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }

  final List<int> values = List<int>.generate(10, (index) => index);

  @override
  initState() {
    super.initState();
    print('init state called');
    scrollController = ScrollController();
    scrollController.addListener(() {
      scrollListener();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => getSized());
  }

  getSized() {
    RenderBox _stackSize = stackKey.currentContext.findRenderObject();
    size = _stackSize.size;
    print('size is ${size.height}');
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      print('oh! you are the bottom alread;y');
    } else if (scrollController.offset ==
        scrollController.position.minScrollExtent) {
      print('you are now at the bottom of the list');
    }

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        isUp = false;
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        isUp = true;
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.idle) {
      setState(() {
        isUp = true;
      });
    }
  }

  Widget container(Widget child) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: 70,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
              top: BorderSide(color: Colors.grey, width: 1),
              bottom: BorderSide(color: Colors.grey, width: 1),
              right: BorderSide(color: Colors.grey, width: 1),
              left: BorderSide(color: Colors.grey, width: 1))),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('height is --- $size');
    print('padding is ${MediaQuery.of(context).padding.top}');

    final openArea = size.height + MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(key: stackKey, children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  height: 200,
                  width: getSize(context).width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('./assets/building.jpg'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        icon: Icon(Icons.keyboard_backspace),
                        onPressed: () {
                          Navigator.pop(context);
                          print('back pressed');
                        }),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            print('favorite pressed');
                          })),
                )
              ])
            ]),
            Container(
              height: MediaQuery.of(context).size.height - openArea,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: getSize(context).width,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('#2,000,000',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 25)),
                                          Text('Lagos State, Nigeria',
                                              style: TextStyle(fontSize: 10))
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                left: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text('20 minutes ago',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))
                                  ],
                                )),
                            SizedBox(height: 15),
                            Text('House Information',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 15),
                            Container(
                              width: getSize(context).width,
                              height: 130,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: values.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 65,
                                      child: Column(
                                        children: [
                                          container(Text('${values[index]}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20))),
                                          Text('always willing',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '$text',
                              style: TextStyle(fontSize: 23),
                            )
                          ],
                        )),
                  ),
                  // Visibility(
                  //   visible: isUp,
                  //   child: Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: Container(
                  //         padding: EdgeInsets.only(bottom: 10),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             cont(Icons.message, 'Message'),
                  //             cont(Icons.call, 'Call')
                  //           ],
                  //         ),
                  //       )),
                  // )
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                        width: getSize(context).width,
                        height: isUp ? 0 : 100,
                        alignment: Alignment.bottomCenter,
                        duration: Duration(milliseconds: 400),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              cont(Icons.message, 'Message'),
                              cont(Icons.call, 'Call')
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cont(IconData icon, String text) {
  return GestureDetector(
    onTap: () {
      print('$text tapped');
    },
    child: Container(
      width: 110,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: TextStyle(color: Colors.white))
        ],
      ),
    ),
  );
}
