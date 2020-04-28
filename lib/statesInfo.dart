import 'package:covid19/detailList.dart';
import 'package:covid19/myHeader.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatesWiseInfo extends StatefulWidget {
  StatesWiseInfo({Key key}) : super(key: key);

  @override
  _StatesWiseInfoState createState() => _StatesWiseInfoState();
}

class _StatesWiseInfoState extends State<StatesWiseInfo> {
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
  String url = "https://api.covid19india.org/state_district_wise.json";
  Future<List<String>> _getData() async {
    var response = await http.get(url);
    Map data = json.decode(response.body);
    // print(data);
    List st = [];
    data.forEach((k,v)=>{
      st.add(v["districtData"])
    });
    // for(int i = 0;i<st.length;i++)
    // {
    // Map el = st[i];
    // el.forEach((k,v)=>{
    //   print(v)
    // });
    // }
    List subDistrict = [];
    Map el = st[0];
    el.forEach((k,v)=>{
      subDistrict.add(v)
    });
      List totalSub = [];
    for(int i=0;i<subDistrict.length;i++)
    {
      List subValue = [];
      Map sub = subDistrict[i];
      sub.forEach((k,v)=>{
        if(k=="active"|| k=="confirmed"|| k=="deceased" || k =="recovered" )
        subValue.add(v)
      });
      totalSub.add(subValue);
    }
    print(totalSub);
    // print(el);
    return stateNameList;
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
                          height: MediaQuery.of(context).size.height * 0.5,
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
                                        : snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListData(
                                        stateName: snapshot.data[index],
                                        death: "",
                                        recovered: "",
                                        active: "",
                                        confirmed: "",
                                      );
                                    });
                              }),
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

class StateObject {
  Object name;

  StateObject(this.name);

  @override
  String toString() {
    return '{ ${this.name} }';
  }
}
