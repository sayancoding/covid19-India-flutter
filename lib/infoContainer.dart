import 'package:covid19/contant.dart';
import 'package:covid19/myHeader.dart';
import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            MyHeader(
              imagePath: "assets/icons/coronadr.svg",
              topText: "Get to know",
              bottomText: "about COVID 19",
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Symptoms",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                        child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(imgPath: "assets/images/headache.png",text: "Headache",),
                    SymptomCard(imgPath: "assets/images/caugh.png",text: "Caugh",),
                    SymptomCard(imgPath: "assets/images/fever.png",text: "Fever",)
                  ],
                ),
              ),
            ),
            SizedBox(height:20),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Precautions",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height:10),
            Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                PrecautionCard(imagePath: "assets/images/wear_mask.png",text: "Wear face mask",),
                PrecautionCard(imagePath: "assets/images/wear_hands.png",text: "Wash hand often ",),
                  ],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}

class PrecautionCard extends StatelessWidget {
  final String imagePath;
  final String text;
  
  const PrecautionCard({
    Key key, this.imagePath, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: myShadowColor
            )]
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(image: AssetImage(imagePath)),
              ),
              Positioned(
                top: 10,
                left: 160,
                child: Column(
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14
                      ),
                    ),
                    Text(
                      "Cover your nose and \nmouth with your bent \nelbow or a tissue when \nyou cough or sneeze.",
                      style: TextStyle(
                        fontSize: 10
                      ),
                    )
                  ],
                ),
                )
            ],
          ),
        )
      ],
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String imgPath;
  final String text;

  const SymptomCard({
    Key key, this.imgPath, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: 114,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: myShadowColor
        )],
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            child: Image.asset(imgPath,fit: BoxFit.cover,)
          ),
          Text(text,
          style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
