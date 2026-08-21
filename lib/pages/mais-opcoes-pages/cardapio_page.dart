import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/icon_container.dart';

class CardapioPage extends StatelessWidget {
  const CardapioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding( 
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              Row(
                children: [
                  BackArrow(),
                  SizedBox(width: 16),
                  Text(
                    'Cardápio',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  IconContainer(
                    icon: Icons.add,
                  ),
                ],
              ),
              SizedBox(height: 24,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 213, 213),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.store_outlined,
                        size: 60,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Seu cardápio está vazio',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Adicione produtos com fotos, preços e descrição para seus clientes verem na loja.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24),
                    ButtonNhac(
                      texto: 'Adicionar produto',
                      onTap: () => context.go('/cadastrar-produtos'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}