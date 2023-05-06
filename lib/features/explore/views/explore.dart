import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/features/explore/controller/explore_controller.dart';
import 'package:mlrcc/features/explore/views/explore_fullview.dart';
import 'package:mlrcc/features/home/home_widgets.dart';
import 'package:mlrcc/theme/pallete.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/app_bar.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    print(pickedFile);
    // Handle the picked image here
  }

  @override
  Widget build(BuildContext context) {
    final explore = ref.watch(exploreDataProvider) ?? [];
    print(explore);
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
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
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take a picture'),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Choose from gallery'),
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),

      ),
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Explore',
              ),
              SizedBox(
                height: size.height * 0.73,
                width: size.width,
                child: LiquidPullToRefresh(
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              ExploreFullView.route(
                                  explore[index].imageLink!,
                                  explore[index].name!,
                                  explore[index].photoUrl!)
                              );
                        },
                        child: PostCard(
                          mainImage: explore[index].imageLink!,
                          profileImage: explore[index].photoUrl!,
                          name: explore[index].name!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
