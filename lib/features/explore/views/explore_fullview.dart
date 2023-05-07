import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreFullView extends ConsumerStatefulWidget {
  final String image;
  final String photoUrl;
  final String text;
  static route(image,text,photoUrl) => MaterialPageRoute(
        builder: (context) =>  ExploreFullView(
          image: image,
          text: text,
          photoUrl: photoUrl,
        ),
      );
  const ExploreFullView({super.key, required this.image, required this.text, required this.photoUrl});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExploreFullViewState();
}

class _ExploreFullViewState extends ConsumerState<ExploreFullView> {
  @override
  Widget build(BuildContext context) {
    final image = widget.image;
    final text = widget.text;
    final photoUrl = widget.photoUrl;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
            imageUrl: image),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: CachedNetworkImageProvider(photoUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      )),
    );
  }
}
