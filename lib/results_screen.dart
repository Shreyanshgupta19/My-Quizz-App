import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quizz_app/DynamicUi/DynamicGradientColor.dart';
import 'package:my_quizz_app/data/questions.dart';
import 'package:my_quizz_app/questions_summary.dart';
import 'package:my_quizz_app/quiz.dart';

import 'firstPage/firstPage.dart';

// chosenAnswers = mySelectedAnswers

class ResultScreen extends StatelessWidget{
  const ResultScreen(this.mySelectedAnswers,this.myrestartQuiz,{super.key});
  final List<String> mySelectedAnswers;
 final void Function() myrestartQuiz;
  // List<Map<String, Object>> get summaryData() {     // here 'get' is getter which is a method(function) and we can directly call this method without using '()', it can be used like a property like this  summaryData.where and we can not do name duplication and creating extra final variable like this: final summaryData = summaryData;
  // or
  List<Map<String, Object>> getSummaryData() {     // Map<Key, Value>    // Object : all types values
    final List<Map<String, Object>> summary = [];   // here, summary is the empty list and the type of summary is List<Map<String, Object>>

    for (var i = 0; i < mySelectedAnswers.length; i++) {  // for loop is allows to execute code snippet(iterable) multiple times // here i is a current index
      summary.add(            // here, summary is a empty list and we can add any thing in list by using add method like this summary.add();
          {                   // if we want to add map in a list we can use {} like this summary.add({}); because {} is the dart syntax to create a map
        'question_index' : i,                    // In Map we don't use = sign we use only : sign  // { key(String) : value(Object) }  // here key is unique and value is not unique
        'question' : questions[i].text.toString(),   // It calls the question's constructor's text which is in string form at current index
        'correct_answer' : questions[i].answers[0],   // It means in the question's constructor all the answers which is present at index 0 are correct answers which is present in answers method // here shuffle(); method is not matter because we don't call shuffle method we are calling only answers method
        'user_answer' : mySelectedAnswers[i],         // mySelectedAnswers calls the value of selectedAnswers which is in quiz.dart at current index
          },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;             // here .length method is gives us to total questions length(total numbers of questions(total numbers of constructor's functions) ).

    final numCorrectQuestions = summaryData.where(                   // here this summaryData is list of maps to find out for how many map object user answer is equal to correct answer
                                                                     // where() method is a method just like .Map() and .add() provided by dart
                                                                     // it allows to us to filter the list on which we are calling it,
                                                                     // it does not change the original list but it instead returns a new list
                                                                     // or to be precise, it also returns such a iterable thing which is almost like a list
                                                                     // so 'where' can be used to filter this original list and create a new filtered list based on that original list,

                                                                     // In 'where' we have pass a anonymous function just like as we pass the anonymous function to map, which will be executed for every item in that list
                                                                     // And just as with map, we will then receive that item as a argument in that function which we pass to 'where'.
                                                                     // So here i get my data point, my map, and then inside of this function unlike map we don't return some transformed value
                                                                     // But instead we return true if that data point should be kept in that new filtered list that is returned by 'where' or false if it should be dropped.
                                                                     // And of course the trick is to not hard code true or false here otherwise all values will be kept or values will be dropped but instead to dynamically derive whether it should be true or false
                                                                     // And for that we can define a condition here
        (data){     // this anonymous function takes some input which is called here 'data'. And then in its  function body immediately returns a value
          return data['user_answer'] == data['correct_answer'];
        }
        // or
        //  (data) => data['user_answer'] == data['correct_answer'];


    ).length;                                               // here .length method is gives us to total correct answers length(total numbers of correct answers).

    return Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: DynamicGradientColor(Colors.purpleAccent,Colors.purple).myGradientColors(),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answer ${numCorrectQuestions} out of ${numTotalQuestions} questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              SizedBox(height: 30,),
              Tooltip(
                message: 'Play Again',
                child: TextButton.icon(
                    onPressed: myrestartQuiz,
                    icon: Icon(Icons.refresh,),
                    label: Text('Restart Quiz!'),
                ),
              ),
            ],
          ),
        ),
      );

  }
}
