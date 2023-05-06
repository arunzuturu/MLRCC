import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/pposts_api.dart';
import 'package:mlrcc/apis/questions_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/pposts_modal.dart';
import 'package:mlrcc/modals/questions_modal.dart';

final questionsDataProvider = StateProvider<List<QuestionsModal>?>((ref) => null);

final questionsControllerProvider =
    StateNotifierProvider<QuestionsController, bool>((ref) {
  final questionsAPI = ref.watch(questionsAPIProvider);
  return QuestionsController(
    ref: ref,
    questionsAPI: questionsAPI,
  );
});

class QuestionsController extends StateNotifier<bool> {
  final QuestionsAPI _questionsAPI;
  final Ref _ref;
  QuestionsController({required QuestionsAPI questionsAPI, required Ref ref})
      : _questionsAPI = questionsAPI,
        _ref = ref,
        super(false);

  void getQuestions(BuildContext context) async {
    state = true;
    final pPosts = await _questionsAPI.getQuestions();
    pPosts.fold((l) => showSnackBar(context, l.message), (questions) {
      print(questions);
      _ref.read(questionsDataProvider.notifier).update((state) => questions);
    });
    state = false;
  }

  void addQuestion(BuildContext context, String questions) async {
    state = true;
    final pPosts = await _questionsAPI.addQuestion(questions);
    pPosts.fold((l) => showSnackBar(context, l.message), (questions) {
      print(questions);
      _ref.read(questionsDataProvider.notifier).update((state) => questions);
    });
    state = false;
  }
}
