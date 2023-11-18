import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quizz_app/DynamicUi/DynamicAppBar.dart';
import 'package:my_quizz_app/DynamicUi/DynamicDrawer.dart';
import 'package:my_quizz_app/DynamicUi/DynamicFloatingActionButton.dart';
import 'package:my_quizz_app/DynamicUi/DynamicGradientColor.dart';
import 'package:my_quizz_app/answer_button.dart';
import 'package:my_quizz_app/firstPage/firstPage.dart';
import 'package:my_quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// selectAnswer = mychooseAnswers
// onselectAnswer = onmychooseAnswers
// answer = answerIndexValue

 class QuestionsScreen extends StatefulWidget{
    const QuestionsScreen(this.onmychooseAnswers,{super.key});  // here we create a variable 'onmychooseAnswers' which stores a pointer which points to 'onchooseAnswers()' method which is present in quiz.dart file


    final void Function(String answer) onmychooseAnswers;        // here we define the type of 'onmychooseAnswers' variable

   @override
  State<QuestionsScreen> createState() {


    return _QuestionsScreenState();
  }
    // // void answer1Callback() {
    // //   // Do something for Answer 1
    // // }
    // //
    // // void answer2Callback() {
    // //   // Do something for Answer 2
    // // }
    // //
    // // void answer3Callback() {
    // //   // Do something for Answer 3
    // // }
    // //
    // // void answer4Callback() {
    // //   // Do something for Answer 4
    // // }
}
class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionsIndex = 0;

  void answerQuestions(String mychooseAnswers) {
    widget.onmychooseAnswers(mychooseAnswers);
    setState(() {
      currentQuestionsIndex++;
      // or
      // currentQuestionsIndex +=1;
      // or
      // currentQuestionsIndex = currentQuestionsIndex + 1;
    });
      }

    @override
  Widget build (context){
      final currentQuestion = questions[currentQuestionsIndex];   // QuizQuestion constructor at index 0(initially)
    return Scaffold(

      drawer: DynamicDrawer(""),

       appBar: AppBar(

         iconTheme: IconThemeData(
           color: Colors.white, ), // Set the color of the drawer icon

         centerTitle: true,
         flexibleSpace: Container(
           decoration: BoxDecoration(
             gradient: DynamicGradientColor(Colors.red, Colors.purple).myGradientColors(),
           ),
         ),
         title: Text("Questions Screen",
           style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.w400,
           fontFamily: 'font2',
         ),
         ),
       ),

      // PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: DynamicAppBar('First Page', Colors.red, Colors.purple),
      // ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:BoxDecoration(
          gradient:DynamicGradientColor(Colors.purpleAccent,Colors.deepPurple).myGradientColors(),
        ),
        child:   SizedBox(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(currentQuestion.text.toString(),
                  style:GoogleFonts.exo2(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
         // we are using shuffled method to change the order of list's answers and map method is not change the order of original list's answers
                ...currentQuestion.myShuffledAnswerOrder().map(     // we use this method to dynamically changing of every answers in a answer list.
                        (answerIndexValue) {
                      return AnswerButton( answerText: answerIndexValue, onTap: (){answerQuestions(answerIndexValue); } );
                    }
                ),

                // here answers is a list of strings which is iterable form and when we use ... all the iterable answers are add with each other
                // ...currentQuestion.answers.map(     // we use this method to dynamically changing of every answers in a answer list.
                //         (answerIndexValue) {
                //   return AnswerButton( answerText: answerIndexValue, onTap: (){} );
                //    }
                // ),

                // AnswerButton("", () {}),  // if we use in constructor Positional Argument
                // AnswerButton("", () {}),
                // AnswerButton("", () {}),
                // AnswerButton("", () {}),

                // // or
               // // AnswerButton(answerText: currentQuestion.answers[0],onTap: widget.answer1Callback,),  // if we use in constructor Named Argument // here, answer1Callback is called pointer of answer1Callback() function
               // // AnswerButton(onTap: widget.answer2Callback,answerText: currentQuestion.answers[1],),
               // // AnswerButton(answerText: currentQuestion.answers[2],onTap: widget.answer3Callback,),
               // // AnswerButton(answerText: currentQuestion.answers[3],onTap: widget.answer4Callback,),
               // // // or we can write as that
               // // //   AnswerButton(answerText: currentQuestion.answers[0],onTap: (){},),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton:DynamicFloatingActionButton(() { exit(0); },70,70,100,"Do you want to quit","Quit",const Icon(Icons.arrow_back_ios_new,color: Colors.white,),Colors.black,).myFloatingButton(),
       // here exit(0); is used to close the application when we click on button
    );
  }
}