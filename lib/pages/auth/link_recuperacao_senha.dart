import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_card_design.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/nhac_input_field.dart';

class LinkRecuperacaoSenha extends StatelessWidget {
  const LinkRecuperacaoSenha({super.key});

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
                      Icons.mail_outline_rounded,
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
                'Link enviado!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: 'Enviamos um link de redefinição para\n'),
                    TextSpan(
                      text: 'seu@email.com',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 32, 28),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(
                      text: '. Clique no link\npara criar uma nova senha',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ContainerCardDesign(
                children: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: 'Não recebeu o e-mail? Verifique sua caixa de spam ou '),
                      TextSpan(
                        text: 'reenvie o link',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap =() => context.go('/nova-senha')
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              ButtonNhac(
                texto: 'Voltar para o login',
                onTap: () => context.go('/email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
