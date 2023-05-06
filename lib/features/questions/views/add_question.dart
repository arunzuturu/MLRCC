import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/theme/pallete.dart';

class AddQuestionView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AddQuestionView(),
      );
  const AddQuestionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddQuestionViewState();
}

class _AddQuestionViewState extends ConsumerState<AddQuestionView> {
  final TextEditingController _textEditingController = TextEditingController();

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
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.greyColor,
              ),
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
