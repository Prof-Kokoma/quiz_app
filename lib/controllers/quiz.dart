import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/controllers/quiz_state.dart';
import 'package:quiz_app/enums/quiz_status.dart';
import 'package:quiz_app/models/local_questions.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repository/database/local_database.dart';

final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController, QuizState>(
  (ref) => QuizController(),
);

class QuizController extends StateNotifier<QuizState> {
  final QuestionsDatabase _localDB = QuestionsDatabase();
  QuizController() : super(QuizState.initial());

  Future<LocalQuestions?>? fetchSavedData() async {
    await _localDB.loadDataFromLocalDB();
    return _localDB.savedQuestion;
  }

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) {
      return;
    }

    if (currentQuestion.correctAnswer == answer) {
      List<Question> correctAnswers = state.correct + [currentQuestion];
      state = QuizState(
          selectedAnswer: answer,
          correct: correctAnswers,
          incorrect: state.incorrect,
          status: QuizStatus.correct);
    } else {
      List<Question> inCorrectAnswers = state.incorrect + [currentQuestion];
      state = QuizState(
          selectedAnswer: answer,
          correct: state.correct,
          incorrect: inCorrectAnswers,
          status: QuizStatus.correct);
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = QuizState(
      selectedAnswer: '',
      correct: state.correct,
      incorrect: state.incorrect,
      status: currentIndex + 1 < questions.length
          ? QuizStatus.initial
          : QuizStatus.complete,
    );
    LocalQuestions localQuestions = LocalQuestions(
      allQuestions: questions,
      currentState: state,
    );
    // _localDB.savedQuestion = localQuestions;
    _localDB.saveDataToLocalDB(localQuestions);
    print('here is the local questions: $localQuestions');
  }

  void reset() {
    state = QuizState.initial();
  }
}
