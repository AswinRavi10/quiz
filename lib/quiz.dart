import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(home: Quizpage(),));
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Quiz> quiz = [
    Quiz(
      question: ' Name the biggest continent in the world?',
      options: ['Asia', 'Africa', 'Australia', 'North America'],
      correctAnswer: 'Asia'
    ),
    Quiz(
      question: 'Who is current Chief Minister of Kerala?',
      options: ['Pinarayi Vijayan', 'Ummen Chandi', 'Shashi Tharoor', 'M.Sudhakaran'],
      correctAnswer: 'Pinarayi Vijayan',
    ),
    Quiz(
      question: 'Who is the first woman prime minister of India?',
      options: ['Sarojini Naidu', 'Indira Gandhi', 'Droupathi Murmu', 'Soniya Gandhi'],
      correctAnswer: 'Indira Gandhi',
    ),
    Quiz(
      question: 'Who is known as father of nation in India?',
      options: ['Mahatma Gandhi', 'Jawaharlal Neharu', 'K.Kelappan', 'Subhash Chandra Boss'],
      correctAnswer: 'Mahatma Gandhi',
    ),
    Quiz(
      question: 'Which district have longest coastline?',
      options: ['Kannur', 'Kozhikode', 'Malappuram', 'Kasargode'],
      correctAnswer: 'Kannur',
    ),
    Quiz(question:'Which is the largest State of India',
         options:['Kerala','TamilNadu','Rajasthan','Maharashtra'],
         correctAnswer:'Rajasthan')
  ];

   int currentQuestionIndex = 0;
   int score =0 ;

  void checkAnswer(String selectedOption) {
     if (selectedOption == quiz[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;

        print("correct answer");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Correct answer'),
          duration: Duration(seconds:1),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height-500,
              right: 20,
              left: 20),
        ));

      });
    }else{
      print("answer is incorrect");
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text('Incorrect answer'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 500,
            right: 20,
            left: 20),
      ));
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellowAccent,
        title: Text('Quiz App',style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.bold),),
      ),
      body: (currentQuestionIndex < quiz.length)?
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(
            quiz[currentQuestionIndex].question,
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(height: 20.0),
          ...quiz[currentQuestionIndex].options.map((option) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(option,style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            );
          }).toList(),
        ],
      )
          : Center(
        child: Text(
          'Quiz completed! Your score: $score out of ${quiz.length}',
          style: TextStyle(fontSize: 20.0),
        ),
       ),
    );
  }
}

class Quiz {
  String question;
  List<String> options;
  String correctAnswer;

  Quiz(
      {required this.question,
        required this.options,
        required this.correctAnswer});
}