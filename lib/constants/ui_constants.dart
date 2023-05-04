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
