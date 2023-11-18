import 'package:flutter/material.dart';
import 'package:my_quizz_app/DynamicUi/DynamicAppBar.dart';
import 'package:my_quizz_app/firstPage/firstPageBody.dart';

class firstPage extends StatefulWidget{    // parent class of _firstPageState
  const firstPage(this.myswitchScreen ,{super.key});
  final void Function() myswitchScreen;

  @override
  State<firstPage> createState() {
     return _firstPageState();
  }
}

class _firstPageState extends State<firstPage>{   // child class of firstPage

  @override
  Widget build (context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DynamicAppBar('My Quizz App', Colors.red, Colors.purple),
      ),

      body: firstPageBody(widget.myswitchScreen,Colors.purpleAccent,Colors.red), // in statelesswidget we can write only 'myswitchScreen' and myswitchScreen is not pass in this class so if we want to take his parent class so we write widget.myswitchScreen
  // note: In StatefulWidget we have two classes so if we want to take any parameter from parent class to child class so we can write in child class like this  widget.myswitchScreen.
  //       In StatelessWidget we have only one class so we don't need to write widget.myswitchScreen we can directly write like this myswitchScreen
    );
}
}