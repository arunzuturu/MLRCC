import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mlrcc/common/common.dart';
import 'package:mlrcc/features/explore/controller/explore_controller.dart';
import 'package:mlrcc/features/explore/widgets/explore_posts_card.dart';
import 'package:mlrcc/features/user/controller/user_controller.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:image_picker/image_picker.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  Future<void> _pickImage(
      ImageSource source, String photoUrl, String name) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    File file = File(pickedFile!.path);
    createExplorePost(image: file, photoUrl: photoUrl, name: name);
  }

  void createExplorePost({
    required File image,
    required String photoUrl,
    required String name,
  }) {
    ref.read(exploreControllerProvider.notifier).createPost(
        context: context, image: image, photoUrl: photoUrl, name: name);
  }

  @override
  Widget build(BuildContext context) {
    final explore = ref.watch(exploreDataProvider) ?? [];
    final loader = ref.watch(exploreControllerProvider);
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final user = ref.watch(userDataProvider)!;
    return (loader)?const Loader():Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.accentColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a picture'),
                    onTap: () {
                      _pickImage(
                          ImageSource.camera, user.imageUrl!, user.name!);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Choose from gallery'),
                    onTap: () {
                      _pickImage(
                          ImageSource.gallery, user.imageUrl!, user.name!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  title: 'Explore',
                ),
                SizedBox(
                  height: size.height * 0.73,
                  width: size.width,
                  child: LiquidPullToRefresh(
                    color: Pallete.greyColor,
                    onRefresh: () async {
                      ref
                          .watch(exploreControllerProvider.notifier)
                          .getExplorePosts(context);
                    },
                    child: GridView.builder(
                      itemCount: explore.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.65,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3),
                      itemBuilder: (BuildContext context, int index) {
                        return PostCard(
                          mainImage: explore[index].imageLink!,
                          profileImage: explore[index].photoUrl!,
                          name: explore[index].name!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
