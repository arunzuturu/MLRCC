import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/features/pposts/controllers/pposts_controller.dart';
import 'package:mlrcc/features/user/controller/user_controller.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../common/common.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    late ValueNotifier<double> valueNotifier;
    valueNotifier = ValueNotifier(75.0);
    final pPostsList = ref.watch(pPostsDataProvider);
    final size = MediaQuery.of(context).size;
    return (pPostsList == null)?const Loader():SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: 'Community',
                  actions: [
                    IconButton(
                        onPressed: () {
                          ref.read(userControllerProvider.notifier).getUserData(
                              context: context,
                              uid: 'XQhLZh2niIffSxz7GmyTR8Jlxki1');
                        },
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Top Placements",
                    style: largeHeading2.copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: size.height * 0.28,
                    child: ListView.builder(
                        itemCount: pPostsList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 14, top: 10, right: 10),
                            child: contentCard(
                                size,
                                pPostsList[index].title,
                                pPostsList[index].text,
                                pPostsList[index].link,
                                context),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Performance Report",
                    style: largeHeading2.copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SimpleCircularProgressBar(
                          // backColor: Color(0xffED7D7D),
                          progressColors: [
                            Color(0xff98DE5B),
                            Color(0xff08E1AE)
                          ],
                          animationDuration: 2,
                          valueNotifier: valueNotifier,
                          mergeMode: true,
                          onGetText: (double value) {
                            return Text(
                              '${value.toInt()}%',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Pallete.accentColor,
                              ),
                            );
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: new BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Attended"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.001,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: new BoxDecoration(
                                    color: Pallete.accentColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Skipped"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Pheew !  You are safe",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            )
                          ],
                        )
                      ],
                    ),
                    width: size.width * 0.9,
                    height: size.height * 0.23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1e2d3943),
                          blurRadius: 31,
                          offset: Offset(0, 15),
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
