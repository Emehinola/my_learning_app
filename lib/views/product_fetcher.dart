// fetching product here

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/views/products.dart';
import 'package:learning_app/views/list_view.dart';
import 'package:learning_app/views/actions.dart';

class ProductFetcher extends StatefulWidget {
  final initialProduct;

  ProductFetcher(this.initialProduct);

  @override
  State<StatefulWidget> createState() {
    return ProductFetcherState();
  }
}

class ProductFetcherState extends State<ProductFetcher> {
  final List<String> product = [];

  @override
  void initState() {
    product.add(widget.initialProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      product.add('Another product');
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    'Add product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyListView(),
                      ));
                },
                child: Text('List view'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActionBtn(),
                      ));
                },
                child: Text('Actions'),
              )
            ]),
        Product(product)
      ]),
    ]);
  }
}
