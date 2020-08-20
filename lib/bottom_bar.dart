import 'package:flutter/material.dart';
import 'package:ui_challenge_3/colors.dart';
import 'package:ui_challenge_3/custom_extensions.dart';

bool isSelected = false;
Color iconColor = Colors.white;

class MyBottomBar extends StatefulWidget {
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    // setState(() {});
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: 78.00,
      width: 351.00,
      color: Colors.white.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarButton(icon: Icons.house_siding_rounded),
          BottomBarButton(icon: Icons.favorite_outline),
          BottomBarButton(icon: Icons.search),
          BottomBarButton(icon: Icons.shopping_basket),
        ],
      ),
    ).frosted(sigX: 10, sigY: 10, radius: BorderRadius.circular(18.00));
  }
}

class BottomBarButton extends StatefulWidget {
  // final Icons icon;
  final IconData icon;
  BottomBarButton({this.icon});
  @override
  _BottomBarButtonState createState() => _BottomBarButtonState();
}

class _BottomBarButtonState extends State<BottomBarButton> {
  changeState() {
    setState(() {
      isSelected = isSelected ? !isSelected : !isSelected;
    });
  }

  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeState();
      },
      child: Container(
        height: 52.00,
        width: 52.00,
        decoration: BoxDecoration(
          color: isSelected ? theme_yellow : Colors.white.withOpacity(0.1),
        ),
        child: Icon(
          widget.icon,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ).frosted(radius: BorderRadius.circular(12.00)),
    );
  }
}
