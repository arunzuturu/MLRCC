import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/auth/widgets/semi_circle.dart';
import 'package:mlrcc/theme/pallete.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [  
              Container(

              ),
              Text('MLR College Connect',
                  style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
    );
  }
}
