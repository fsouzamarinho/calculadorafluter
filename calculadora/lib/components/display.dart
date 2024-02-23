import 'package:flutter/material.dart';


class Display extends StatelessWidget {
  final String? informacao;
  final String? valor;
  const Display({this.informacao,  this.valor});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('$informacao',
                        style: const TextStyle(
                          fontSize: 18,
                        ))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('$valor',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800)))
              ],
            )),
      ),
    );
  }
}
