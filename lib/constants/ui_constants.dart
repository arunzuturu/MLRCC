import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      // title: SvgPicture.asset(
      //   color: Pallete.greenColor,
      //   height: 30,
      // ),
      centerTitle: true,
    );
  }
  static List<Widget> bottomTabBarPages = [
    const Text('Home Screen'),
    const Text('Search Screen'),
    const Text('Notification Screen'),
    const Text ('Profile'),
  ];
}

TextStyle LargeHeading = new TextStyle(
  color: Pallete.accentColor,
    fontSize: 54,
    letterSpacing: 0.27,
  fontWeight: FontWeight.w600
);
TextStyle LargeHeading2 = new TextStyle(
    color: Pallete.accentColor,
    fontSize: 24,
    letterSpacing: 0.27,
    fontWeight: FontWeight.w600
);
TextStyle subHeading = new TextStyle(
  color: Color(0xffC4C9CC),
  fontSize: 18,
  fontWeight: FontWeight.w300,
);
TextStyle Heading1 = new TextStyle(
  color: Pallete.accentColor,
  fontSize: 34,
  fontWeight: FontWeight.w600,
);
