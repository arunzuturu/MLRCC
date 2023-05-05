import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/pposts_modal.dart';

final pPostsAPIProvider = Provider((ref) => NBPostsAPI());

abstract class INBPostsAPI {
  FutureEither<List<PPostsModal>> getNBPosts();
}

class NBPostsAPI implements INBPostsAPI {
  @override
  FutureEither<List<PPostsModal>> getNBPosts() async {
    try {
      final roadmapData =
          await http.get(Uri.parse('${apiUrl}pposts}'));
      final roadmapDataJson = jsonDecode(roadmapData.body) as List;
      final roadmapDataList = roadmapDataJson
          .map((e) => PPostsModal.fromJson(e as Map<String, dynamic>))
          .toList();
      print(roadmapDataList);
      return right(roadmapDataList);
    } catch (e) {
      throw Failure(e.toString(), StackTrace.empty);
    }
  }
}