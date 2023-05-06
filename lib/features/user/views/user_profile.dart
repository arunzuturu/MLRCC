import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/questions/views/question_view.dart';
import 'package:mlrcc/theme/pallete.dart';

import '../../../common/common.dart';

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});

  @override
  ConsumerState<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  
  @override
  Widget build(BuildContext context) {
    final appBar = CustomAppBar(
    title: 'Profile',
    actions: [
      IconButton(
        icon: const Icon(LineIcons.userEdit),
        onPressed: () {
          ref.read(authControllerProvider.notifier).signOut();
        },
      )
    ],
  );
    final size = MediaQuery.of(context).size;
    print(DateTime.now());
    // final user = ref.watch(userDataProvider);
    var name = "Tanishq Agarwal";
    var email = "tanishqagarwal@gmail.com";
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              appBar,
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Pallete.greyColor,
                      radius: 50,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: largeHeading2,
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: SectionChip(
                    title: '# Time Table',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              // Card(
              //   elevation: 20,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(1000),
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(100),
              //       color: Pallete.greyColor,
              //     ),
              //     width: size.width * 0.9,
              //     child: CachedNetworkImage(
              //       imageUrl: "",
              //       placeholder: (context, url) => CircularProgressIndicator(),
              //       errorWidget: (context, url, error) => Icon(Icons.error),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: SectionChip(
                    title: '# My Questions',
                    backgroundColor: Pallete.purpleAccent,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.03,),
              QuestionCard(isButton: true,)
            ],
          ),
        )),
      ),
    );
  }
}
