import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/explore_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/explore_modal.dart';

final exploreDataProvider = StateProvider<List<ExploreModal>?>((ref) => null);

final exploreControllerProvider =
    StateNotifierProvider<ExploreController, bool>((ref) {
  return ExploreController(exploreAPI: ref.watch(exploreAPIProvider), ref: ref);
});

class ExploreController extends StateNotifier<bool> {
  final Ref _ref;
  final ExploreAPI _exploreAPI;
  ExploreController({required ExploreAPI exploreAPI, required Ref ref})
      : _exploreAPI = exploreAPI,
        _ref = ref,
        super(false);

  void getExplorePosts(context) async {
    state = true;
    final pPosts = await _exploreAPI.getExplorePosts();
    pPosts.fold((l) => showSnackBar(context, l.message), (explore) {
      print(explore);
      _ref.read(exploreDataProvider.notifier).update((state) => explore);
    });
    state = false;
  }

  void addExplorePosts(context) async {
    state = true;
    final pPosts = await _exploreAPI.getExplorePosts();
  }
}
