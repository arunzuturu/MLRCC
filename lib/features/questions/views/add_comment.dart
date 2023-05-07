import 'package:flutter/material.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/theme/pallete.dart';

class AddCommentScreen extends StatefulWidget {
  final String postId;

  const AddCommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back)),
              const CustomAppBar(title: "Comment"),
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your comment...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.accentColor, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String comment = _textEditingController.text;
                  // Save the comment and go back to previous screen
                  Navigator.pop(context, comment);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Pallete.accentColor),
                child: const Text('Tap to comment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
