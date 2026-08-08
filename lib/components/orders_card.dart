import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {

  final String codigoENome;
  final String preco;
  final String horario;
  final String situacao;
  final Color corSituacaoFundo;
  final Color corSituacao;

  const OrdersCard({super.key, required this.codigoENome, required this.preco, required this.horario, required this.situacao, required this.corSituacaoFundo, required this.corSituacao});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 242, 230),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '🍔',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                codigoENome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                preco,
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