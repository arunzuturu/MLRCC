import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/theme/pallete.dart';

class AddQuestionScreen extends StatefulWidget {

  // final String postId;

  const AddQuestionScreen({Key? key}) : super(key: key);

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController _textEditingController =
  TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
              CustomAppBar(title: "Question"),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter your question...',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.accentColor, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String comment = _textEditingController.text;
                  // Save the comment and go back to previous screen
                  Navigator.pop(context, comment);
                },
                child: Text('Tap to Add'),
                style: ElevatedButton.styleFrom(primary: Pallete.accentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}