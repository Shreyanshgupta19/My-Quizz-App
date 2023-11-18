import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quizz_app/DynamicUi/DynamicElevatedButton.dart';
import 'package:my_quizz_app/DynamicUi/DynamicGradientColor.dart';
import 'package:my_quizz_app/secondPage/questions_screen.dart';

class firstPageBody extends StatefulWidget{
  firstPageBody(this.myswitchScreens,this.color1,this.color2, {super.key}  );
  final void Function() myswitchScreens;
  final color1;
  final color2;

  @override
  // State<firstPageBody> createState() => _firstPageBodyState();   // or
  State<firstPageBody> createState() { return _firstPageBodyState(); }
}

class _firstPageBodyState extends State<firstPageBody> {



  @override
  Widget build(BuildContext context) {


 return
  Scaffold(
   body: Container(
     height: double.infinity,
     width: double.infinity,

     decoration: BoxDecoration(
       gradient: DynamicGradientColor(widget.color1, widget.color2).myGradientColors(),
     ),
     child: Column(
       children: [


         Padding(
           padding: const EdgeInsets.only(top: 20),
           child: CircleAvatar(
             radius: 250,
             backgroundColor: Colors.transparent,
             child: ClipOval(
               child: Container(
                 width: 250,
                 height: 250,
                 child: Image.asset(
                   "assets/images/quiz logo.jpeg",
                   fit: BoxFit.cover,
                 ),
               ),
             ),
           ),
         ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
           //   child: DynamicElevatedButton(context,secondPage(),"Start",Colors.white,"Play Quiz",200,50,20,Colors.black).myElevatedButton() ),
       child: Tooltip(
         message: "Start Quizz",
         child: OutlinedButton.icon(
             // onPressed:(){
             //   widget.myswitchScreens(); // this is called anonymous function call
                                            // in stateless we can write only 'myswitchScreens();'
             //   },   // or
           onPressed: widget.myswitchScreens,  // this is called pointer call
             style: OutlinedButton.styleFrom(
               foregroundColor: Colors.white,
             ),
             icon: Icon(Icons.arrow_right_alt),
             label: Text("Start Quiz"),
                ),
       ),
            ),
                ]
     ),
   ),
 );
  }
}
