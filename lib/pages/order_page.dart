import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/filter_tag.dart';

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
            Row(
              children: [
                FilterTag(
                  filtro: 'Todos · 26'
                ),
                SizedBox(width: 8,),
                FilterTag(
                  filtro: 'Novos · 5'
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}