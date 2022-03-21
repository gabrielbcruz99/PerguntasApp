import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
       final _perguntas = const [
        {
          'texto': 'Qual sua cor favorita?',
          'respostas': [
            {'texto': 'Preto',  'pontuacao': 10 },
            {'texto': 'Vermelho',  'pontuacao': 5},
            {'texto': 'Branco', 'pontuacao': 3 },
            {'texto': 'Amarelo', 'pontuacao': 1 },
            ],
        },
        {
          'texto': 'Qual seu animal favorito',
          'respostas': [
            {'texto': 'Cachorro', 'pontuacao' : 10},
            {'texto': 'Gato',  'pontuacao' : 5},
            {'texto': 'Papagaio',  'pontuacao' : 3},
            {'texto': 'Peixe', 'pontuacao': 1},
            ],
        },
        {
          'texto': 'Qual sua linguagem favorita',
          'respostas': [
            { 'texto': 'Javascript','pontuacao':10},
            { 'texto': 'PHP','pontuacao':5},
            { 'texto': 'Java','pontuacao':3},
            { 'texto': 'C#', 'pontuacao':1},
            ],
        }    
     ]; 


    void _responder(int pontuacao) {
      if(temPerguntaSelecionada){
        setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;       
     });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
      return _perguntaSelecionada < _perguntas.length;
    }     


  

  @override
  Widget build(BuildContext context){ 

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada 
         ? Questionario(perguntas: _perguntas, 
                        perguntaSelecionada: _perguntaSelecionada,
                        quandoResponder: _responder)
         : Resultado(_pontuacaoTotal, _reiniciarQuestionario), 
        ),
      );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
}