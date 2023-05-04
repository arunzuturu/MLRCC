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
              SemiCircle(),
              SizedBox(
                height: size.height * 0.45,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'MLRIT',
                  style: TextStyle(
                    fontSize: 80,
                    color: Pallete.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'College Connect',
                  style: TextStyle(
                    fontSize: 30,
                    color: Pallete.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        100), // add this line for rounded edges
                  ),
                  backgroundColor: Pallete.greenColor,
                  fixedSize: Size(
                    size.width * 0.7,
                    size.height * 0.07,
                  ),
                  // side: const BorderSide(color: Pallete.greenColor, width: 2.0),
                ),
                onPressed: () {
                  ref
                      .read(authControllerProvider.notifier)
                      .signInWithGoogle(context);
                },
                child: const Text(
                  'Sign in with Google',
                  style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
