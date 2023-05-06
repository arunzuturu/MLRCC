import 'package:flutter/material.dart';

class FeaturesModal {
  String title;
  Icon icon;
  final void Function()? onTap;

  FeaturesModal({required this.title, required this.icon, required this.onTap});
}
