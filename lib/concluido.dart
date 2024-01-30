import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/home_page.dart';

class Concluido extends StatelessWidget {
  final int pontuacao;
  const Concluido({super.key, required this.pontuacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HomePage()))
        ),
      ),
      body: Center(
        child: Text('Parabéns! Você concluiu o quiz \nSua pontuação: $pontuacao', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
        
        
      )
    );
  }
}