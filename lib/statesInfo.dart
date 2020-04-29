import 'package:covid19/detailList.dart';
import 'package:covid19/myHeader.dart';
import 'package:covid19/navigationBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatesWiseInfo extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.bug_report,
      color: Colors.blueAccent,
    ),
    BarItem(
      text: "Statewise",
      iconData: Icons.location_city,
      color: Colors.redAccent,
    ),
    BarItem(
      text: "Precaution",
      iconData: Icons.verified_user,
      color: Colors.teal[500],
    )
  ];
  StatesWiseInfo({Key key}) : super(key: key);

  @override
  _StatesWiseInfoState createState() => _StatesWiseInfoState();
}

class _StatesWiseInfoState extends State<StatesWiseInfo> {
  int selectedItem = 1;
  List<String> stateNameList = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    'Kerala',
    "Ladakh",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "TamilNadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];
  List finalFormatedData = [];
  
  // DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  String url = "https://api.covid19india.org/state_district_wise.json";
  Future<List> _getData() async {
    var response = await http.get(url);
    Map data = json.decode(response.body);
    // print(data);
    List formated = [];
    List st = [];
    data.forEach((k, v) => {st.add(v["districtData"])});
    for (int i = 0; i < st.length; i++) {
      List subDistrict = [];
      Map el = st[i];
      el.forEach((k, v) => {subDistrict.add(v)});
      List totalSub = [];
      for (int i = 0; i < subDistrict.length; i++) {
        List subValue = [];
        Map sub = subDistrict[i];
        sub.forEach((k, v) => {
              if (k == "active" ||
                  k == "confirmed" ||
                  k == "deceased" ||
                  k == "recovered")
                subValue.add(v)
            });
        totalSub.add(subValue);
      }
      formated.add(totalSub);
    }

    for (int st = 0; st < formated.length; st++) {
      List temp = [];
      int act = 0, confrm = 0, deth = 0, rcrvd = 0;
      for (int i = 0; i < formated[st].length; i++) {
        act += (formated[st][i][0]);
        confrm += (formated[st][i][1]);
        deth += (formated[st][i][2]);
        rcrvd += (formated[st][i][3]);
      }
      temp.add(stateNameList[st]);
      temp.add(act);
      temp.add(confrm);
      temp.add(deth);
      temp.add(rcrvd);
      finalFormatedData.add(temp);
    }

    return finalFormatedData;
  }

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
                      SizedBox(width: 4.0,),
                      Text(formattedDate,style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 10.0
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
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
                          height: MediaQuery.of(context).size.height * 0.39,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.white),
                          child: FutureBuilder(
                              future: _getData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return Center(child: Text("Loading.."));
                                }
                                return ListView.builder(
                                    itemCount: snapshot.data == null
                                        ? 0
                                        : 32,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListData(
                                        stateName: snapshot.data[index][0],
                                        death: snapshot.data[index][3].toString(),
                                        recovered: snapshot.data[index][4].toString(),
                                        active: snapshot.data[index][1].toString(),
                                        confirmed: snapshot.data[index][2].toString(),
                                      );
                                    });
                              }),
                        ),
                        SizedBox(height: 4.0,),
                        Container(
                          child: Text("Source: covid19india.org",style: TextStyle(
                            fontSize: 8.0
                          ),),
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
      bottomNavigationBar: AnimatedBottomBar(
      barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 300),
        onTapBar: (index){
          setState(() {
            selectedItem = index;
            // print(selectedItem);
          });
        },
        gettingSelected: 1,
    ),
    );
  }
}

class StateObject {
  Object name;

  StateObject(this.name);

  @override
  String toString() {
    return '{ ${this.name} }';
  }
}
