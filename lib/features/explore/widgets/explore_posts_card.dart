import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mlrcc/constants/constants.dart';
import 'package:mlrcc/features/explore/views/explore_fullview.dart';

class PostCard extends StatelessWidget {
  final String mainImage;
  final String name;
  final String profileImage;
  const PostCard(
      {super.key,
      required this.mainImage,
      required this.name,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, ExploreFullView.route(mainImage, name, profileImage));
        },
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: CachedNetworkImageProvider(mainImage), // add mainImage
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: const Color(0x66393939),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage:
                            NetworkImage(profileImage), // add profileImage
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      SizedBox(
                        width: size.width * 0.25,
                        child: Text(
                          name,
                          overflow: TextOverflow.fade,
                          style: nbHeading.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
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