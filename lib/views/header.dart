import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LinearGradient color = LinearGradient(
        colors: [Colors.green, Colors.purple],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight); // gradient for the header

    LinearGradient color2 = LinearGradient(
        colors: [Colors.white, Colors.purple[200]],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight);

    return Container(
      // margin: EdgeInsets.only(top: 32),

      decoration: BoxDecoration(color: Colors.white, gradient: color2),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              ),
              SizedBox(
                width: 10,
              ),
              ShaderMask(
                child: Text(
                  'Jamb Social',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontStyle: FontStyle.normal,
                      color: Colors.amberAccent),
                ),
                shaderCallback: (rect) => color.createShader(rect),
              )
            ],
          ),
          Divider(),
          ShaderMask(
              child: Text(
                'Developing towards a better world... We crave for your success. \nLatest: Jamb has announced the date for the commencement of the 2020/2021 examination',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent),
              ),
              shaderCallback: (rect) => color.createShader(rect)),
        ],
      ),
    );
  }
}
