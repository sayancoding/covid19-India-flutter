import 'package:covid19/counter.dart';
import 'package:covid19/myHeader.dart';
import 'package:covid19/navigationBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'contant.dart';

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
  // const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        MyHeader(imagePath: "assets/icons/Drcorona.svg",topText: "All you need",bottomText: "is stay at home",),
        Container(
          margin:EdgeInsets.symmetric(horizontal: 20) ,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.grey[300]
            )
          ),
          child: Row(children: <Widget>[
            SvgPicture.asset("assets/icons/maps-and-flags.svg"),
            SizedBox(width: 20,),
            Expanded(child: DropdownButton(
              isExpanded: true,
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      underline: SizedBox(),
                      value: "india",
              items: ["india","USA","Canada"]
              .map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value)
              );
            }).toList(), onChanged: (value){},)
            )
          ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Case Updated\n",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16
                      ),
                    ),
                    TextSpan(
                      text:"Based On 12th april,2020",
                      style: TextStyle(
                        color: Colors.grey
                      )
                    )
                  ]
                )
                ),
                Spacer(),
                Text(
                  "See more",
                  style: TextStyle(
                    color: myPrimaryColor
                  ),
                )
              ],
            )
          ],
        ),
        ),
        SizedBox(height:12),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Counter(title: "Infected",color: myPrimaryColor,number: 12754,),
            Counter(title: "Recovered",color: myRecovercolor,number: 1514,),
            Counter(title: "Deaths",color: myDeathColor,number: 423,),
          ],
          ),
        ),
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
        gettingSelected: 0,
    ),
    );
  }
}