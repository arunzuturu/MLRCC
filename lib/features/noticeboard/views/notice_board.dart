import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/theme/pallete.dart';

import '../../../common/app_bar.dart';

class NoticeBoardView extends ConsumerStatefulWidget {
  const NoticeBoardView({Key? key}) : super(key: key);

  @override
  ConsumerState<NoticeBoardView> createState() => _NoticeBoardViewState();
}

class _NoticeBoardViewState extends ConsumerState<NoticeBoardView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Notice Board',
              ),
          SizedBox(
            height: size.height*0.72,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return NoticeBoardCard(size, "General", "New Circular", "Batch - A Circular Released");
                }),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
