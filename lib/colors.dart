import 'package:flutter/material.dart';

Color bg_color = Color(0xff313136);
Color theme_yellow = Color(0xffffd35a);
Gradient card_gradient_yellow = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [const Color(0xff454648), const Color(0xff494a45)],
  stops: [0.0, 1.0],
);
Gradient card_gradient_pink = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [const Color(0xff454648), const Color(0xff7b6368), const Color(0xff7d5b62)],
  stops: [0.0, 0.94, 1.0],
);

Color tabBar_btn_notSelected = Color(0xff4c4e55);
Gradient small_card_grad_white = LinearGradient(
  begin: Alignment(-0.93, 0.91),
  end: Alignment(0.89, -0.91),
  colors: [const Color(0xff4f4f50), const Color(0xff757575)],
  stops: [0.0, 1.0],
);
Gradient small_card_grad_blue = LinearGradient(
  begin: Alignment(0.94, -0.88),
  end: Alignment(-0.92, 0.93),
  colors: [const Color(0xff465363), const Color(0xff3e4045)],
  stops: [0.0, 1.0],
);
