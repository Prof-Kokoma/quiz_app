import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/controllers/quiz.dart';
import 'package:quiz_app/controllers/quiz_state.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repository/quiz/quiz.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizResults extends HookConsumerWidget {
  final QuizState state;
  final List<Question> questions;

  const QuizResults({
    super.key,
    required this.state,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state.correct.length} / ${questions.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
            title: "New Quiz",
            onTap: () {
              var _ = ref.refresh(quizRepositoryProvider);

              ref.read(quizControllerProvider.notifier).reset();
            })
      ],
    );
  }
}
