import 'package:flutter/material.dart';
import '../constrant.dart';

class Counter extends StatelessWidget {
  final int number;
  final String title;
  final Color color;

  Counter(this.number, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: color, width: 2)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$number',
            style: TextStyle(fontSize: 40, color: color),
          ),
          Text(
            '$title',
            style: kSubTextStyle,
          )
        ],
      ),
    );
  }
}
