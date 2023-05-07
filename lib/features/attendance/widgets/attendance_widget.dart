import 'package:flutter/material.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({
    super.key,
    required this.valueNotifier,
  });

  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    late Color selectedColor;
    late String textTogo;
    var value = valueNotifier.value;
    if (value >= 75) {
      selectedColor = Colors.green;
      textTogo = "Pheew! You are safe";
    } else if (value < 75 && value > 55) {
      selectedColor = Colors.yellow;
      textTogo = "Try Hard! Few more classes";
    } else {
      selectedColor = Colors.red;
      textTogo = "Careful! Might get Detained";
    }
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1e2d3943),
              blurRadius: 31,
              offset: Offset(0, 15),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SimpleCircularProgressBar(
              // backColor: Color(0xffED7D7D),
              progressColors: const [Color(0xff98DE5B), Color(0xff08E1AE)],
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
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
                      decoration: const BoxDecoration(
                        color: Pallete.accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Skipped"),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  textTogo,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: selectedColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
