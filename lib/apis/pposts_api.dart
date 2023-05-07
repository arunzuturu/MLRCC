import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/pposts_modal.dart';

final pPostsAPIProvider = Provider((ref) => PPostsAPI());

final dio = Dio();

abstract class IPPostsAPI {
  FutureEither<List<PPostsModal>> getPPosts();
}

class PPostsAPI implements IPPostsAPI {
  @override
  FutureEither<List<PPostsModal>> getPPosts() async {
    try {
      final roadmapData = await dio.get('${apiUrl}getppost');
      List<PPostsModal> pPosts = [];
      roadmapData.data['data'].forEach((element) {
        pPosts.add(PPostsModal.fromJson(element));
      });
      return right(pPosts);
    } catch (e) {
      throw Failure(e.toString(), StackTrace.empty);
    }
  }
}
