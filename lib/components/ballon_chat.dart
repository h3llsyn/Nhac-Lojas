import 'package:flutter/material.dart';

enum StatusLeitura { enviada, lida }

class BallonChat extends StatelessWidget {
  final String texto;
  final String horario;
  final bool ehMinhaMensagem;
  final StatusLeitura? status;

  const BallonChat({
    super.key,
    required this.texto,
    required this.horario,
    required this.ehMinhaMensagem,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final corFundo = ehMinhaMensagem
        ? Colors.redAccent
        : Colors.white;

    final corTexto = ehMinhaMensagem ? Colors.white : Colors.black87;

    final corHorario = Colors.grey;

    final borderRadius = ehMinhaMensagem
        ? const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(2), // Canto "chat" da direita
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(16), // Canto "chat" da esquerda
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(16),
          );

    return Align(
      // Alinha à direita se for loja, à esquerda se for cliente
      alignment: ehMinhaMensagem ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        // Limitamos a largura máxima para o balão não ocupar a tela toda
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: ehMinhaMensagem
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            // --- O BALÃO DE MENSAGEM ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: corFundo,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                texto,
                style: TextStyle(
                  color: corTexto,
                  fontSize: 14,
                  height: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // --- HORÁRIO E CHECK DE LEITURA ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    horario,
                    style: TextStyle(
                      fontSize: 11,
                      color: corHorario,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  // Exibe o check apenas para as mensagens enviadas pela Loja
                  if (ehMinhaMensagem && status != null) ...[
                    const SizedBox(width: 4),
                    Icon(
                      status == StatusLeitura.lida
                          ? Icons.done_all_rounded
                          : Icons.check_rounded,
                      size: 14,
                      color: status == StatusLeitura.lida
                          ? Colors.redAccent
                          : Colors.grey,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}