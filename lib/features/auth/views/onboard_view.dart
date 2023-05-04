import 'package:flutter/material.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 54,
            top: 260.81,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xffe7eff7),
              ),
              padding: const EdgeInsets.only(
                left: 12,
                right: 11,
                top: 19,
                bottom: 18,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 49,
                    height: 49,
                    child: FlutterLogo(size: 49),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Campus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 415,
                height: 44,
                padding: const EdgeInsets.only(
                  left: 39,
                  right: 26,
                  top: 15,
                  bottom: 11,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "19:02",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 130),
                    Container(
                      width: 18,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 130),
                    Container(
                      width: 26.60,
                      height: 12.50,
                      padding: const EdgeInsets.only(
                        left: 2,
                        right: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20.19,
                            height: 8.65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 54,
            top: 132.10,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 9,
                right: 8,
                top: 14,
                bottom: 11,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    child: FlutterLogo(size: 65),
                  ),
                  SizedBox(height: 5),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Ideas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 54,
            top: 402.38,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 17,
                right: 16,
                top: 16,
                bottom: 18,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48.26,
                    height: 48.26,
                    child: FlutterLogo(size: 48.26335906982422),
                  ),
                  SizedBox(height: 11.80),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Today",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 153.74,
            top: 372.35,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xffe7eff7),
              ),
              padding: const EdgeInsets.only(
                left: 12,
                right: 11,
                top: 13,
                bottom: 17,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    child: FlutterLogo(size: 58),
                  ),
                  SizedBox(height: 7),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Meme",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 253.49,
            top: 406.67,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 13,
                right: 12,
                top: 15,
                bottom: 17,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 57,
                    height: 57,
                    child: FlutterLogo(size: 57),
                  ),
                  SizedBox(height: 5),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Fun",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 153.74,
            top: 242.57,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 9,
                right: 8,
                top: 16,
                bottom: 21,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    child: FlutterLogo(size: 46),
                  ),
                  SizedBox(height: 11),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Organise",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 253.49,
            top: 269.39,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 18,
                right: 16,
                top: 18,
                bottom: 19,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    child: FlutterLogo(size: 48),
                  ),
                  SizedBox(height: 10),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Music",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 153.74,
            top: 101,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xfff6f6f6),
              ),
              padding: const EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
                bottom: 11,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 59,
                    height: 59,
                    child: FlutterLogo(size: 59),
                  ),
                  SizedBox(height: 12),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Chat",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 253.49,
            top: 132.10,
            child: Container(
              width: 81.51,
              height: 110.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.73),
                color: Color(0xffe7eff7),
              ),
              padding: const EdgeInsets.only(
                left: 11,
                right: 10,
                top: 18,
                bottom: 14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 50,
                    child: FlutterLogo(size: 44),
                  ),
                  SizedBox(height: 13),
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      "Connect",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 41,
            top: 568,
            child: Text(
              "Join the minds of MLRIT",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2d3943),
                fontSize: 29.27,
                letterSpacing: 0.15,
              ),
            ),
          ),
          Positioned(
            left: 61.81,
            top: 623.50,
            child: SizedBox(
              width: 265.94,
              height: 92.50,
              child: Text(
                "Welcome to your college app to access all the resources and tools you need for a successful academic journey!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffc4c9cc),
                  fontSize: 18.50,
                  letterSpacing: 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            left: 54,
            top: 739,
            child: Container(
              width: 279,
              height: 66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x992d3943),
                    blurRadius: 23,
                    offset: Offset(0, 6),
                  ),
                ],
                color: Color(0xff2d3945),
              ),
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 22,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 0.10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
