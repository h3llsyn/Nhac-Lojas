import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/item_forma_pagamento.dart';
import 'package:nhac_lojas/components/item_horario_funcionamento.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class FormasPagamentoPage extends StatefulWidget {
  const FormasPagamentoPage({super.key});

  @override
  State<FormasPagamentoPage> createState() => _FormasPagamentoPageState();
}

class _FormasPagamentoPageState extends State<FormasPagamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    BackArrow(),
                    SizedBox(width: 12),
                    Text(
                      'Cadastrar loja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                RegisterSteps(passoAtual: PassoCadastrar.pagamento),
                const SizedBox(height: 18),
                const Text(
                  'Formas de pagamento',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Selecione as formas de pagamento que sua loja aceita.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                ItemFormaPagamento(
                  icon: Icons.money_outlined,
                  metodo: 'Dinheiro'
                ),
                Divider(),
                ItemFormaPagamento(
                  icon: Icons.credit_card,
                  metodo: 'Cartão de crédito'
                ),
                Divider(),
                ItemFormaPagamento(
                  icon: Icons.credit_card,
                  metodo: 'Cartão de débito'
                ),
                Divider(),
                ItemFormaPagamento(
                  icon: Icons.bolt_outlined,
                  metodo: 'Pix'
                ),
                Divider(),
                ItemFormaPagamento(
                  icon: Icons.money_outlined,
                  metodo: 'Vale refeição',
                  ativoInicial: false,
                ),
                Divider(),
                ItemFormaPagamento(
                  icon: Icons.money_outlined,
                  metodo: 'Vale alimentação',
                  ativoInicial: false,
                ),
                const SizedBox(height: 24),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.push('/revisar-dados'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
