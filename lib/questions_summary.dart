import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{

  const QuestionsSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return Container(
      height: 465,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.19),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 2,color: Colors.white.withOpacity(0.4),),
      ),
      child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: summaryData.map(
                (data){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 50,left: 20,top: 15),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: data['user_answer'] == data['correct_answer']?Colors.green:Colors.redAccent,
                    child: Text( ( (data['question_index'] as int) + 1).toString(),
                      style:  const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                                                                              // [1]. The list index starts from 0, but if I want to display the number of a question to the user it would be weird if I start from zero,
                                                                              //      because we humans start from 1 for the first question or for the first item in a list of items. let start. That's why I want to add one to that index.

                                                                              // [2]. data['question_index']: here we access value of maps by using ['question_index'] which is key of the value

                                                                              // [3]. here we use as int because dart does not know which kind of value will we stored under the question key
                                                                              //      because in result_screen.dart file i set this map object to be an object where the values can be of all kinds of types
                                                                              //      so therefore dart does not understand that this 'i' value is a number? but for the final map, which is produces,
                                                                              //      it just knows that all these different keys, can have all kinds of value types. it does not memorize the exact value types for the specific keys
                                                                              //      and therefore here this valve returned by accessing the question key is also considered to be of any kind of type
                                                                              //      Therefore we have to do something that's called type casting. we can use 'as' keyword to change the type of value after 'as' we define the type of value which is 'int'

                                                                              // [4]. and we use ' .toString ' because Text widget accepts String value.
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(height: 12,),
                     Text((data['question'] as String),
                         style: GoogleFonts.lato(
                           color: CupertinoColors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 15,
                         ),
                         textAlign: TextAlign.start,
                       ),

                     const SizedBox(height: 5,),
                      Text("You - "+(data['user_answer'] as String),
                       style: GoogleFonts.lato(
                       color:  data['user_answer'] == data['correct_answer']?Colors.blue:Colors.redAccent,
                         fontWeight: FontWeight.bold,
                         fontSize: 15,
                       ),
                  textAlign: TextAlign.start,
                       ),
                       Text("Ans: "+(data['correct_answer'] as String),
                         style: GoogleFonts.lato(
                         color: Colors.green,
                         fontWeight: FontWeight.w700,
                         fontSize: 15,
                       ),
                    textAlign: TextAlign.start,
                       ),


                   ],
               ),
                ),
                  const SizedBox(height: 85,),

              ],
              );

                },
          ).toList(),
        ),
      ),
    );
  }

}