import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/nb_posts_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/nbposts_modal.dart';

final nBPostsDataProvider = StateProvider<List<NBPostsModal>?>((ref) => null);

final nBPostsControllerProvider = StateNotifierProvider((ref) {
  return NBPostsController(
    ref.watch(nBPostsAPIProvider),
    ref,
  );
});

class NBPostsController extends StateNotifier<bool> {
  final NBPostsAPI _nBPostsAPI;
  final Ref _ref;
  NBPostsController(
    NBPostsAPI nbPostsAPI,
    Ref ref,
  )   : _nBPostsAPI = nbPostsAPI,
        _ref = ref,
        super(false);

  Future<void> getNBPosts(BuildContext context) async {
    state = true;
    var res = await _nBPostsAPI.getNBPosts();
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      _ref.read(nBPostsDataProvider.notifier).update((state) => r);
    });
  }
}
