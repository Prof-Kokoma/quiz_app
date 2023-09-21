import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizError extends HookConsumerWidget {
  final String message;

  const QuizError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: 'Retry',
            onTap: () {
              var _ = ref.refresh(
                quizQuestionProvider,
              );
            },
          ),
        ],
      ),
    );
  }
}
