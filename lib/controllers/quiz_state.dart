import 'package:equatable/equatable.dart';
import 'package:quiz_app/enums/quiz_status.dart';
import 'package:quiz_app/models/question.dart';

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  const QuizState({
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  bool get answered =>
      status == QuizStatus.correct || status == QuizStatus.incorrect;

  QuizState copyWith({
    String? selectedAnswer,
    List<Question>? correct,
    List<Question>? incorrect,
    QuizStatus? status,
  }) {
    return QuizState(
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        correct: correct ?? this.correct,
        incorrect: incorrect ?? this.incorrect,
        status: status ?? this.status);
  }

  factory QuizState.initial() {
    return const QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }

  @override
  List<Object> get props => [
        selectedAnswer,
        correct,
        incorrect,
        status,
      ];
}
