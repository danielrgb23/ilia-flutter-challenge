import 'package:flutter/material.dart';

class TextWrapper extends StatelessWidget {
  final String title;

  TextWrapper({required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define a largura máxima que o texto pode ocupar
        final maxWidth = 100.0;

        // Use um widget Container com largura fixa para garantir a quebra de linha
        return Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}