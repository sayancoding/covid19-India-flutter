import 'package:covid19/contant.dart';
import 'package:covid19/infoContainer.dart';
import 'package:covid19/myHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'counter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: myBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(body1: TextStyle(color: myBodyTextColor))),
      home: InfoContent(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
         child: Row(
           children: <Widget>[
             Text(
               "Spread Out The World",
               style: TextStyle(
                 color: Colors.black.withOpacity(0.5),
                 fontWeight: FontWeight.w700,
                 fontSize: 14
               ),
            ),
            Spacer(),
             Text(
               "See more",
               style: TextStyle(
                 fontWeight: FontWeight.w600,
                 color: Colors.blue,
                 fontSize: 14
               ),
            ),
           ],
         ), 
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: myShadowColor
              )
            ]
          ),
          child: Image.asset("assets/images/map.png",
            // fit: BoxFit.,          
          ),
        )
      ],
    )
    );
  }
}



