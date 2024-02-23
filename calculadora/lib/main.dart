import 'package:calculadora/components/displaycontroler.dart';
import 'package:flutter/material.dart';
import 'components/botao.dart';
import 'components/display.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  DisplayController displaycontroler = DisplayController();

  String informacao = '';
  String valor = '0';

  final List<String> botoes = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'CE',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        body: Column(
          children: [
            Expanded(child: Display(informacao: informacao, valor: valor)),
            Expanded(
                flex: 3,
                child: Container(
                    child: GridView.builder(
                        itemCount: botoes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (_, index) {
                          //Botão C

                          if (index == 0) {
                            return Botao(
                              apertar: () {
                                setState(() {
                                  informacao = '';
                                  displaycontroler.criarVisor(
                                      informacao, valor);
                                });
                              },
                              color: Colors.green,
                              textoColor: Colors.white,
                              textoBotao: botoes[index],
                            );
                          }
                          //botão delete
                          else if (index == 1) {
                            return Botao(
                              apertar: () {
                                setState(() {
                                  if (informacao.isEmpty) {
                                    return;
                                  } else {
                                    informacao = informacao.substring(
                                        0, informacao.length - 1);
                                    displaycontroler.criarVisor(
                                        informacao, valor);
                                  }
                                });
                              },
                              color: Colors.red,
                              textoColor: Colors.white,
                              textoBotao: botoes[index],
                            );
                          }

                          //botão de igual

                          else if (index == botoes.length - 1) {
                            return Botao(
                              apertar: () {
                                setState(() {
                                  calcular();
                                });
                              },
                              color: Colors.deepPurple,
                              textoColor: Colors.white,
                              textoBotao: botoes[index],
                            );
                          } else {
                            return Botao(
                              apertar: () {
                                setState(() {
                                  informacao = informacao + botoes[index];
                                  displaycontroler.criarVisor(
                                      informacao, valor);
                                });
                              },
                              color: corOperadores(botoes[index])
                                  ? Colors.deepPurple
                                  : const Color.fromARGB(255, 40, 37, 40),
                              textoColor: Colors.white,
                              textoBotao: botoes[index],
                            );
                          }
                        }))),
          ],
        ));
  }

  bool corOperadores(String opd) {
    if (opd == '%' ||
        opd == 'X' ||
        opd == '-' ||
        opd == '+' ||
        opd == '=' ||
        opd == '*' ||
        opd == '/' ||
        opd == 'CE') {
      return true;
    } else {
      return false;
    }
  }

  void calcular() {
    String respostavalor = informacao;
    respostavalor = respostavalor.replaceAll('X', '*');
    if (respostavalor.contains("%")) {
      respostavalor = respostavalor.replaceAll('%', '*');
      respostavalor = respostavalor + "/100";
    }
    Parser p = Parser();
    Expression exp = p.parse(respostavalor);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    valor = eval.toStringAsFixed(2);
  }
}
