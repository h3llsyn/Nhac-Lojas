import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/filter_tag.dart';
import 'package:nhac_lojas/components/orders_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pedidos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterTag(
                    filtro: 'Todos',
                    quantidade: 5,
                    isSelected: true,
                  ),
                  SizedBox(width: 8,),
                  FilterTag(
                    filtro: 'Novos',
                    quantidade: 1,
                    isSelected: false,
                  ),
                  SizedBox(width: 8,),
                  FilterTag(
                    filtro: 'Em preparo',
                    quantidade: 1,
                    isSelected: false,
                  ),
                  SizedBox(width: 8,),
                  FilterTag(
                    filtro: 'A caminho',
                    quantidade: 1,
                    isSelected: false,
                  ),
                  SizedBox(width: 8,),
                  FilterTag(
                    filtro: 'Entregue',
                    quantidade: 2,
                    isSelected: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: OrdersCard(
                codigo: 1250,
                nome: 'Maria Silva',
                quantidadeItens: 2,
                preco: 49.90,
                horario: '12:30',
                situacao: 'Em preparo',
                corSituacaoFundo: const Color.fromARGB(50, 33, 149, 243),
                corSituacao: Colors.blue,
                isHome: false,
                corCirculo: Colors.blue,
              ),
            ),
            SizedBox(height: 12,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: OrdersCard(
                codigo: 1249,
                nome: 'João Pedro',
                quantidadeItens: 3,
                preco: 62.50,
                horario: '12:10',
                situacao: 'A caminho',
                corSituacaoFundo: const Color.fromARGB(50, 255, 82, 82),
                corSituacao: Colors.redAccent,
                isHome: false,
                corCirculo: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}