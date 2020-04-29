import 'package:covid19/counter.dart';
import 'package:covid19/myHeader.dart';
import 'package:covid19/navigationBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'contant.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
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
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int selectedItem = 0;
  String today = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  List worldData = [];
  List indiaData = [];
  String url = "https://covid19.mathdro.id/api/countries/india";
  Future<String> _getData() async{
  List rawListing = [];
    var res = await http.get(url);
    Map data = json.decode(res.body);
    data.forEach((k,v)=>{
      if(k != "lastUpdate")
      rawListing.add(v)});
    for(int i=0;i<rawListing.length;i++){
      Map temp = rawListing[i];
      temp.forEach((k,v)=>{
        if(k == "value")
        indiaData.add(v)});
    }
    return "indiaData";
  }
  //world api
  String worldUrl = "https://covid19.mathdro.id/api/";
Future<String> _getWorldData() async{
  List rawList = [];
    var res = await http.get(worldUrl);
    Map data = json.decode(res.body);
    data.forEach((k,v)=>{
      if(k == "confirmed" || k =="recovered" || k =="deaths")
      rawList.add(v)});
    for(int i=0;i<rawList.length;i++){
      Map temp = rawList[i];
      temp.forEach((k,v)=>{
        if(k == "value")
        worldData.add(v)});
    }
    print(worldData);
    print(indiaData);
    return "worldData";
  }  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Column(
      children: <Widget>[
          MyHeader(imagePath: "assets/icons/Drcorona.svg",topText: "India need you",bottomText: "all stay at home",),
          SizedBox(height: 0,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "India's Overview\n",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ]
                  )
                  ),
                  Spacer(),
                  Text(
                    today,
                    style: TextStyle(
                      color: myPrimaryColor
                    ),
                  )
                ],
              )
            ],
          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12,horizontal:16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,6),
                  blurRadius: 30,
                  color: myShadowColor
                )
              ]
            ),
            
            child: FutureBuilder(
                  future: _getData(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.data == null)
                    return Container(child: Text("Loading.."),);
                    return Container(
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Counter(title: "Infected",color: myPrimaryColor,number: indiaData[0],),
              Counter(title: "Recovered",color: myRecovercolor,number: indiaData[1],),
              Counter(title: "Deaths",color: myDeathColor,number: indiaData[2],),
            ],
            ),
                    );
                  }
                ),
          ),
          SizedBox(height: 8,),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0,),
                child: Text("World Pandemic",style: TextStyle(
                  fontWeight: FontWeight.w600
                ),),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12,horizontal:16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,6),
                  blurRadius: 30,
                  color: myShadowColor
                )
              ]
            ),
            
            child: FutureBuilder(
                  future: _getWorldData(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.data == null)
                    return Container(child: Text("Loading.."),);
                    return Container(
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Counter(title: "Infected",color: myPrimaryColor,number: worldData[0],),
              Counter(title: "Recovered",color: myRecovercolor,number: worldData[1],),
              Counter(title: "Deaths",color: myDeathColor,number: worldData[2],),
            ],
            ),
                    );
                  }
                ),
          ),
      ],
    ),
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
        gettingSelected: 0,
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