import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Amazing_Flutter_Login_page.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      home: LoginPage(),
    );
  }));
}
