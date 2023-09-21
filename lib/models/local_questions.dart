import 'package:equatable/equatable.dart';
import 'package:quiz_app/controllers/quiz_state.dart';
import 'package:quiz_app/models/question.dart';

class LocalQuestions extends Equatable {
  final List<Question> allQuestions;
  final QuizState currentState;

  const LocalQuestions({
    required this.allQuestions,
    required this.currentState,
  });

  @override
  List<Object> get props => [
        allQuestions,
        currentState,
      ];

  Map<String, dynamic> toJson() {
    return {
      'allQuestions': allQuestions.map((e) => e.toJson()).toList(),
      'currentState': currentState.toString(),
    };
  }

  // Create a factory constructor to create an object from JSON
  factory LocalQuestions.fromJson(Map<String, dynamic> json) {
    return LocalQuestions(
      allQuestions: json['allQuestions'],
      currentState: json['currentState'],
    );
  }
}
