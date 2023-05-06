import 'package:flutter/material.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/questions/views/question_detail.dart';
import 'package:mlrcc/theme/pallete.dart';

class QuestionCard extends StatefulWidget {
  final bool isButton;
  const QuestionCard({Key? key, required this.isButton}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: 243,
      height: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x1e000000),
            blurRadius: 19,
            offset: Offset(0, 14),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
                child: Text("How can world be so dumb?", style: heading1.copyWith(fontSize: 20),textAlign: TextAlign.center,)),
            widget.isButton ? ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionDetail()),
              );
            }, child: Text("View Comments", style: nbSubHeading.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),), style: ElevatedButton.styleFrom(primary: Pallete.accentColor),):SizedBox()
          ],
        ),
      ),
    );
  }
}
