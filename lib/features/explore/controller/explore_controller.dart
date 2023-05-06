import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/explore_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/explore_modal.dart';

/// A state provider that holds the list of explore posts.
final exploreDataProvider = StateProvider<List<ExploreModal>?>((ref) => null);

/// A state notifier provider that manages state for the Explore screen.
final exploreControllerProvider =
    StateNotifierProvider<ExploreController, bool>((ref) {
  return ExploreController(exploreAPI: ref.watch(exploreAPIProvider), ref: ref);
});

/// A state notifier that manages state for the Explore screen.
class ExploreController extends StateNotifier<bool> {
  final Ref _ref;
  final ExploreAPI _exploreAPI;

  /// Constructs an instance of [ExploreController].
  ExploreController({required ExploreAPI exploreAPI, required Ref ref})
      : _exploreAPI = exploreAPI,
        _ref = ref,
        super(false);

  /// Fetches explore posts from the API and updates the state.
  void getExplorePosts(BuildContext context) async {
    state = true;
    final pPosts = await _exploreAPI.getPosts();
    pPosts.fold(
      (l) => showSnackBar(context, l.message),
      (explore) => _ref.read(exploreDataProvider.notifier).update((state) => explore),
    );
    state = false;
  }

  /// Creates a new explore post and updates the state.
  void createPost({
    required BuildContext context,
    required File image,
    required String photoUrl,
    required String name,
  }) async {
    state = true;
    final res = await _exploreAPI.createPosts(name, image, photoUrl);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (_) => getExplorePosts(context),
    );
  }
}
