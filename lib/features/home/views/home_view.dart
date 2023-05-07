import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/attendance/controllers/attendance_controller.dart';
import 'package:mlrcc/features/attendance/widgets/attendance_widget.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/features/home/views/college_view.dart';

import 'package:mlrcc/features/pposts/controllers/pposts_controller.dart';
import 'package:mlrcc/theme/pallete.dart';
import '../../../common/common.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    late ValueNotifier<double> valueNotifier;
    final attendanceProvider = ref.watch(attendanceDataProvider);
    if (attendanceProvider == null) {
      valueNotifier = ValueNotifier(0);
    } else{
    valueNotifier = ValueNotifier(attendanceProvider.attendance!.toDouble());
  }
    final pPostsList = ref.watch(pPostsDataProvider);
    final size = MediaQuery.of(context).size;
    return (pPostsList == null || attendanceProvider == null)
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
                                      builder: (context) => const CollegeView()),
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
                          "Latest Feed",
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
                          "Performance Report",
                          style: largeHeading2.copyWith(fontSize: 20),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: SectionChip(title: '#Attendance'),
                      ),
                      AttendanceWidget(
                        valueNotifier: valueNotifier,
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
    this.text,
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
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
