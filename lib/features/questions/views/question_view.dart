import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/questions/controller/questions_controller.dart';
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
    final size = MediaQuery.of(context).size;
    // final questionsList = ref.watch(questionsDataProvider)??[];
    return Container(
      width: 243,
      height: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Pallete.accentColor, width: 1),
        boxShadow: const [
          // BoxShadow(
          //   color: Color(0x1e000000),
          //   blurRadius: 19,
          //   offset: Offset(0, 14),
          // ),
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
                    child: Text(widget.question.question!, style: heading1.copyWith(fontSize: 20),textAlign: TextAlign.center,)),
                widget.isButton ? ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionDetail(
                      question: widget.question,
                    )),
                  );
                }, child: Text("View Comments", style: nbSubHeading.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),), style: ElevatedButton.styleFrom(primary: Pallete.accentColor),):SizedBox()
              ],
            ),
          ),
    );
  }
}
