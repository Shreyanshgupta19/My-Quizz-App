import 'package:flutter/material.dart';
import 'package:my_quizz_app/DynamicUi/DynamicGradientColor.dart';
import 'package:my_quizz_app/firstPage/firstPage.dart';
import 'package:my_quizz_app/secondPage/questions_screen.dart';
import 'package:my_quizz_app/data/questions.dart';
import 'package:my_quizz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];

  void onchooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "Result-Screen";
      });
    }
  }
     void restartQuiz(){
      setState(() {
        selectedAnswers = [];  // it reset the selectedAnswers list(it clear the selectedAnswers list).
        activeScreen = "first-page";
      });
      }

  var  activeScreen = "first-page";
  void switchScreen() {
    setState(() {
      selectedAnswers = [];  // it reset the selectedAnswers list(it clear the selectedAnswers list).
      activeScreen = "Questions-Screen";
    });
  }

// or
//   Widget? activeScreen;  // activeScreen can also be null initially it does not have value.
// @override                // The ? tells the variable may contains a Widget or Null.
//   void initState() {   // We are using initState because we calls firstPage only once.
//   activeScreen =  firstPage(switchScreen);
//     super.initState();
//   }
//
//   void switchScreen() {
//     setState(() {       // We are using setState because we calls QuestionsScreen many times.
//       activeScreen = const QuestionsScreen(onchooseAnswers);
//     });
//   }

// // // or
// // // var  activeScreen = "first-page";
// // // void switchScreen() {
// // // setState(() {
// // // activeScreen = "Questions-Screen";
// // // });
// // // }

  @override
  Widget build(context) {

    Widget screenWidget = firstPage(switchScreen);  // default screen
    if (activeScreen == "Questions-Screen"){
    screenWidget = QuestionsScreen(onchooseAnswers);    // here we pass 'onchooseAnswers' pointer as a parameter of QuestionsScreen which points to 'onchooseAnswers()' method
    }
    if (activeScreen == "Result-Screen"){
      screenWidget = ResultScreen(selectedAnswers,restartQuiz);
    }

// // // or
// // // final screenWidget =  activeScreen == "first-page"          // Condition yields True or False
// // //                      ? firstPage(switchScreen)              // Value used, if condition is meet ( Condition is True )
// // //                      : const QuestionsScreen(onchooseAnswers);                  // Value used, if condition is NOT meet ( Condition is False )


    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: DynamicGradientColor(Colors.purpleAccent,Colors.deepPurple).myGradientColors(),
        ),
        child: screenWidget,
        // // or
        // // child: activeScreen == "first-page"    // Condition yields True or False
        // // ? firstPage(switchScreen)              // Value used, if condition is meet ( Condition is True )
        // // : QuestionsScreen(onchooseAnswers),                  // Value used, if condition is NOT meet ( Condition is False )
// or
//  child: activeScreen,



// // // or
// // // child: screenWidget,
      ),
    );
  }
}