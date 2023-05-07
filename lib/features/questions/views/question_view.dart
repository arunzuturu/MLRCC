import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/questions/views/question_detail.dart';
import 'package:mlrcc/modals/questions_modal.dart';
import 'package:mlrcc/theme/pallete.dart';

class QuestionCard extends ConsumerStatefulWidget {
  final bool isButton;
  final QuestionsModal question;
  const QuestionCard({Key? key, required this.isButton, required this.question}) : super(key: key);

  @override
  ConsumerState<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends ConsumerState<QuestionCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      height: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Pallete.accentColor, width: 1),

        color: Colors.white,
        
      ),
      
      child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Text(widget.question.question!, style: heading1.copyWith(fontSize: 20),textAlign: TextAlign.center,)),
                widget.isButton ? ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionDetail(
                      question: widget.question,
                    )),
                  );
                }, style: ElevatedButton.styleFrom(backgroundColor: Pallete.accentColor), child: Text("View Comments", style: nbSubHeading.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),),):const SizedBox()
              ],
            ),
          ),
    );
  }
}
