import 'dart:ffi';

import 'package:flutter/material.dart';

class ChatsCard extends StatelessWidget {

  final String letras;
  final String nome;
  final String mensagem;
  final String horario;
  final bool isRead;
  int quantidadeMensagens;

  ChatsCard({super.key, required this.letras, required this.nome, required this.mensagem, required this.horario, this.quantidadeMensagens = 0, required this.isRead});

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 242, 230),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              letras,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          )
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                mensagem,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              horario,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            isRead ?
            Icon(
              Icons.check_rounded,
              color: Colors.green,
            ) :
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$quantidadeMensagens',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}