import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_requests/http_requests.dart';

class QuizBrain {
  Future<void> nextQuestion() async {
    Response r = await HttpRequests.get("http://localhost:8888/next");
    print(r.success);
    print(r.json);
    print(r.json['next']);
    if (r.success) {
      return r.json['next'];
    } else {
      throw Exception('Failed to get next question');
    }
  }

  Future<String> getQuestionText() async {
    Response r = await HttpRequests.get("http://localhost:8888/question");
    print(r.success);
    print(r.json);
    print(r.json['question']);
    if (r.success) {
      print("HEEEEEEEEEEEEEEEEEEEY");
      return r.json['question'];
    } else {
      throw Exception('Failed to get question');
    }
  }

  Future<bool> getCorrectAnswer() async {
    Response r = await HttpRequests.get("http://localhost:8888/answer");
    print(r.success);
    print(r.json);
    print(r.json['answer']);
    if (r.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isFinished() async {
    Response r = await HttpRequests.get("http://localhost:8888/finished");
    print(r.success);
    print(r.json);
    print(r.json['finished']);
    if (r.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> reset() async {
    Response r = await HttpRequests.get("http://localhost:8888/reset");
    print(r.success);
    print(r.json);
    print(r.json['reset']);
  }
}
