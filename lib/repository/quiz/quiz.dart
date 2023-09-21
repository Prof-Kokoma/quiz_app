import 'dart:io';
import 'package:dio/dio.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:quiz_app/enums/difficulty.dart';
import 'package:quiz_app/models/failure.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repository/interface/base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref));

class QuizRepository extends IBaseQuizRepository {
  // final READ _read;
  final ProviderRef<QuizRepository> _read;
  // final dio = Dio();

  QuizRepository(this._read);

  @override
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required Difficulty difficulty,
  }) async {
    try {
      final querParameters = {
        'type': '',
        'amount': numQuestions,
        'category': categoryId
      };
      if (difficulty != Difficulty.any) {
        querParameters
            .addAll({'difficulty': EnumToString.convertToString(difficulty)});
      }
      final response = await _read
          .read(dioProvider)
          .get('https://opentdb.com/api.php', queryParameters: querParameters);

      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String, dynamic>>.from(data['results'] ?? []);
        if (results.isNotEmpty) {
          return results.map((e) => Question.fromMap(e)).toList();
        }
      }

      return [];
    } on DioException catch (err) {
      throw Failure(
          message: err.response?.statusMessage ?? 'Check your network');
    } on SocketException catch (_) {
      throw const Failure(message: 'Please check your connection.');
    }
  }
}
