import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'contant.dart';

class MyHeader extends StatelessWidget {
  final String topText;
  final String bottomText;
  final String imagePath;
  
  const MyHeader({
    Key key,
    this.topText,
    this.bottomText,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCliper(),
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 10, right: 20),
        height: MediaQuery.of(context).size.height*0.4,
        // height: (MediaQuery.of(context).size.height<641)?MediaQuery.of(context).size.height*0.41:MediaQuery.of(context).size.height*0.41,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[600], Colors.indigo[600]]),
            image:
                DecorationImage(image: AssetImage("assets/images/virus.png"))),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/icons/menu.svg")),
            SizedBox(height: 20),
            Expanded(
                child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  imagePath,
                  width: 230,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                    top: 20,
                    left: 190,
                    child: Text(
                      "$topText \n$bottomText",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (MediaQuery.of(context).size.width<362)?MediaQuery.of(context).size.width*0.046:MediaQuery.of(context).size.width*0.052,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Container()
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
