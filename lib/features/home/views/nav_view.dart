import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/ui_constants.dart';

class NavView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NavView(),
      );
  const NavView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<NavView> {
  int _page = 0;
  final appbar = UIConstants.appBar();
  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
    );
  }
}
