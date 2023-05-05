import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/features/home/views/home_view.dart';
import 'package:mlrcc/features/noticeboard/views/notice_board.dart';
import 'package:mlrcc/features/profile/views/user_profile.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../../../constants/ui_constants.dart';

class NavView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NavView(),
      );
  const NavView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavViewState();
}

class _NavViewState extends ConsumerState<NavView> {
  int _currentIndex = 0;
  int _page = 0;
  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }
  List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    _children = [
      HomeView(),
      NoticeBoardView(),
      Container(color: Colors.grey,),
      UserProfileView(),
    ];
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Pallete.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: GNav(
              onTabChange: (int index) {
                setState(() {
                  _currentIndex = index;
                });},
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              duration: const Duration(milliseconds: 500),
              tabBackgroundColor: Pallete.accentColor,
              color: Pallete.accentColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  textStyle: TextStyle(color: Pallete.whiteColor),
                ),
                GButton(
                  icon: LineIcons.pollH,
                  text: 'Notice Board',
                  textStyle: TextStyle(color: Pallete.whiteColor),
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Explore',
                  textStyle: TextStyle(color: Pallete.whiteColor),
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  textStyle:TextStyle(color: Pallete.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
