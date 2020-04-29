import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onTapBar;
  final int gettingSelected; 
  AnimatedBottomBar(
      {Key key,
      this.barItems,
      this.animationDuration = const Duration(milliseconds: 500), this.onTapBar, this.gettingSelected})
      : super(key: key);

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with TickerProviderStateMixin {
  int selectedItem = 0;
  @override
  void initState() {
    setState(() {
      selectedItem = widget.gettingSelected;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 18.0, top: 18.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItem = new List();
    BarItem item = new BarItem();
    for (int i = 0; i < widget.barItems.length; i++) {
      bool isSelected = (selectedItem == i);
      item = widget.barItems[i];
      _barItem.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            if(this.selectedItem !=i){
            this.selectedItem = i;
            widget.onTapBar(this.selectedItem);
          print(selectedItem);
          if(selectedItem == 0){
          Navigator.pushNamed(context, '/');
          }
          if(selectedItem == 1){
            Navigator.pushNamed(context, '/statewise');
          }
          if(selectedItem == 2){
            Navigator.pushNamed(context, '/precautions');
          }
            }
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8.0),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
            color: isSelected ? item.color.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Row(children: <Widget>[
            Icon(
              item.iconData,
              color: isSelected? item.color : Colors.grey[700],
              size: 26,
            ),
            SizedBox(width: 4),
            AnimatedSize(
              duration: widget.animationDuration,
              curve: Curves.easeInOut,
              vsync: this,
                          child: Text(
                isSelected ? item.text : "",
                style: TextStyle(
                    color: isSelected? item.color : Colors.black, 
                    fontWeight: FontWeight.w600, fontSize: 16.0),
              ),
            )
          ]),
        ),
      ));
    }
    return _barItem;
  }
}

class BarItem {
  String text;
  IconData iconData;
  Color color;
  BarItem({this.text, this.iconData, this.color});
}
