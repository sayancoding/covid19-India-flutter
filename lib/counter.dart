import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int number;
  final String title;
  final Color color;
  
  const Counter({
    Key key, this.number, this.title, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            shape: BoxShape.circle
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.8),
              shape: BoxShape.circle
            ),
          ),
        ),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w500
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: color
          ),
        )
      ],
    );
  }
}