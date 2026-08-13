import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/icon_container.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BackArrow(),
                const SizedBox(width: 12),
                const Text(
                  'Pedido #1250',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const IconContainer(
                  icon: Icons.print_rounded,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(50, 33, 149, 243),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Em preparo',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'INFORMAÇÕES DO CLIENTE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            ContainerCardDesign(
              children: Column(
                children: [
                  ContainerNhac(
                    icon: Icons.person,
                    informacao: 'Maria Silva'
                  ),
                  SizedBox(height: 8,),
                  Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                  SizedBox(height: 8,),
                  ContainerNhac(
                    icon: Icons.call,
                    informacao: '(11) 98765-4321'
                  ),
                  SizedBox(height: 8,),
                  Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                  SizedBox(height: 8,),
                  ContainerNhac(
                    icon: Icons.place,
                    informacao: 'Rua das Flores, 123',
                    complemento: 'Apt 45 - Centro',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'ITENS DO PEDIDO',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 14),
            ContainerNhac(
              informacao: 'X-Burguer',
              complemento: '1x · Sem cebola',
              preco: 28.90,
            ),
          ],
        ),
      ),
    );
  }
}