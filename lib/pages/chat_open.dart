import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';

class ChatOpen extends StatelessWidget {
  const ChatOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 46, 20, 110),
          child: Column(
            children: [
              Row(
                children: [
                  BackArrow(),
                  SizedBox(width: 16,),
                  Expanded(
                    child: ContainerNhac(
                      letrasIcon: 'MS',
                      informacao: 'Maria Silva',
                      complemento: 'Online',
                      corComplemento: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28,),
              Text(
                'Hoje',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey,
                )
              ),
              SizedBox(height: 28,),
              ContainerCardDesign(
                children: ContainerNhac(
                  icon: Icons.receipt,
                  corIcone: Colors.redAccent,
                  informacao: 'Pedido',
                  codigo: 1250,
                  quantidadeItens: 2,
                  preco: 49.90,
                  complemento: 'Em preparo',
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}