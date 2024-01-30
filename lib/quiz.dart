import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/concluido.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  int pontuacao = 0;
  bool? isCorrect;
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Primeira Pergunta',
      'answers': ['Resposta 1','Pergunta 2', 'Resposta 3', 'Resposta 4'],
      'correctAnswer': 'Resposta 1'
    },
    {
      'question':
      'QUal animal marinho é famoso por sua carapaça dura e longa vida?',
      'answers': [
        'Baleia azul',
        'Caranguejo',
        'Tartaruga marinha',
        'Estrela do mar'
      ],
      'correctAnswer': 'Tartaruga marinha'
    },
  ];
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      
    }
  }
  void handleAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex] ['correctAnswer'];
      
    });
    
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        selectedAnswer = null;
        isCorrect = null;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Concluido(pontuacao: pontuacao)));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz marítimo!', style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
              child: Text(currentQuestion['question'],
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), ),
            )),
          ),
          Wrap(
            children: currentQuestion['answers'].map<Widget>((resposta) {
              bool isSelected = selectedAnswer == resposta;
              Color? buttonColor;
              if (isSelected) {
                buttonColor = isCorrect! ? Colors.green : Colors.red;
                isCorrect! ? pontuacao++ : print('errado');
              }
              return meuBtn(
                resposta, () => handleAnswer(resposta), buttonColor);
            }).toList(),
              )
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) => 
Container(
  margin: const EdgeInsets.all(16),
  width: 160,
  child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color
    ),
    child: Text(resposta),
  ),
);