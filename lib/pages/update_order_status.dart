import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';

class UpdateOrderStatus extends StatelessWidget {
  const UpdateOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  BackArrow(),
                  SizedBox(width: 16),
                  Text(
                    'Atualizar status',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ContainerCardDesign(
                children: ContainerNhac(
                  icon: Icons.receipt,
                  corIcone: Colors.redAccent,
                  informacao: 'Maria Silva',
                  codigo: 1250,
                  quantidadeItens: 2,
                  preco: 49.90,
                  situacao: 'Em preparo',
                  exibirCirculoSituacao: false,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'ANDAMENTO DO PEDIDO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}