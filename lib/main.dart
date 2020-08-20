import 'package:flutter/material.dart';

import 'package:ui_challenge_3/custom_extensions.dart';
import 'package:ui_challenge_3/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
