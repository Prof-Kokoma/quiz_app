import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/models/local_questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizLocalDatabaseProvider = Provider.autoDispose<QuestionsDatabase>(
  (ref) => QuestionsDatabase(),
);

class QuestionsDatabase {
  LocalQuestions? savedQuestion;
  late LocalQuestions data;

  Future<void> loadDataFromLocalDB() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var dataString = prefs.getString('CurrentQuestion');

    if (dataString != null) {
      // var json = jsonDecode(dataString);
      print('I am Here is the data: ${jsonDecode(dataString)}');
      // data = dataString
      //     .map((e) => LocalQuestions.fromJson(jsonDecode(e)));
      data = LocalQuestions.fromJson(jsonDecode(dataString));

      savedQuestion = data;
      print('Here is the data: ${data.toString()}');
      // data = [];
    } else {
      print('Here is the data: []');
      // data = [];
    }
  }

  void saveDataToLocalDB(LocalQuestions savedQuestion) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var encodedData = jsonEncode(savedQuestion.toJson());
    // var encodedData = jsonEncode(dataString);
    // prefs.setString('CategorizedExpense', encodedData);

    prefs.setString('SavedQuestion', encodedData);
  }
}
