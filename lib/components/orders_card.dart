import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {

  final int codigo;
  final String nome;
  final int quantidadeItens;
  final double preco;
  final String horario;
  final String situacao;
  final Color corSituacaoFundo;
  final Color corSituacao;
  final Color corCirculo;

  const OrdersCard({super.key, required this.codigo, required this.nome, required this.quantidadeItens, required this.preco, required this.horario, required this.situacao, required this.corSituacaoFundo, required this.corSituacao, required this.corCirculo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          size: 14,
          color: corCirculo,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#$codigo · $nome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              if (quantidadeItens == 1)
                Text(
                  '$quantidadeItens item · R\$ $preco',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              else
                Text(
                  '$quantidadeItens itens · R\$ $preco',
                  style: TextStyle(
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
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: corSituacaoFundo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                situacao,
                style: TextStyle(
                  color: corSituacao,
                  fontSize: 12,
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