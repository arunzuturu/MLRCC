import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/pposts_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/pposts_modal.dart';

final pPostsDataProvider = StateProvider<List<PPostsModal>?>((ref) => null);

final pPostsControllerProvider =
    StateNotifierProvider<PPostsController, bool>((ref) {
  final pPostsAPI = ref.watch(pPostsAPIProvider);
  return PPostsController(
    ref: ref,
    pPostsAPI: pPostsAPI,
  );
});

class PPostsController extends StateNotifier<bool> {
  final PPostsAPI _pPostsAPI;
  final Ref _ref;
  PPostsController({required PPostsAPI pPostsAPI, required Ref ref})
      : _pPostsAPI = pPostsAPI,
        _ref = ref,
        super(false);

  Future<void> getPPosts(BuildContext context) async {
    state = true;
    final pPosts = await _pPostsAPI.getPPosts();
    pPosts.fold((l) => showSnackBar(context, l.message), (pPosts) {
      // print(pPosts);
      _ref.read(pPostsDataProvider.notifier).update((state) => pPosts);
    });
    state = false;
  }
}
