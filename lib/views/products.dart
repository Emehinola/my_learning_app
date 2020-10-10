// this holds the products we are working with in this class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/views/single.dart';

class Product extends StatelessWidget {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _product;

  Product(this._product);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Container(
        child: Column(children: [
      SingleChildScrollView(
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              itemCount: _product.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Single(id: index)));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              './assets/adamu.jpg',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "List item -- ${_product[index]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor,
                                  fontSize: 23),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]);
              }),
        ),
      ),
    ]));
  }
}
