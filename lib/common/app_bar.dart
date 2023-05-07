import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: heading1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: actions ?? [],
        ),
      ],
    );
  }
}