import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class TipoDeConta extends StatelessWidget {
  const TipoDeConta({super.key});

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
                children: [
                  BackArrow(),
                  const SizedBox(width: 12),
                  const Text(
                    'Tipo de Conta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Que bom te ver por aqui!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Para entrar, escolha o seu tipo de conta',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              ContainerCardDesign(
                children: ContainerNhac(
                  icon: Icons.credit_card_rounded,
                  informacao: 'Sou dono de loja ou restaurante',
                  complemento: 'Quero cadastrar meu estabelecimento',
                ),
              ),
              const SizedBox(height: 16),
              ContainerCardDesign(
                children: ContainerNhac(
                  icon: Icons.person_rounded,
                  informacao: 'Sou dono de loja ou restaurante',
                  complemento: 'Quero cadastrar meu estabelecimento',
                ),
              ),
              Spacer(),
              ButtonNhac(
                texto: 'Continuar',
                onTap: () => context.go('/email'),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}