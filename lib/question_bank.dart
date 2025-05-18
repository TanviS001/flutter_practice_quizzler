import 'package:flutter/widgets.dart';
import 'question_skeleton.dart';

class QuestionBank{

  int questionNumber=0;

  List<QuestionSkeleton> questionBank = [
    QuestionSkeleton('You can lead a cow downstairs but not upstairs.', false),
    QuestionSkeleton('Approximately one quarters of human bones are in feet', true),
    QuestionSkeleton('A slug\'s blood is green', true),
    QuestionSkeleton('The Great Wall of China is visible from space.', false),
    QuestionSkeleton('Lightning never strikes the same place twice.', false),
    QuestionSkeleton('Humans and dinosaurs coexisted.', false),
    QuestionSkeleton('Bananas grow on trees.', false), // They grow on plants
    QuestionSkeleton('An octopus has three hearts.', true),
    QuestionSkeleton('Goldfish only have a memory of three seconds.', false),
    QuestionSkeleton('Humans share 50% of their DNA with bananas.', true),
  ];

  void getNextQuestion(){
    if (questionNumber<questionBank.length-1){
      questionNumber++;
      questionBank[questionNumber].question;
    }
  }

  bool isFinished(){
    if (questionNumber>=questionBank.length-1){
      return true;
    } else{
      return false;
    }
  }

  String getQuestion(){
    String question=questionBank[questionNumber].question;
    return question;
  }

  bool getAnswer(){
    bool answer=questionBank[questionNumber].answer;
      return answer;
  }



}