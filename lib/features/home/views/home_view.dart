import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/features/home/views/college_view.dart';

import 'package:mlrcc/features/pposts/controllers/pposts_controller.dart';
import 'package:mlrcc/features/user/controller/user_controller.dart';
import 'package:mlrcc/modals/features_modal.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../common/common.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final List<FeaturesModal> features = [
      FeaturesModal(
          title: "Attendance",
          icon: LineIcon.calendarCheck(
            size: 42,
          ),
          onTap: () {
            print(2);
          }),
      FeaturesModal(
          title: "Assignments",
          icon: LineIcon.book(
            size: 42,
          ),
          onTap: () {
            print(3);
          }),
      FeaturesModal(
          title: "Notes",
          icon: LineIcon.bookmark(
            size: 42,
          ),
          onTap: () {}),
      FeaturesModal(
          title: "Events",
          icon: LineIcon.calendar(
            size: 42,
          ),
          onTap: () {}),
      FeaturesModal(
          title: "Placements",
          icon: LineIcon.briefcase(
            size: 42,
          ),
          onTap: () {}),
      FeaturesModal(
          title: "Syllabus",
          icon: LineIcon.book(
            size: 42,
          ),
          onTap: () {}),
    ];
    late ValueNotifier<double> valueNotifier;
    late double value = 45;
    valueNotifier = ValueNotifier(value);
    late var selectedColor;
    late var textTogo;
    if (value >= 75) {
      selectedColor = Colors.green;
      textTogo = "Pheew! You are safe";
    } else if (value < 75 && value > 55) {
      selectedColor = Colors.yellow;
      textTogo = "Try Hard! Few more classes";
    } else {
      selectedColor = Colors.red;
      textTogo = "Class Jana, Detain Hoga";
    }

    final pPostsList = ref.watch(pPostsDataProvider);
    final size = MediaQuery.of(context).size;
    return (pPostsList == null)
        ? const Loader()
        : SafeArea(
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CollegeView()),
                                );
                              },
                              icon: LineIcon.hotel(
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
                                      pPostsList[index].imageURL,
                                      context),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Features",
                          style: largeHeading2.copyWith(fontSize: 20),
                        ),
                      ),
                      GridView.builder(
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              
                            },
                            child: FeaturesWidget(
                              icon: features[index].icon,
                              text: features[index].title,
                            ),
                          );
                        },
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
                                    "${textTogo}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: selectedColor),
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

class FeaturesWidget extends StatelessWidget {
  final Icon? icon;
  final String? text;
  const FeaturesWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Pallete.backgroundColor,
          border: Border.all(color: Pallete.accentColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          Text(
            text!,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
