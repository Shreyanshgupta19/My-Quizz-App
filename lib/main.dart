import 'package:flutter/material.dart';

import 'package:my_quizz_app/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Quiz(),
    ),
  );
}

// question.dart  -> quiz_question.dart -> main.dart -> quiz.dart -> firstPage.dart -> firstPageBody.dart  -> question_screen.dart -> result_screen.dart -> questions_summary.dart
