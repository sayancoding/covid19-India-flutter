import 'package:covid19/detailList.dart';
import 'package:covid19/myHeader.dart';
import 'package:flutter/material.dart';

class StatesWiseInfo extends StatefulWidget {
  StatesWiseInfo({Key key}) : super(key: key);

  @override
  _StatesWiseInfoState createState() => _StatesWiseInfoState();
}

class _StatesWiseInfoState extends State<StatesWiseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            imagePath: "assets/icons/symptoms.svg",
            topText: "People're",
            bottomText: "in Risk Statewise",
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "India's Statewise",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ListHead(
                              widthHead: 0.28,
                              textColor: Colors.black,
                              text: "State",
                            ),
                            ListHead(
                              widthHead: 0.18,
                              textColor: Colors.red[600],
                              text: "Cnfrm",
                            ),
                            ListHead(
                              widthHead: 0.18,
                              textColor: Colors.blue[500],
                              text: "Actv",
                            ),
                            ListHead(
                              widthHead: 0.16,
                              textColor: Colors.green[500],
                              text: "Rcvr",
                            ),
                            ListHead(
                              widthHead: 0.12,
                              textColor: Colors.grey[600],
                              text: "Dth",
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.0),
                          child: Column(
                            children: <Widget>[
                              ListData(stateName: "Kolkata",confirmed: "8000",active: "6000",recovered: "1600",death: "212",),
                              ListData(stateName: "Delhi",confirmed: "8000",active: "6000",recovered: "1600",death: "212",),
                              ListData(stateName: "Himachal Pradesh",confirmed: "8000",active: "6000",recovered: "1600",death: "212",),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
