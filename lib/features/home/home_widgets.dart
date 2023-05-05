import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'dart:math' as math;

Widget contentCard(size,title,text,link,context) {

  return Padding(
    padding: const EdgeInsets.only(left: 4,right: 4, bottom: 10,top: 15),
    child: Container(
      width: size.width * 0.85,
      height: size.height * 0.21,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 0,
              blurRadius: 16.0,
              offset: Offset(0,11)
          )
        ],
        borderRadius: BorderRadius.circular(12),
       image: DecorationImage(
         fit: BoxFit.fill,
           image: NetworkImage("https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
       ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: size.height*0.11,),
                SizedBox(
                  height: size.height*0.04,
                  width: size.width*0.5,
                  child: AutoSizeText(
                    title,
                    style: heading1.copyWith(color: Pallete.whiteColor),
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(
                  height: size.height*0.05,
                  width: size.width*0.5,
                  child: AutoSizeText(
                    text,
                    style: subHeading.copyWith(color: Pallete.whiteColor),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}







