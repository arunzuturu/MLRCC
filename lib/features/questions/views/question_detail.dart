import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/features/questions/views/add_comment.dart';
import 'package:mlrcc/features/questions/views/question_view.dart';
import 'package:mlrcc/theme/pallete.dart';

class QuestionDetail extends StatefulWidget {
  const QuestionDetail({Key? key}) : super(key: key);

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  TextEditingController  _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCommentScreen(postId: "!")),
          );
        },
        child: Icon(Icons.add_comment),
      ),
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: "Question"),
                Center(child: QuestionCard(isButton: false,)),
                SizedBox(height: 50,),
                Text("Comments", style: largeHeading2,),
                SizedBox(
                  height: size.height * 0.47,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return CommentCard(size, "", "", "");
                      }),
                ),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
