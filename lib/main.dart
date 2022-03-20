import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
       final _perguntas = const [
        {
          'texto': 'Qual sua cor favorita?',
          'respostas': [
            {'texto': 'Preto',  'nota': 10 },
            {'texto': 'Vermelho',  'nota': 5},
            {'texto': 'Branco', 'nota': 3 },
            {'texto': 'Amarelo', 'nota': 1 },
            ],
        },
        {
          'texto': 'Qual seu animal favorito',
          'respostas': [
            {'texto': 'Cachorro', 'nota' : 10},
            {'texto': 'Gato',  'nota' : 5},
            {'texto': 'Papagaio',  'nota' : 3},
            {'texto': 'Peixe', 'nota': 1},
            ],
        },
        {
          'texto': 'Qual sua linguagem favorita',
          'respostas': [
            { 'texto': 'Javascript','nota':10},
            { 'texto': 'PHP','nota':5},
            { 'texto': 'Java','nota':3},
            { 'texto': 'C#', 'nota':1},
            ],
        }    
     ]; 

    bool get temPerguntaSelecionada {
      return _perguntaSelecionada < _perguntas.length;
    }     

    void _responder() {
      if(temPerguntaSelecionada){
        setState(() {
        _perguntaSelecionada++;       
     });
    }
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
         : Resultado(), 
        ),
      );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
}