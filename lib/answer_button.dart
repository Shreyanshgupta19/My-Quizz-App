import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
 // const AnswerButton(this.answerText, this.onTap, {super.key});                 // here constructor has a Positional Argument
  const AnswerButton({super.key,required this.answerText,required this.onTap, }); // here constructor has a Named Argument
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return  Tooltip(
      message: "Please click",
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),

        ),
        child: Text(answerText, textAlign: TextAlign.center,),
      ),
    );
  }
}