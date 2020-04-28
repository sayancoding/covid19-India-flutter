import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ListData extends StatelessWidget {
  final String stateName;
  final String confirmed;
  final String active;
  final String recovered;
  final String death;

  const ListData({
    Key key, this.stateName, this.confirmed, this.active, this.recovered, this.death,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            width: MediaQuery.of(context).size.width * 0.28,
            height: 38.0,
            decoration: BoxDecoration(
                color:
                    Colors.blueGrey[100].withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(6))),
            child: Center(
                child: AutoSizeText(
              stateName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
                  maxLines: 2,
            ))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            width: MediaQuery.of(context).size.width * 0.18,
            height: 38.0,
            decoration: BoxDecoration(
                color:
                    Colors.blueGrey[100].withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(6))),
            child: Center(
                child: Text(
              confirmed,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            width: MediaQuery.of(context).size.width * 0.18,
            height: 38.0,
            decoration: BoxDecoration(
                color:
                    Colors.blueGrey[100].withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(6))),
            child: Center(
                child: Text(
              active,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            width: MediaQuery.of(context).size.width * 0.16,
            height: 38.0,
            decoration: BoxDecoration(
                color:
                    Colors.blueGrey[100].withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(6))),
            child: Center(
                child: Text(
              recovered,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ))),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            width: MediaQuery.of(context).size.width * 0.12,
            height: 38.0,
            decoration: BoxDecoration(
                color:
                    Colors.blueGrey[100].withOpacity(0.2),
                borderRadius:
                    BorderRadius.all(Radius.circular(6))),
            child: Center(
                child: Text(
              death,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ))),
      ],
    );
  }
}

class ListHead extends StatelessWidget {
  final String text;
  final Color textColor;
  final double widthHead;
  const ListHead({
    Key key,
    this.textColor,
    this.widthHead,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        width: MediaQuery.of(context).size.width * widthHead,
        height: 26.0,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100].withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        )));
  }
}
