import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/explore_modal.dart';
import 'package:mlrcc/modals/pposts_modal.dart';

final exploreAPIProvider = Provider((ref) => ExploreAPI());

final dio = Dio();

abstract class IExploreAPI {
  FutureEither<List<ExploreModal>> getExplorePosts();
}

class ExploreAPI implements IExploreAPI {

  
  @override
  FutureEither<List<ExploreModal>> getExplorePosts() async{
    try {
      final roadmapData = await dio.get('${apiUrl}getExplore');
      List<ExploreModal> pPosts = [];
      roadmapData.data['data'].forEach((element) {
        pPosts.add(ExploreModal.fromJson(element));
      });
      return right(pPosts);
    } catch (e) {
      throw Failure(e.toString(), StackTrace.empty);
    }
  }


  
}
