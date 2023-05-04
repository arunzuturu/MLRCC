import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/theme/pallete.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    signInWithGoogle() {
       ref.read(authControllerProvider.notifier).signInWithGoogle(context);
    }

    final size = MediaQuery.of(context).size;
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Pallete.whiteColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/login_page_gif.gif'),
              Container(),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width * 0.1),
                  child: SizedBox(
                    height: size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: largeHeading,
                        ),
                        Text(
                          'You have been missed!',
                          style: largeHeading2,
                        ),
                        Text(
                          'Login to explore options',
                          style: subHeading,
                        ),
                        Spacer(),
                        
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Pallete.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(size.width * 0.7, size.height * 0.07),
                        ),
                        onPressed: signInWithGoogle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/google_icon.png', height: 20, width: 20,	),

                            Text('Login with Google', style: TextStyle(fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
