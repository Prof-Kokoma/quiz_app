import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/enums/difficulty.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repository/quiz/quiz.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          useMaterial3: true,
        ),
        home: const QuizScreen(),
      ),
    );
  }
}

final quizQuestionProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestions: 10,
        categoryId: Random().nextInt(24) + 9,
        difficulty: Difficulty.any,
      ),
);
