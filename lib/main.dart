import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank q = QuestionBank();

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black87,
      body: QuizzlerPage(),
    )
  ));
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({super.key});

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {

  List<Icon> userScore = [];

  void checkAnswer(bool userInput){
    setState((){
      if (q.isFinished()){
        Alert(context: context, title: "Quizler", desc: "Questions are over.").show();
      }

      if(q.getAnswer()==userInput){
        userScore.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else{
        userScore.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      q.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Card(
              margin: EdgeInsets.all(10.0),
              color: Colors.black26,
              child: Center(
                child: Text(
                  q.getQuestion(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            flex: 1,
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: (){
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            flex: 1,
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: (){
                checkAnswer(false);
              },
              child: Text(
                'False',
                  style: TextStyle(
                  color: Colors.black,
              ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Wrap(
            children: userScore,
          )
        ],
      ),
    );
  }
}