import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/icon_container.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Container(
                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
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
                      icon: Icons.location_on_outlined,
                      informacao: 'Rua das Flores, 123',
                      complemento: 'Apt 45 - Centro',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'ITENS DO PEDIDO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ContainerNhac(
                      informacao: 'X-Burguer',
                      quantidadeItens: 1,
                      complemento:'Sem cebola',
                      preco: 28.90,
                      precoEmDestaque: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      informacao: 'Batata Frita Média',
                      quantidadeItens: 1,
                      preco: 12.00,
                      precoEmDestaque: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                    SizedBox(height: 8,),
                    ContainerNhac(
                      informacao: 'Coca-Cola 350ml',
                      quantidadeItens: 1,
                      preco: 5.00,
                      precoEmDestaque: true,
                    ),
                    SizedBox(height: 8,),
                    Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                    SizedBox(height: 6,),
                    ContainerNhac(
                      complemento: 'Taxa de entrega',
                      preco: 4.90,
                      precoEmDestaque: true,
                    ),
                    SizedBox(height: 6,),
                    Divider(color: const Color.fromARGB(50, 158, 158, 158),),
                    SizedBox(height: 6,),
                    ContainerNhac(
                      complemento: 'Total',
                      fontSizeComplemento: 14,
                      preco: 49.90,
                      fontSizePreco: 16,
                      precoEmDestaque: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PAGAMENTO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ContainerNhac(
                  icon: Icons.credit_card_rounded,
                  informacao: 'Online · Cartão de crédito',
                ),
              ),
              const SizedBox(height: 16),
              ButtonNhac(
                texto: 'Atualizar status',
                onTap: () => context.push('/update-status'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}