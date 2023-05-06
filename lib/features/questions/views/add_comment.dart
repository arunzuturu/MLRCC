import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Add Comment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your comment...',
                border: OutlineInputBorder(),
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
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
