import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/register_steps.dart';

class RevisarDadosPage extends StatelessWidget {
  const RevisarDadosPage({super.key});

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
                  'Revise os dados da loja',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Confirme as informações antes de finalizar seu cadastro.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                
                const SizedBox(height: 24),
                ButtonNhac(
                  texto: 'Continuar',
                  onTap: () => context.push('/dados-entrega'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}