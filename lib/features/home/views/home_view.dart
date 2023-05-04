import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/theme/pallete.dart';

import '../../../common/common.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Pallete.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Community',
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: LineIcon.bell(
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: LineIcon.comments(
                          size: 30,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
