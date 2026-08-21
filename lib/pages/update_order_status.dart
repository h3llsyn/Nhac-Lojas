import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/order_status.dart';

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
              Container(
                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ContainerNhac(
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
              const SizedBox(height: 16),
              const Text(
                'ANDAMENTO DO PEDIDO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              OrderStatus(
                statusAtual: StatusPedido.emPreparo,
                horarios: const {
                  StatusPedido.recebido: '12:30',
                  StatusPedido.emPreparo: '12:32',
                },
              ),
              Spacer(),
              ButtonNhac(
                texto: 'Salvar status',
                onTap: () => context.pop('/order-details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}