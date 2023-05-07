import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/nbposts_modal.dart';

final nBPostsAPIProvider = Provider((ref) => NBPostsAPI());
final dio = Dio();

abstract class INBPostsAPI {
  FutureEither<List<NBPostsModal>> getNBPosts();
}

class NBPostsAPI implements INBPostsAPI {
  @override
  FutureEither<List<NBPostsModal>> getNBPosts() async {
    try {
      final noticeBoardData = await dio.get('${apiUrl}getNBposts');
      List<NBPostsModal> nbPosts = [];
      noticeBoardData.data['data'].forEach((element) {
        nbPosts.add(NBPostsModal.fromJson(element));
      });
      return right(nbPosts);
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
