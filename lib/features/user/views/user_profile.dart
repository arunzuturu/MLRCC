import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/auth/controller/auth_controller.dart';
import 'package:mlrcc/features/questions/controller/questions_controller.dart';
import 'package:mlrcc/features/questions/views/question_view.dart';
import 'package:mlrcc/features/user/controller/user_controller.dart';
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
    final user = ref.watch(userDataProvider)!;
    void getImage() async {}
    final timeTableUrl =
        "https://storage.googleapis.com/mlrcc-e954a.appspot.com/timetable/1683336487380.png?GoogleAccessId=firebase-adminsdk-ztle0%40mlrcc-e954a.iam.gserviceaccount.com&Expires=16447017600&Signature=dsDUcqxYrsVLynDJGFd2DC%2BbxQBEDqow%2BOTbeqRhdOy2o2FVngdJyOoD4gaCjsLdn9vdDuI7HZ6usr64hVf8Ho7GF4eVz2peAWF8E9%2B%2Byyy5w5ZrsffJL6XMuucB2tL%2Beo%2FYh%2B6zfAf9lg%2BM3DsAb5DdffggsAQWMjjjN5vtR3Jlk3c2Umn9t9y0YpW6QZRocQv8pEAKDYKUBG4TkDkNNvBNnXP7XnLTAsJ%2F5r0oUe913mcQrGggAklGzHdZlbqOxV6t4D6y0Hxel28YL9nWYXaVc6n4Eu%2Bk4h5VRS80r0lqEh23iYl7u7PQvNBfL7M7r23pFjWSeHYffnq6T5hA6A%3D%3D";
    @override
    void initState() {
      super.initState();
      getImage();
    }

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
    var name = user.name!.split(' ')[1];
    var email = user.email!;
    final question = ref.watch(questionsDataProvider) ?? [];
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                        radius: 40,
                        backgroundColor: Pallete.greyColor,
                        foregroundImage: NetworkImage(
                          user.imageUrl!,
                        ),
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
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Pallete.greyColor,
                    ),
                    width: size.width * 0.9,
                    child: CachedNetworkImage(
                      imageUrl: timeTableUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
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
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.9,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: question.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 243,
                              height: 160,
                              child: QuestionCard(
                                isButton: true,
                                question: question[i],
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
