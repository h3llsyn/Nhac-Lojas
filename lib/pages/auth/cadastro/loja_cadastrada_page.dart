import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LojaCadastradaPage extends StatelessWidget {
  const LojaCadastradaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 231, 229),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Loja cadastrada com sucesso!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Agora é só preparar os pedidos e\nfazer seu negócio crescer.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              ButtonNhac(
                texto: 'Cadastrar produtos agora',
                onTap: () => context.go('/cadastrar-produtos'),
              ),
              SizedBox(height: 16.h),
              ButtonNhac(
                texto: 'Ir para a home',
                onTap: () => context.go('/home'),
                isSecundario: true,
              ),
              SizedBox(height: 8),
              Text(
                'Você pode adicionar mais produtos depois em',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Mais opções',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}