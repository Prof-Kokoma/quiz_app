import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/controllers/quiz.dart';
import 'package:quiz_app/enums/quiz_status.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/failure.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/quiz_error.dart';
import 'package:quiz_app/screens/quiz_questions.dart';
import 'package:quiz_app/screens/quiz_result.dart';

class QuizScreen extends HookConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final pageController = usePageController();
    final quizQuestions = ref.watch(quizQuestionProvider);
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFD4418E),
            Color(0xFF0652C5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: quizQuestions.when(
            data: (questions) =>
                _buildBody(context, pageController, questions, ref),
            error: (error, _) => QuizError(
                message: error is Failure
                    ? error.message.isNotEmpty
                        ? error.message
                        : "Something went wrong here!"
                    : 'Something went wrong!'),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PageController pageController,
    List<Question> questions,
    WidgetRef ref,
  ) {
    if (questions.isEmpty) {
      return const QuizError(message: 'No questions found');
    }
    final quizState = ref.watch(quizControllerProvider);
    return quizState.status == QuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }
}

const List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 2),
    blurRadius: 4,
  ),
];
