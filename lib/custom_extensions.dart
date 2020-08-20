import 'dart:ui';
import 'package:flutter/material.dart';

//

extension TextExtension on String {
  // Card Heading
  makeTextCH({Color color = Colors.white, bool centered = false}) {
    return Text(this,
        style: TextStyle(
          fontFamily: "Segoe UI",
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: Color(0xffffffff),
        ));
  }

  // Card Secondary Heading
  makeTextCS({Color color = Colors.white, bool centered = false}) {
    return Text(this,
        style: TextStyle(
          fontFamily: "Segoe UI",
          fontSize: 20,
          color: Color(0xff6d6d6d),
        ));
  }

  // Medicine Price
  makeTextCardPrice({Color color = Colors.white, bool centered = false}) {
    return Text(this,
        style: TextStyle(
          fontFamily: "Segoe UI",
          fontWeight: FontWeight.w700,
          fontSize: 28,
          color: Color(0xffffd35a),
        ));
  }

  // Normal H1 Text
  makeTextH1({Color color = Colors.white, bool centered = false}) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'SF Mono',
      ),
    );
  }

  //Small card text
  makeTextSmallCard({Color color = Colors.white, bool centered = false}) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 19,
        fontFamily: 'SF Mono',
      ),
    );
  }
}

// Widget extensions here --
extension WidgetModifier on Widget {
  // all extensions here
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(20)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  //
  Widget expanded() {
    return Expanded(
      child: this,
    );
  }

  //
  Widget borderRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  //
  Widget align(Alignment alignment) {
    return Align(
      child: this,
      alignment: alignment,
    );
  }

  //
  Widget hero(String tag) {
    return Hero(
      tag: tag,
      child: this,
    );
  }

  //
  Widget centered() {
    return Center(
      child: this,
    );
  }
  //

  //
  Widget frosted({double sigX, double sigY, BorderRadiusGeometry radius}) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigX ?? 15,
          sigmaY: sigY ?? 15,
        ),
        child: this,
      ),
    );
  }
  //
//

}
