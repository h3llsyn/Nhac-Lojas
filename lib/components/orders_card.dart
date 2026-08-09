import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {

  final int codigo;
  final String nome;
  final int quantidadeItens;
  final double preco;
  final String horario;
  final String situacao;
  Color corSituacaoFundo;
  Color corSituacao;
  Color corCirculo;

  OrdersCard({super.key, required this.codigo, required this.nome, required this.quantidadeItens, required this.preco, required this.horario, required this.situacao, this.corSituacaoFundo = Colors.transparent, this.corSituacao = Colors.transparent, this.corCirculo = Colors.transparent});

  @override
  Widget build(BuildContext context) {

    if(situacao == 'Em preparo'){
      corCirculo = Colors.blue;
      corSituacao = Colors.blue;
      corSituacaoFundo = const Color.fromARGB(50, 33, 149, 243);
    }
    else if(situacao == 'A caminho'){
      corCirculo = Colors.redAccent;
      corSituacao = Colors.redAccent;
      corSituacaoFundo = const Color.fromARGB(50, 255, 82, 82);
    }
    else if(situacao == 'Entregue'){
      corCirculo = Colors.green;
      corSituacao = Colors.green;
      corSituacaoFundo = const Color.fromARGB(50, 76, 175, 79);
    }
    else if(situacao == 'Novo'){
      corCirculo = Colors.orange;
      corSituacao = Colors.orange;
      corSituacaoFundo = const Color.fromARGB(50, 255, 153, 0);
    }

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
              Text(
                '$quantidadeItens ${quantidadeItens == 1 ? 'item' : 'itens'} · R\$ ${preco.toStringAsFixed(2)}',
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