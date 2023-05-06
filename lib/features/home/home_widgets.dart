import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';

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
           image: CachedNetworkImageProvider("https://via.placeholder.com/350x150"),
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

Widget NoticeBoardCard(size,hash, title, desc)
{
  var selectColor = Pallete.accentColor;
  switch(hash)
  {
    case "#General": {selectColor = hOrange;} break;
    case "#Event": {selectColor = hBlue;} break;
    case "#Placement": {selectColor = hVoilet;} break;
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Text(
                  "${hash.toString()}",
                  style: hashStyle.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              width: size.width*0.24,
              height: size.height*0.03,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: selectColor,
              ),
            ),
          ),
          SizedBox(height: size.height*0.01,),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(title.toString(),style: nbHeading.copyWith(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: size.height*0.01,),
          Padding(
            padding:  EdgeInsets.only(left: 18),
            child: Text(desc.toString(),style: nbSubHeading.copyWith(fontSize: 14),),
          ),

        ],
      ),
      width: size.width*0.88,
      height: size.height*0.16,
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
  );
}

Widget postCard(size, mainImage, profileImage, name)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: size.height * 0.3,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://via.placeholder.com/375x667.png?text=Mobile+Screen+Ratio+Placeholder"), // add mainImage
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Color(0x66393939),height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // add profileImage
                  ),
                  SizedBox(width: size.width*0.02,),
                  Text("Arun", style: nbHeading.copyWith(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 14),), //add Name
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget CommentCard(size, imageUrl, name, text)
{
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // add profileImage
            ),
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kiran", style: nbSubHeading.copyWith(fontWeight: FontWeight.w600, color: Pallete.purpleAccent),),
                Text("Idk Bro do it yourself"), //add text
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.49),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 36.50,
              offset: Offset(0, 11.53),
            ),
          ]
      ),

    ),
  );
}




