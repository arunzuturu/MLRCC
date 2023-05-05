import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/features/noticeboard/controller/nb_posts_controller.dart';
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
    final nbData = ref.watch(nBPostsDataProvider)!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: 'Notice Board',
                ),
                SizedBox(
                  height: size.height * 0.72,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: nbData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NoticeBoardCard(size, nbData[index].hastag, nbData[index].title,
                            nbData[index].description);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
