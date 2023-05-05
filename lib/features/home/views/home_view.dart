import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../common/common.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late ValueNotifier<double> valueNotifier;
    valueNotifier = ValueNotifier(75.0);


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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Top Placements", style: largeHeading2.copyWith(fontSize: 20),),
                ),
                Container(
                  height: size.height*0.28,
                  child: Swiper(
                    autoplay: true,
                    autoplayDelay: 4000,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 10),
                        child:contentCard(size, "hey", "yo", "", context),
                      );
                    },
                    viewportFraction: 0.85,
                    scale: 0.9,
                    itemCount: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Performance Report", style: largeHeading2.copyWith(fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SimpleCircularProgressBar(
                          // backColor: Color(0xffED7D7D),
                          progressColors: [Color(0xff98DE5B), Color(0xff08E1AE)],
                          animationDuration: 4,
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
                            SizedBox(height: size.height*0.001,),
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
                            SizedBox(height: size.height*0.02,),
                            Text("Pheew !  You are safe", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),)
                          ],
                        )

                      ],
                    ),
                    width: size.width*0.9,
                    height: size.height*0.23,
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
