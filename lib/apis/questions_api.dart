import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/pposts_modal.dart';
import 'package:mlrcc/modals/questions_modal.dart';

final questionsAPIProvider = Provider((ref) => QuestionsAPI());

final dio = Dio();

abstract class IPPostsAPI {
  FutureEither<List<QuestionsModal>> getQuestions();
}

class QuestionsAPI implements IPPostsAPI {
  @override
  FutureEither<List<QuestionsModal>> getQuestions() async {
    try {
      final roadmapData = await dio.get('${apiUrl}getQuestions');
      List<QuestionsModal> pPosts = [];
      roadmapData.data['data'].forEach((element) {
        pPosts.add(QuestionsModal.fromJson(element));
      });
      return right(pPosts);
    } catch (e) {
      throw Failure(e.toString(), StackTrace.empty);
    }
  }

  @override
  FutureEither<List<QuestionsModal>> addQuestion(
      String questions) async {
    try {
      final roadmapData = await dio.post('${apiUrl}createQuestion',
          data: {
            'question': questions,
            'comments': [] 
          });
      List<QuestionsModal> pPosts = [];
      roadmapData.data['data'].forEach((element) {
        pPosts.add(QuestionsModal.fromJson(element));
      });
      return right(pPosts);
    } catch (e) {
      throw Failure(e.toString(), StackTrace.empty);
    }
  }
  
}
