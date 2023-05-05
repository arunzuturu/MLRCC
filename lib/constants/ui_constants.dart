import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/pallete.dart';

class UIConstants {
  static List<Widget> bottomTabBarPages = [
    const Text('Home Screen'),
    const Text('Search Screen'),
    const Text('Notification Screen'),
    const Text('Profile'),
  ];

  static List<DropdownMenuItem> branchDetails = [
    const DropdownMenuItem(
      value: 'Enter your branch',
      child: Text('Enter your branch'),
    ),
    const DropdownMenuItem(
      value: 'CSE',
      child: Text('CSE'),
    ),
    const DropdownMenuItem(
      value: 'ECE',
      child: Text('ECE'),
    ),
    const DropdownMenuItem(
      value: 'EEE',
      child: Text('EEE'),
    ),
    const DropdownMenuItem(
      value: 'CIVIL',
      child: Text('CIVIL'),
    ),
    const DropdownMenuItem(
      value: 'MECH',
      child: Text('MECH'),
    ),
    const DropdownMenuItem(
      value: 'IT',
      child: Text('IT'),
    ),
    const DropdownMenuItem(
      value: 'MBA',
      child: Text('MBA'),
    ),
    const DropdownMenuItem(
      value: 'MCA',
      child: Text('MCA'),
    ),
    const DropdownMenuItem(
      value: 'CSIT',
      child: Text('CSIT'),
    ),
    const DropdownMenuItem(
      value: 'AIML',
      child: Text('AIML'),
    ),
    const DropdownMenuItem(
      value: 'CSE AI&ML',
      child: Text('CSE AI&ML'),
    ),
    const DropdownMenuItem(
      value: 'CS DS',
      child: Text('CS DS'),
    ),
    const DropdownMenuItem(
      value: 'CSC',
      child: Text('CSC'),
    ),
  ];
  
  //create a list of semesters
  static List<DropdownMenuItem> semesterDetails = [
    const DropdownMenuItem(
      value: 'Enter your semester',
      child: Text('Enter your semester'),
    ),
    const DropdownMenuItem(
      value: 1,
      child: Text('1'),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text('2'),
    ),
  ];

  // create a list of years
  static List<DropdownMenuItem> yearDetails = [
    const DropdownMenuItem(
      value: 1,
      child: Text('1'),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text('2'),
    ),
    const DropdownMenuItem(
      value: 3,
      child: Text('3'),
    ),
    const DropdownMenuItem(
      value: 4,
      child: Text('4'),
    ),
  ];
  // create a list of sections
  static List<DropdownMenuItem> sectionDetails = [
    const DropdownMenuItem(
      value: 'Enter your section',
      child: Text('Enter your section'),
    ),
    const DropdownMenuItem(
      value: 'A',
      child: Text('A'),
    ),
    const DropdownMenuItem(
      value: 'B',
      child: Text('B'),
    ),
    const DropdownMenuItem(
      value: 'C',
      child: Text('C'),
    ),
    const DropdownMenuItem(
      value: 'D',
      child: Text('D'),
    ),
  ];
}
TextStyle largeHeading = const TextStyle(
      color: Pallete.accentColor,
      fontSize: 54,
      letterSpacing: 0.27,
      fontWeight: FontWeight.w600);
  TextStyle largeHeading2 = const TextStyle(
      color: Pallete.accentColor,
      fontSize: 24,
      letterSpacing: 0.27,
      fontWeight: FontWeight.w600);

  TextStyle subHeading = const TextStyle(
    color: Color(0xffC4C9CC),
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );
TextStyle hashStyle = const TextStyle(
  color: Pallete.whiteColor,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);
  TextStyle heading1 = const TextStyle(
    color: Pallete.accentColor,
    fontSize: 34,
    fontWeight: FontWeight.w600,
  );
  TextStyle nbHeading = const TextStyle(
    color: Color(0xff5c6b77),
    fontSize: 24,
    letterSpacing: 0.12,
  );
  TextStyle nbSubHeading = const TextStyle(
    color: Color(0xffc4c9cc),
    fontSize: 18.50,
    letterSpacing: 0.09,
  );
  const hVoilet = Color(0xff6853FE);
  const hOrange = Color(0xffFE8653);
  const hBlue = Color(0xff538DFE);
