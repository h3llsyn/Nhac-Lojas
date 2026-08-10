import 'package:flutter/material.dart';

// Enum para controlar os 3 estados da mensagem
enum StatusMensagem {
  naoLida,       // Exibe a bolhinha com quantidade de mensagens
  enviada,       // Exibe o ícone de check
  visualizada,   // Não exibe nada (você já leu a mensagem dele)
}

class ChatsCard extends StatelessWidget {
  final String letras;
  final String nome;
  final String mensagem;
  final String horario;
  final StatusMensagem status;
  final int quantidadeMensagens;

  const ChatsCard({
    super.key,
    required this.letras,
    required this.nome,
    required this.mensagem,
    required this.horario,
    this.status = StatusMensagem.visualizada,
    this.quantidadeMensagens = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar circular
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 242, 230),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              letras,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Nome e Mensagem
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                mensagem,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              horario,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            
            // Lógica dos 3 estados:
            _buildStatusWidget(),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusWidget() {
    switch (status) {
      case StatusMensagem.naoLida:
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$quantidadeMensagens',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

      case StatusMensagem.enviada:
        return const Icon(
          Icons.check_rounded,
          color: Colors.green,
        );

      case StatusMensagem.visualizada:
        return const SizedBox(height: 18);
    }
  }
}