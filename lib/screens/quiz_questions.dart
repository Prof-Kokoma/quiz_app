import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:quiz_app/controllers/quiz.dart';
import 'package:quiz_app/controllers/quiz_state.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/answer_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizQuestions extends HookConsumerWidget {
  final PageController pageController;
  final QuizState state;
  final List<Question> questions;

  const QuizQuestions({
    super.key,
    required this.pageController,
    required this.state,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentState = ref.watch(quizControllerProvider);
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                HtmlCharacterEntities.decode(question.question),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 32,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Column(
              children: question.answers
                  .map(
                    (e) => AnswerCard(
                      answer: e,
                      isSelected: e == currentState.selectedAnswer,
                      isCorrect: e == question.correctAnswer,
                      isDisplayingAnswer: currentState.answered,
                      onTap: () {
                        var quizProvider =
                            ref.watch(quizControllerProvider.notifier);
                        quizProvider.submitAnswer(question, e);
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            if (state.answered)
              CustomButton(
                  title: "Next Quiz / Save",
                  onTap: () {
                    ref.watch(quizControllerProvider.notifier).nextQuestion(
                          questions,
                          index + 1,
                        );
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                    );
                  })
          ],
        );
      },
    );
  }
}
