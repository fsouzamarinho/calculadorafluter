import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final Color color;
  final Color textoColor;
  final String textoBotao;
  final void Function()? apertar;

  const Botao(
      {required this.color,
      required this.textoColor,
      required this.textoBotao, this.apertar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: apertar,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            height: 20,
            color: color,
            child: Center(
                child: Text(textoBotao,
                    style: TextStyle(
                        color: textoColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25))),
          ),
        ),
      ),
    );
  }
}
